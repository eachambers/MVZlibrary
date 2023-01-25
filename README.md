# MVZ library color palettes

The Grinnell Miller library at the Museum of Vertebrate Zoology at UC Berkeley contains an impressive collection of XXX

Over my time at UC Berkeley, during MVZ lunch seminars, I would often enjoy looking over the books in the library and spent time admiring them, their spines worn over time into a collection of faded, but rather lovely, colors.

### Installation

The MVZlibrary package is only available on Github, and so must be installed using the `devtools` package. To do so:

```{r install}
devtools::install_github("eachambers/MVZlibrary")
```

### Usage

```{r usage}
library(MVZlibrary)

# See all available palettes
names(MVZ_palette)
```

### Palettes

In total, there are TODO palettes available in the `MVZlibrary` package. TODO are qualitative, TODO are diverging, and TODO are monochromatic. You can have the package tell you which is which using the `MVZ_types()` function. For example:

```{r palette types}
MVZ_types("diverging")
```

#### Life Histories

Life Histories is a diverging palette, inspired by TODO

```{r}
MVZ_palette("LifeHistories")
```

#### Field notes

The MVZ has many bound field notes from notable biologists who have spent time there, including TODO. These field notes, although handwritten, are bound and in TODO. Field Notes is a qualitative palette with seven colors.

```{r}
MVZ_palette("FieldNotes")
```

#### Ensatina

Ensatina is a monochromatic scale palette. Its inspiration is the well-known (in the herpetology world, at least!) salamander that ranges from British Columbia, along the coastal U.S. states, and down into Baja. This genus was made famous by the late Dave Wake, curator of the MVZ. Dr. Wake spent much of his career researching this charismatic group of salamanders.

```{r}
MVZ_palette("Ensatina")
```

#### The Auk

The MVZ library has an impressive collection of bound copies of the journal The Auk, dating from around TODO. The Auk palette is a diverging one.

```{r}
MVZ_palette("TheAuk")
```

#### Zoology

Zoology is a monochromatic palette.

```{r}
MVZ_palette("Zoology")
```

#### Natural History

```{r}
MVZ_palette("NaturalHistory")
```

#### Western Birds

```{r}
MVZ_palette("WesternBirds")
```

### Examples

Below are some examples of the `MVZlibrary` palettes. As you can see, you can adapt these palettes for use in `ggplot2()` using TODO functions.

### Acknowledgements

Much of my code, and the general structure of this package, was inspired by the `wesanderson` package developed by Karthik Ram (find it [here](https://github.com/karthik/wesanderson)), and the `NatParksPalettes` package developed by Kevin Blake (find it [here](https://github.com/kevinsblake/NatParksPalettes)). I would also strongly suggest the wonderful, and fully open access, *Fundamentals of Data Visualization* textbook by Claus Wilke, available online [here](https://clauswilke.com/dataviz/) for advice on use of color in data visualization.
