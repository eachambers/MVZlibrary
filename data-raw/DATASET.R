library(tidyverse)
library(rgdal)
library(cowplot)
library(here)
# devtools::install_github("hrbrmstr/waffle")
# renv::deactivate() # if you get renv activate error
library(waffle)
library(usethis)
library(sf)
library(tigris)
theme_set(theme_cowplot())

# Code to create example data

# Raw data files are from:
#     (1) Bat species at Joshua Tree National Park: https://irma.nps.gov/DataStore/Collection/Profile/7982
#     (2) Species lists from six national parks: https://irma.nps.gov/NPSpecies/ ("Full list with details")


# (1) Bats at JOTR NP -----------------------------------------------------

bat_dat <- read_tsv(here("inst", "extdata", "JOTR_bat_data.txt"), col_names = TRUE)
usethis::use_data(bat_dat, overwrite = TRUE)


# (2) Species lists from six national parks -------------------------------

#' Process NPS species list data
#'
#' @param data path to csv file with data
#' Data files obtained from https://irma.nps.gov/NPSpecies/
#'
#' @return df with only native and present vertebrate species
#' @export
#'
#' @examples
filter_NPS <- function(data) {
  verts <- c("Mammal", "Amphibian", "Bird", "Fish", "Reptile")
  
  dat <-
    read_csv(data, col_names = TRUE) %>%
    dplyr::filter(Nativeness == "Native",
                  Occurrence == "Present") %>%
    dplyr::filter(Category %in% verts)
  
  return(dat)
}

# Filter six national park species lists
CHIS <- filter_NPS(here("inst", "extdata", "NPSpecies_FullListWithDetails_CHIS_20230208103035.csv"))
JOTR <- filter_NPS(here("inst", "extdata", "NPSpecies_FullListWithDetails_JOTR_20230208102947.csv"))
DEVA <- filter_NPS(here("inst", "extdata", "NPSpecies_FullListWithDetails_DEVA_20230208103016.csv"))
SEKI <- filter_NPS(here("inst", "extdata", "NPSpecies_FullListWithDetails_SEKI_20230208102934.csv"))
YOSE <- filter_NPS(here("inst", "extdata", "NPSpecies_FullListWithDetails_YOSE_20230208102941.csv"))

# Bind together dataset
nps_spp <- bind_rows(CHIS, JOTR, DEVA, SEKI, YOSE)

usethis::use_data(nps_spp, overwrite = TRUE)


# (3) Map of California ---------------------------------------------------

# Get CA shapefile
# Download counties from tigris
CA <- tigris::counties("California", cb = TRUE)

ggplot() +
  geom_sf(data = CA, color="black",
                   fill="white", size=0.25) +
  theme_void()




# Test dataset ------------------------------------------------------------

waf <-
  bat_dat %>%
  ggplot(aes(fill = species, values = no_inds)) +
  expand_limits(x = c(0,0), y = c(0,0)) +
  coord_equal() +
  labs(fill = NULL, colour = NULL) +
  theme_void() +
  facet_wrap(~location, ncol = 1, strip.position = "left")

waf +
  geom_waffle(n_rows = 4, size = 0.33, colour = "white")

# Grouped bar plot based on park
dat %>%
  ggplot() +
  geom_bar(aes(y = Category, fill = `Park Name`), position = "dodge")

# Categorize parks based on State Status (if data available)
dat %>%
  filter(!is.na(`State Status`)) %>%
  ggplot() +
  geom_bar(aes(y = `Park Name`, fill = `State Status`))



# "ds2739/ds2739_TerrestrialBiodiversitySummary_ACE.lyr"




