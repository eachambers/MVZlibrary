
#' Complete list of palettes
#'
#'#' Use names(MVZ_palettes) to return all palette names. Current choices are:
#' TODO: fill in \code{XXX}, \code{XXX}
#' Use \code{\link{MVZ_palettes}} to construct palettes
#'
#' @export
MVZ_palettes <- list(
  NaturalHistory = list(c("#054051", "#376988", "#3fa28a", "#82ccc8", "#e0b693", "#c1847e", "#f4a8ab", "#b83247", "#65362d"), c(1, 2, 3, 4, 5, 6, 7, 8, 9), colorblind = FALSE, type = "qualitative"),
  LifeHistories = list(c("#844836", "#b07156", "#b99364", "#dac3a9", "#8fa997", "#6baeb0", "#376988"), c(1, 2, 3, 4, 5, 6, 7), colorblind = FALSE, type = "diverging"),
  theAuk = list(c("#273a66", "#2073b7", "#7992a6", "#9ab8c9", "#d4d8e2", "#ecbeb6", "#c1847e", "#a13549", "#613a42"), c(1, 2, 3, 4, 5, 6, 7, 8, 9), colorblind = FALSE, type = "diverging"),
  Zoology = list(c("#7c5a3f", "#906e53", "#ab8c60", "#c8aa77", "#e9c394"), c(1, 2, 3, 4, 5), colorblind = FALSE, type = "monochromatic"),
  FieldNotes = list(c("#a8b3b2", "#728177", "#3b5d84", "#2073b7", "#59adde", "#c08b4c", "#f8d55e"), c(1, 2, 3, 4, 5, 6, 7), colorblind = FALSE, type = "qualitative"),
  Ensatina = list(c("#a03a34", "#b75334", "#ce5b40", "#dc6958", "#d7886c", "#e49678", "#e0b29f"), c(1, 2, 3, 4, 5, 6, 7), colorblind = FALSE, type = "monochromatic"),
  WesternBirds = list(c("#80312c", "#a35e41", "#3771b3", "#a7778d", "#7e968a", "#5c6854", "#ae9a81"), c(1, 2, 3, 4, 5, 6, 7), colorblind = FALSE, type = "qualitative")
)

#' Title
#'
#' @param type color palette type to print; one of "diverging", "monochromatic", or "qualitative"
#'
#' @return
#' @export
#'
#' @examples
MVZ_types <- function(type = c("diverging", "monochromatic", "qualitative")) {

}


# TODO should i also have qualitative, diverging, sequential here?
#' Title
#'
#' @param name
#' @param n
#' @param type
#'
#' @return
#' @export
#'
#' @examples
MVZ_palette <- function(name, n, type = c("discrete", "continuous", direction = c(1,-1))) {
  # TODO function here
}


#' Title
#'
#' @param name
#'
#' @return
#' @export
#'
#' @examples
print_palette <- function(name) {

}

# colorblind palette check

# plotting with ggplot and mvzlibrary


# Test palettes -----------------------------------------------------------

# n=9, qualitative
NaturalHistory = c("#054051", "#376988", "#3fa28a", "#82ccc8", "#e0b693", "#c1847e", "#f4a8ab", "#b83247", "#65362d")

# n=7, qual or diverging?
LifeHistories = c("#844836", "#b07156", "#b99364", "#dac3a9", "#8fa997", "#6baeb0", "#376988")

# n=9, diverging
theAuk = c("#273a66", "#2073b7", "#7992a6", "#9ab8c9", "#d4d8e2", "#ecbeb6", "#c1847e", "#a13549", "#613a42")

# n=5, monochromatic
Zoology = c("#7c5a3f", "#906e53", "#ab8c60", "#c8aa77", "#e9c394")

# n=7, qualitative
FieldNotes = c("#a8b3b2", "#728177", "#3b5d84", "#2073b7", "#59adde", "#c08b4c", "#f8d55e")

# n=7, monochromatic
Ensatina = c("#a03a34", "#b75334", "#ce5b40", "#dc6958", "#d7886c", "#e49678", "#e0b29f")

# n=7, qualitative
WesternBirds = c("#80312c", "#a35e41", "#3771b3", "#a7778d", "#7e968a", "#5c6854", "#ae9a81")
# ^ alt name is BirdBander

data(mtcars)

test_pal <- function(no_to_keep, col_palette) {
  dat <- mtcars %>%
    rownames_to_column() %>%
    top_n(n = no_to_keep, wt = rowname)

  dat %>%
    ggplot(aes(x=rowname, y=mpg, fill = rowname)) +
    geom_bar(stat = "identity") +
    scale_fill_manual(values = col_palette)
}

test_pal(no_to_keep = 9, col_palette = NaturalHistory)
test_pal(no_to_keep = 7, col_palette = LifeHistories)
test_pal(no_to_keep = 9, col_palette = theAuk)
test_pal(no_to_keep = 5, col_palette = Zoology)
test_pal(no_to_keep = 7, col_palette = FieldNotes)
test_pal(no_to_keep = 7, col_palette = Ensatina)
test_pal(no_to_keep = 7, col_palette = WesternBirds)


