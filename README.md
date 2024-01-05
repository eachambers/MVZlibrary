
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MVZ library color palettes

<img src="photos/library_images.png" align="center" height="400"/>

The Grinnell-Miller library at the [Museum of Vertebrate
Zoology](https://mvz.berkeley.edu/) at UC Berkeley contains an
impressive collection of historical books, including biologists’ field
notes, as well as textbooks, and bound journals.

During the [MVZ weekly lunch
seminars](https://mvz.berkeley.edu/mvz-lunch/) which take place in the
library, I would often admire the colors of the books, their spines worn
over time into a collection of faded colors. I had the thought that it
might be fun to use these colors as R color palettes.

## Installation

------------------------------------------------------------------------

The MVZlibrary package is only available on Github, and so must be
installed using the `devtools` package. To do so:

``` r
devtools::install_github("eachambers/MVZlibrary")
```

## Usage

``` r
# Load library
library(MVZlibrary)
library(tidyverse)
library(cowplot)
theme_set(theme_cowplot())

# See all available palettes
names(MVZ_palettes)
#> [1] "NaturalHistory" "LifeHistories"  "theAuk"         "Zoology"       
#> [5] "FieldNotes"     "Ensatina"       "WesternBirds"

# See whether palette is colorblind friendly
library(colorblindcheck)
MVZ_cb("LifeHistories")
#>           name n tolerance ncp ndcp  min_dist mean_dist max_dist
#> 1       normal 7  11.65306  21   21 11.653063  30.72324 48.19523
#> 2 deuteranopia 7  11.65306  21   20  7.991902  25.95144 46.11145
#> 3   protanopia 7  11.65306  21   19  9.389066  24.70057 41.52459
#> 4   tritanopia 7  11.65306  21   19 10.551762  34.41582 56.67166
```

## Palettes

------------------------------------------------------------------------

In total, there are seven palettes available in the `MVZlibrary`
package. Three are qualitative, two are diverging, and two are
monochromatic. You can have the package tell you which is which using
the `MVZ_type()` function. For example:

``` r
# See all available diverging palettes
MVZ_type("diverging")
#> [1] "LifeHistories" "theAuk"
```

### Field notes

The MVZ has many historical hand-written field notes from notable
biologists which have been bound and live in wooden display cases, and
this palette mimics the colors both of the wood and the bound notes
themselves. Field Notes is a qualitative palette with seven colors.

``` r
MVZ_palette("FieldNotes")
```

<img src="man/figures/README-field notes-1.png" width="100%" />

### Ensatina

<img src="photos/Ensatina.jpg" align="center" height="500"/>

Ensatina is a monochromatic scale palette. Its inspiration is the
well-known (in the herpetology world, at least!) salamander that ranges
from British Columbia, along the coastal U.S. states, and down into
Baja. This genus was made famous by the late Dave Wake, curator of the
MVZ, who spent much of his career researching this group of salamanders.
Coincidentally, many of the books in the MVZ library have colors that
remind me of this charismatic little animal.

``` r
MVZ_palette("Ensatina")
```

<img src="man/figures/README-ensatina-1.png" width="100%" />

### Western Birds

``` r
MVZ_palette("WesternBirds")
```

<img src="man/figures/README-west birds-1.png" width="100%" />

### Natural History

``` r
MVZ_palette("NaturalHistory")
```

<img src="man/figures/README-nat hist-1.png" width="100%" />

### Life Histories

``` r
MVZ_palette("LifeHistories")
```

<img src="man/figures/README-life hist-1.png" width="100%" />

### The Auk

The MVZ library has an impressive collection of bound copies of the
journal [*The Auk*](https://www.jstor.org/journal/auk) (now called
*Ornithology*). The Auk palette is diverging.

``` r
MVZ_palette("theAuk")
```

<img src="man/figures/README-auk-1.png" width="100%" />

### Zoology

<img src="photos/Zoology.jpeg" align="center" height="500"/>

Zoology is a monochromatic palette in browns and tans.

``` r
MVZ_palette("Zoology")
```

<img src="man/figures/README-zoo-1.png" width="100%" />

## Examples

------------------------------------------------------------------------

Below are some examples of the `MVZlibrary` palettes. As you can see,
the palettes can be used quite easily with ggplot2 syntax.

``` r
ggplot(Orange, aes(x = circumference, y = age, color = Tree)) +
  geom_point(size = 3, alpha = 0.8) +
  scale_color_manual(values = MVZ_palette("LifeHistories"))
```

<img src="man/figures/README-examples-1.png" width="100%" />

``` r

pal <- MVZ_palette("Ensatina", 12, type = "continuous")
image(volcano, col = pal)
```

<img src="man/figures/README-examples-2.png" width="100%" />

``` r

ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_raster(aes(fill = density), interpolate = TRUE) +
  scale_fill_gradientn(colors = MVZ_palette("Zoology"))
```

<img src="man/figures/README-examples-3.png" width="100%" />

``` r

pal <- MVZ_palette("LifeHistories", 100, type = "continuous")
heatmap(as.matrix(mtcars), col = pal)
```

<img src="man/figures/README-examples-4.png" width="100%" />

## Acknowledgements

------------------------------------------------------------------------

Much of my code, and the general structure of this package, was inspired
by the `wesanderson` package developed by Karthik Ram (find it
[here](https://github.com/karthik/wesanderson)), and the
`NatParksPalettes` package developed by Kevin Blake (find it
[here](https://github.com/kevinsblake/NatParksPalettes)). For advice on
use of color in data visualization, I highly recommend the wonderful,
and fully open access, *Fundamentals of Data Visualization* textbook by
Claus Wilke, available online [here](https://clauswilke.com/dataviz/).

## Rave reviews

------------------------------------------------------------------------

“Oh, so a color palette based on a bunch of dusty old books?” - Erik
Enbody
