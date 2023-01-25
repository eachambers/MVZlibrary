
#' Complete list of palettes
#'
#'#' Use names(MVZlibrary) to return all possible palette names. Current choices are:
#' TODO: fill in \code{XXX}, \code{XXX}
#' Use \code{\link{MVZlibrary}} to construct palettes
#'
#' @export
MVZlibrary_cols <- list(
  LifeHistories = list(c("#054051", "#376988", "#3fa28a", "#82ccc8", "#e0b693", "#c1847e", "#f4a8ab", "#b83247", "#65362d"), c(1, 2, 3, 4, 5, 6, 7, 8, 9), colorblind = FALSE),
  # TODO: fill in remaining palettes
)


# TODO should i also have qualitative, diverging, sequential here?
MVZlibrary_palettes <- function(name, n, type = c("discrete", "continuous", direction = c(1,-1)) {
  # TODO function here
}


# print palette function

# colorblind palette check

# plotting with ggplot and mvzlibrary


# Test palettes -----------------------------------------------------------

LifeHistories = c("#054051", "#376988", "#3fa28a", "#82ccc8", "#e0b693", "#c1847e", "#f4a8ab", "#b83247", "#65362d")

data(mtcars)

list_nine <- mtcars %>%
  rownames_to_column() %>%
  top_n(n = 9, wt = rowname)

list_nine %>%
  ggplot(aes(x=rowname, y=mpg, fill=rowname)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = LifeHistories)


