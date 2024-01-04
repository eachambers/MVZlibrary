#' Complete list of palettes
#'
#' Use \code{\link{MVZ_palette}} to construct palettes of desired length.
#'
#' @export
MVZ_palettes <- list(
  NaturalHistory = list(c("#054051", "#376988", "#3fa28a", "#82ccc8", "#e0b693", "#c1847e", "#f4a8ab", "#b83247", "#65362d"), type = "qualitative"),
  LifeHistories = list(c("#844836", "#b07156", "#b99364", "#dac3a9", "#8fa997", "#6baeb0", "#376988"), type = "diverging"),
  theAuk = list(c("#273a66", "#2073b7", "#7992a6", "#9ab8c9", "#d4d8e2", "#ecbeb6", "#c1847e", "#a13549", "#613a42"), type = "diverging"),
  Zoology = list(c("#7c5a3f", "#906e53", "#ab8c60", "#c8aa77", "#e9c394"), type = "monochromatic"),
  FieldNotes = list(c("#a8b3b2", "#728177", "#3b5d84", "#2073b7", "#59adde", "#c08b4c", "#f8d55e"), type = "qualitative"),
  Ensatina = list(c("#a03a34", "#b75334", "#ce5b40", "#dc6958", "#d7886c", "#e49678", "#e0b29f"), type = "monochromatic"),
  WesternBirds = list(c("#80312c", "#a35e41", "#3771b3", "#a7778d", "#7e968a", "#5c6854", "#ae9a81"), type = "qualitative")
)

#' Generates MVZ library palette
#'
#' This function is largely adapted from the `wes_palette()` function in the [wesanderson](https://github.com/karthik/wesanderson/tree/master) package.
#'
#' @param name name of palette. Options are: `"NaturalHistory"`, `"LifeHistories"`, `"theAuk"`, `"Zoology"`, `"FieldNotes"`, `"Ensatina"`, `"WesternBirds"`
#' @param n number of desired colors in palette; defaults to all colors in given palette.
#' @param type either `"continuous"` or `"discrete"` (default). Using `"continuous"` will automatically interpolate between colors.
#' @importFrom graphics rect par image text
#'
#' @return a vector of colors
#' @export
#' @examples
#' MVZ_palette(name = "NaturalHistory", type = "continuous", n = 15)
#' MVZ_palette(name = "theAuk", n = 3)
#'
MVZ_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  pal <- MVZ_palettes[[name]][[1]]

  if (is.null(pal))
    stop("MVZ library palette not found!")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("There aren't enough colors in the selected palette!")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' List whether palette is qualitative, diverging, or monochromatic
#'
#' @param name list type of given palette (e.g., `"NaturalHistory"`), list all palettes of desired type (e.g., `"monochromatic"`), or list types of all (`"all"`; default)
#'
#' @return prints types of palettes
#' @export
#' #' @examples
#' MVZ_type(name = "NaturalHistory")
#'
MVZ_type <- function(name = "all") {
  result <- sapply(MVZ_palettes, "[[", 2)
  df <- as.data.frame(result) %>%
    tibble::rownames_to_column(var = "pal_name")

  if (name == "all") {
    result <- result
  }
  else if (name == "diverging" | name == "monochromatic" | name == "qualitative") {
    result <- df %>%
      dplyr::filter(result == name) %>%
      dplyr::pull("pal_name")
  }
  else {
    result <- df %>%
      dplyr::filter(pal_name == name) %>%
      dplyr::pull("result")
  }
  print(result)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  # image(x and y are gridlines,
  # z has values for colors)
  graphics::image(1:n, 1, as.matrix(1:n), col = x,
                  ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  graphics::rect(0, 0.9, n + 1, 1.1, col = grDevices::rgb(1, 1, 1, 0.8), border = NA)
  graphics::text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1)
}

#' Check whether palettes are colorblind friendly
#' Uses the \link[colorblindcheck]{palette_check} function
#'
#' @param name name of MVZ library palette (e.g., `"NaturalHistory"`)
#'
#' @return values for color vision deficiencies
#' @export
MVZ_cb <- function(name) {
  pal <- MVZ_palette(name)
  colorblindcheck::palette_check(pal)
}

