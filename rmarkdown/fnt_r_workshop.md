Data analysis using R and Cloud Computing
================
Marc A.T. Teunis
2017-01-15

<style type="text/css">

body{ /* Normal  */
   font-size: 16px;
}
td {  /* Table  */
   font-size: 12px;
}
h1 { /* Header 1 */
 font-size: 28px;
 color: DarkBlue;
}
h2 { /* Header 2 */
 font-size: 22px;
 color: DarkBlue;
}
h3 { /* Header 3 */
 font-size: 18px;
 color: DarkBlue;
}
code.r{ /* Code block */
  font-size: 16px;
}
pre { /* Code block */
  font-size: 16px
}
</style>
### **Important note: R is case-sensitive, meaning that it will matter whether you use capital or lower case, keep this in mind if you get a cryptic warning or error!**

########################################################## 

Getting Started
===============

########################################################## 

How to run the code in the tutorial below?
==========================================

This document contains code chunks that start with

```` ```{r, ...options...} ````

and end with

```` ``` ```` These so called code chunks contain R code that does something: for example: calculate the mean of 100 random numbers between 0 and 50. Without running the code, can you guess what the mean will approximately be?

Run a code chucks as follows:
-----------------------------

place the cursor somewhere in a code chunk and between the ```` ```{r} ```` and the ```` ``` ```` and press the keys:

`Ctrl` `Shift` and `Enter` simultaneously.

The code will run and the results will show either in the console, or below the code chunk.

Run a line of code as follows: place the cursor somewhere on the line that you want to run. press the keys:

`Cntrl` and `Enter` simultaneously.

You can also run a piece of code by selecting the code by dragging the cursor and left-click mouse, and entering:

`Cntrl` and `Enter` simultaneously.

Introduction
============

This walkthrough is part of the workshop "Data Analysis using R and Cloud Computing". The workshop is meant as an introduction to R and to be able to use R for data exploration on your own data, obtained in a research project. It also shows the strengths of using cloud computing in an educational setting.

Let's look a sophisticated R plot example first before doing anything else: The code below will reproduce the circos plot in the presentation. Do you recognize the plot from the presentation?

``` r
source(paste0(root, "/code/circos_example.R"))
```

Cloud server for RStudio
------------------------

During the workshop, we will be using a preinstalled version of the R-IDE (integrated development environment) RStudio. This version runs on a remote server and has all the add-ons that are needed to run the code. You can login with the credentials supplied at the beginning of the workshop.

The advantage of cloud servers is that the users do not need to install anything on their own laptops. They will be able to access the IDE, using their preferred web-browser on their computer. No installation of packages or further steps are needed.

Contents of the workshop
------------------------

The files needed for this workshop need to be downloaded from github first. Follow the steps below to get started!

There will be too much in this tutorial to be covered in whole during the workshop. The complete walkthough in this document covers many topic in R. It demonstrates how to run code, write functions, work with data-objects, load in data, clean and summarize data, make visualizations, work with "bigger" data sets and also work with biological data. Too much to cover in so little time, so I will make a selection.

Further reading
---------------

At the end of the document you will get tips on how to proceed (with R if you like). A good start could be to repeat this tutorial in full and at your own pace, after that it will be up to you how you will move foRward. See also the folder "documentation" for further info.

About this document: Literate programming
-----------------------------------------

This document is an R-markdown document. It is a nice way to create documents containing normal text, code and output of that code together. It is a form of so-called *"Literate Programming"*, which is part of the "Reproducible research" philosophy. R Markdown can also include and interpret LaTeX, which is used much in the technical fields. see: for example the file "./rpres/example\_LaTeX\_example.html". Open the file in a Web browser.

RStudio Server Instance
-----------------------

An RStudio Server Image had been launched on a remote server at Trans.IP (VULTR.com). This will ensure that everybody can follow the demo, without having to install anything on your computer.

To login to this server:
------------------------

login into the rserver with the credentials you recieved upon entering the room: the webaddress is: rserver.innovativetesting.nl

Cloning the material from Github.com
------------------------------------

1.  Create an account on www.github.com
2.  Login in to github.com and go to www.github.com/maddocent/ilc\_r\_workshop
3.  Copy the *clone* link
4.  Start a new project in RStudio-server, choose *"Version Control"*
5.  Copy the 'clone' link in the 'url' field, press enter
6.  Let the clone finish

**Follow the steps above first before continuing**

Did it work? Please let me know if not.

Installing required packages
----------------------------

There will be no need to install aditonional R add-ons. everything has already been installed on the cloud server.

Installed packages
------------------

To see all packages that are already installed:

``` r
library(tidyverse)
installed_packages <- installed.packages()
print(as_tibble(installed_packages))
```

    ## # A tibble: 185 × 16
    ##          Package                                                LibPath
    ##            <chr>                                                  <chr>
    ## 1        deSolve /home/FNT_ond_01/R/x86_64-redhat-linux-gnu-library/3.3
    ## 2          ggvis /home/FNT_ond_01/R/x86_64-redhat-linux-gnu-library/3.3
    ## 3        packrat /home/FNT_ond_01/R/x86_64-redhat-linux-gnu-library/3.3
    ## 4  scatterplot3d /home/FNT_ond_01/R/x86_64-redhat-linux-gnu-library/3.3
    ## 5    shinythemes /home/FNT_ond_01/R/x86_64-redhat-linux-gnu-library/3.3
    ## 6         teachR /home/FNT_ond_01/R/x86_64-redhat-linux-gnu-library/3.3
    ## 7  AnnotationDbi                                   /usr/lib64/R/library
    ## 8  AnnotationHub                                   /usr/lib64/R/library
    ## 9     assertthat                                   /usr/lib64/R/library
    ## 10     backports                                   /usr/lib64/R/library
    ## # ... with 175 more rows, and 14 more variables: Version <chr>,
    ## #   Priority <chr>, Depends <chr>, Imports <chr>, LinkingTo <chr>,
    ## #   Suggests <chr>, Enhances <chr>, License <chr>, License_is_FOSS <chr>,
    ## #   License_restricts_use <chr>, OS_type <chr>, MD5sum <chr>,
    ## #   NeedsCompilation <chr>, Built <chr>

Installing and loading additional packages
------------------------------------------

If you want to install a package manually, run:

`install.packages("package_name")`

To load a package manually:

`library(package_name)` or `library("package_name")`

Please note the difference in use of *"double-quotes"* above.

R Graphics
==========

Histograms and normal distributions
-----------------------------------

Run the code below.

-   See what happens if you increase the number of datapoints from 1000 to 100000 in the function `normal <- rnorm(1000, ...)`. What happens to the plot?
-   What does changing the `sd` argument do?
-   What does changing the `binwidth = 1` parameter in the call for the plot do? Try setting it to a higher or lower number
-   Can you guess what `set.seed` does?

``` r
set.seed(seed = 10)
normal <- rnorm(1000, mean = 10, sd = 2)

normal <- as.data.frame(normal)

## create histogram of object "numbers"
library(ggplot2)
g <-ggplot(normal, aes(x=normal)) 

# Histogram with density instead of count on y-axis
plot <- g + 
    geom_histogram(aes(y=..density..),      
                   binwidth = 1,
                   colour = "black", fill = "white") +
    geom_density(alpha = .2, fill = "#FF6666") + xlab("value")  
# Overlay with transparent density plot 
plot
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-3-1.png)

Other distributions examples
----------------------------

There are other distributions that the normal distribution.

``` r
distributions <- data.frame(std.normal=rnorm(10000, m=0, sd=1),
                     wide.normal=rnorm(10000, m=0, sd=2),
                     exponent=rexp(10000, rate=2),
                     uniform=runif(10000, min=-3, max=3)
                     )
```

The plots depict two additional distributions. Can you think of one or two other distrubutions, not included?

``` r
# Exponential decay distribution plot
plot_exp <- ggplot(distributions, aes(x= exponent)) +
  geom_histogram(aes(y=..density..),      
                   binwidth=1,
                   colour="black", fill="white") +
    geom_density(alpha=.2, fill="blue") + xlab("value")  

# Uniform distribution density plot 
plot_uniform <- ggplot(distributions, aes(x= uniform)) +
  geom_histogram(aes(y=..density..),      
                   binwidth=1,
                   colour="black", fill="white") +
    geom_density(alpha=.2, fill="green") + xlab("value")  

# Panel with both plots 

cowplot::plot_grid(plot_exp, plot_uniform, labels = c("Exponential", "Uniform"), hjust = -1)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-5-1.png)

Bimodal distributions
---------------------

There is one other distribution that I want to show. We will look at this distribution using one of R's build-in datasets: the eruptions of the Yellowstone Geyser "Old Faithful". Information on the dataset can be found running the command `?faithful` in the console.

``` r
 library(mixtools)
data(faithful)
faithful <- as_tibble(faithful)
faithful
```

    ## # A tibble: 272 × 2
    ##    eruptions waiting
    ## *      <dbl>   <dbl>
    ## 1      3.600      79
    ## 2      1.800      54
    ## 3      3.333      74
    ## 4      2.283      62
    ## 5      4.533      85
    ## 6      2.883      55
    ## 7      4.700      88
    ## 8      3.600      85
    ## 9      1.950      51
    ## 10     4.350      85
    ## # ... with 262 more rows

``` r
### distribution plot
plot_faithful <- ggplot(faithful, aes(x= waiting)) +
  geom_histogram(aes(y=..density..),      
                   binwidth=1,
                   colour="black", fill="white") +
    geom_density(alpha=.2, fill="darkgreen") + xlab("Minutes") + 
  ggtitle("Waiting time between eruptions")  

plot_faithful
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-6-1.png)

Which conclusion can you derive from this plot about the waiting time?

Shiny apps
==========

Shiny is an open source application that can powerfully illustrate the use of R to generate visualizations.

There are many, many examples on nice shiny apps that can illustrate e.g. complex mathematical or statistical models. See <HTTP://shiny.rstudio.com/> See e.g. the example on different chemical educational shiny apps: <HTTP://dpuadweb.depauw.edu/harvey_web/shiny.html>

Visual respresentations
=======================

**The text below was partly reproduced and adapted from "R for Data Science" by Garrett Grolemund and Hadley Wickam, 2016**

To view the book: <http://r4ds.had.co.nz/>

Build in datasets in R
----------------------

For this exercise we will use the "mpg" (miles per gallon) dataset, available in R.

To get info on the dataset: `?mpg`

To load the dataset:

``` r
library(tidyverse)
mpg
```

    ## # A tibble: 234 × 11
    ##    manufacturer      model displ  year   cyl      trans   drv   cty   hwy
    ##           <chr>      <chr> <dbl> <int> <int>      <chr> <chr> <int> <int>
    ## 1          audi         a4   1.8  1999     4   auto(l5)     f    18    29
    ## 2          audi         a4   1.8  1999     4 manual(m5)     f    21    29
    ## 3          audi         a4   2.0  2008     4 manual(m6)     f    20    31
    ## 4          audi         a4   2.0  2008     4   auto(av)     f    21    30
    ## 5          audi         a4   2.8  1999     6   auto(l5)     f    16    26
    ## 6          audi         a4   2.8  1999     6 manual(m5)     f    18    26
    ## 7          audi         a4   3.1  2008     6   auto(av)     f    18    27
    ## 8          audi a4 quattro   1.8  1999     4 manual(m5)     4    18    26
    ## 9          audi a4 quattro   1.8  1999     4   auto(l5)     4    16    25
    ## 10         audi a4 quattro   2.0  2008     4 manual(m6)     4    20    28
    ## # ... with 224 more rows, and 2 more variables: fl <chr>, class <chr>

Fuel consumption vs engine size
-------------------------------

Let's use our first graph to answer a question: Do cars with big engines use more fuel than cars with small engines? You probably already have an answer, but try to make your answer precise. What does the relationship between engine size and fuel efficiency look like? Is it positive? Negative? Linear? Nonlinear?

Among the variables in `mpg` are:

1.  `displ`, a car's engine size (**displacement**), in litres.

2.  `hwy`, a car's fuel efficiency on the highway, in miles per gallon (mpg).

A car with a low fuel efficiency consumes more fuel than a car with a high fuel efficiency when they travel the same distance.

### Creating a ggplot

To plot `mpg`, run this code to put `displ` on the x-axis and `hwy` on the y-axis:

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-8-1.png)

The plot shows a negative relationship between engine size (`displ`) and fuel efficiency (`hwy`).

With ggplot2, you begin a plot with the function `ggplot()`. The first argument of `ggplot()` is the dataset to use in the graph.

You complete your graph by adding one or more layers to `ggplot()`. The function `geom_point()` adds a layer of points to your plot, which creates a scatterplot. ggplot2 comes with many geom functions that each add a different type of layer to a plot.

Each geom function in ggplot2 takes a `mapping` argument. This defines how variables in your dataset are mapped to visual properties. The `mapping` argument is always paired with `aes()`, and the `x` and `y` arguments of `aes()` specify which variables to map to the x and y axes. ggplot2 looks for the mapped variable in the `data` argument, in this case, `mpg`.

Aesthetic mappings
------------------

In the plot below, one group of points (highlighted in red) seems to fall outside of the linear trend. These cars have a higher mileage than you might expect. How can you explain these cars?

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-9-1.png)

Let's hypothesize that the cars are hybrids. One way to test this hypothesis is to look at the `class` value for each car. The `class` variable of the `mpg` dataset classifies cars into groups such as compact, midsize, and SUV. If the outlying points are hybrids, they should be classified as compact cars or, perhaps, subcompact cars (keep in mind that this data was collected before hybrid trucks and SUVs became popular).

You can add a third variable, like `class`, to a two dimensional scatterplot by mapping it to an **aesthetic**. An aesthetic is a visual property of the objects in your plot. Aesthetics include things like the size, the shape, or the color of your points.

You can convey information about your data by mapping the aesthetics in your plot to the variables in your dataset. For example, you can map the colors of your points to the `class` variable to reveal the class of each car.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-10-1.png)

To map an aesthetic to a variable, associate the name of the aesthetic to the name of the variable inside `aes()`. ggplot2 will automatically assign a unique level of the aesthetic (here a unique color) to each unique value of the variable, a process known as **scaling**. ggplot2 will also add a legend that explains which levels correspond to which values.

The colors reveal that many of the unusual points are two-seater cars. These cars don't seem like hybrids, and are, in fact, sports cars! Sports cars have large engines like SUVs and pickup trucks, but small bodies like midsize and compact cars, which improves their gas mileage. In hindsight, these cars were unlikely to be hybrids since hybrids have smaller engine sizes.

Or we could have mapped `class` to the *alpha* aesthetic, which controls the transparency of the points, or the shape of the points.

``` r
# class as colour shades with setting alpha 
alpha <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# class as shapes
shape <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

library(cowplot)

cowplot::plot_grid(alpha, shape, labels = c("alpha", "shape"), 
                   hjust = -3.0)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-11-1.png)

What happened to the SUVs? ggplot2 will only use six shapes at a time. By default, additional groups will go unplotted when you use the shape aesthetic.

You can also *set* the aesthetic properties of your geom manually. For example, we can make all of the points in our plot blue and an open triangle (see shapes below):

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue", shape = 24)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-12-1.png)

Here, the color doesn't convey information about a variable, but only changes the appearance of the plot.

-   What happens if you change 24 to 21?
-   why are certain blue point darker than others?

You'll need to pick a value that makes sense for that aesthetic:

-   The name of a color as a character string.

-   The size of a point in mm.

-   The shape of a point as a number, as shown below:

<img src="fnt_r_workshop_files/figure-markdown_github/shapes-1.png" alt="R has 25 built in shapes that are identified by numbers. There are some seeming duplicates: for example, 0, 15, and 22 are all squares. The difference comes from the interaction of the `colour` and `fill` aesthetics. The hollow shapes (0--14) have a border determined by `colour`; the solid shapes (15--18) are filled with `colour`; the filled shapes (21--24) have a border of `colour` and are filled with `fill`." width="75%" />
<p class="caption">
R has 25 built in shapes that are identified by numbers. There are some seeming duplicates: for example, 0, 15, and 22 are all squares. The difference comes from the interaction of the `colour` and `fill` aesthetics. The hollow shapes (0--14) have a border determined by `colour`; the solid shapes (15--18) are filled with `colour`; the filled shapes (21--24) have a border of `colour` and are filled with `fill`.
</p>

Problems writing R code and getting help
----------------------------------------

Writing R code can be challenging and espacially in the beginning you will get mind-boggling errors. R is extremely picky about capitals and every opening `(` must be matched by a closing `)`. Mind that `.` is the decimal placeholder!

If you're stuck, try the help. You can get help about any R function by running `?function_name` and `?package_name` or `??package_name` , skip down to the examples and look for code that matches what you're trying to do.

Another great tool is Google: trying googling the error message, as it's likely someone else has had the same problem, and has gotten help online.

Facets
------

One way to add additional variables is with aesthetics. Another way, particularly useful for categorical variables, is to split your plot into **facets**, subplots that each display one subset of the data.

To facet your plot by a single variable, use `facet_wrap()`. The first argument of `facet_wrap()` should be a formula, which you create with `~` followed by a variable name (here "formula" is the name of a data structure in R, not a synonym for "equation"). The variable that you pass to `facet_wrap()` should be discrete.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-13-1.png)

To facet your plot on the combination of two variables, add `facet_grid()` to your plot call. The first argument of `facet_grid()` is also a formula. This time the formula should contain two variable names separated by a `~`.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-14-1.png)

Geometric objects
-----------------

How are these two plots similar?

<img src="fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-15-1.png" width="50%" />

Grammar of Graphics
-------------------

Both plots contain the same x variable, the same y variable, and both describe the same data. But the plots are not identical. Each plot uses a different visual object to represent the data. In ggplot2 syntax, we say that they use different **geoms**.

A **geom** is the geometrical object that a plot uses to represent data. People often describe plots by the type of geom that the plot uses. For example, bar charts use bar geoms, line charts use line geoms, boxplots use boxplot geoms, and so on. Scatterplots break the trend; they use the point geom. As we see above, you can use different geoms to plot the same data. The plot on the left uses the point geom, and the plot on the right uses the smooth geom, a smooth line fitted to the data.

Every geom function in ggplot2 takes a `mapping` argument. However, not every aesthetic works with every geom. You could set the shape of a point, but you couldn't set the "shape" of a line. On the other hand, you *could* set the linetype of a line. `geom_smooth()` will draw a different line, with a different linetype, for each unique value of the variable that you map to linetype.

``` r
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-16-1.png)

Here `geom_smooth()` separates the cars into three lines based on their `drv` value, which describes a car's drivetrain. One line describes all of the points with a `4` value, one line describes all of the points with an `f` value, and one line describes all of the points with an `r` value. Here, `4` stands for four-wheel drive, `f` for front-wheel drive, and `r` for rear-wheel drive.

If this sounds strange, we can make it more clear by overlaying the lines on top of the raw data and then coloring everything according to `drv`.

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-17-1.png)

Notice that this plot contains three geoms in the same graph!

ggplot2 provides over 30 geoms, and extension packages provide even more (see <https://www.ggplot2-exts.org> for a sampling). The best way to get a comprehensive overview is the ggplot2 cheatsheet, which you can find at <http://rstudio.com/cheatsheets>. To learn more about any single geom, use help: `?geom_smooth`.

To display multiple geoms in the same plot, add multiple geom functions to `ggplot()`:

``` r
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# note the mapping of the aes in ggplot here. We can do individual mapping to the geoms seperately but in this way we save typing and increase readibility of the code.
```

If you place mappings in a geom function, ggplot2 will treat them as local mappings for the layer. It will use these mappings to extend or overwrite the global mappings *for that layer only*. This makes it possible to display different aesthetics in different layers.

``` r
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-19-1.png)

You can use the same idea to specify different `data` for each layer. Here, our smooth line displays just a subset of the `mpg` dataset, the subcompact cars. The local data argument in `geom_smooth()` overrides the global data argument in `ggplot()` for that layer only.

``` r
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-20-1.png)

(You'll learn how `filter()` works in the next section: for now, just know that this command selects only the subcompact cars.)

Statistical transformations
---------------------------

Next, let's take a look at a bar chart. Bar charts seem simple, but they are interesting because they reveal something subtle about plots. Consider a basic bar chart, as drawn with `geom_bar()`. The following chart displays the total number of diamonds in the `diamonds` dataset, grouped by `cut`. The `diamonds` dataset comes in ggplot2 and contains information about ~54,000 diamonds, including the `price`, `carat`, `color`, `clarity`, and `cut` of each diamond. The chart shows that more diamonds are available with high quality cuts than with low quality cuts.

``` r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-21-1.png)

On the x-axis, the chart displays `cut`, a variable from `diamonds`. On the y-axis, it displays count, but count is not a variable in `diamonds`! Where does count come from? Many graphs, like scatterplots, plot the raw values of your dataset. Other graphs, like bar charts, calculate new values to plot:

-   bar charts, histograms, and frequency polygons bin your data and then plot bin counts, the number of points that fall in each bin.

-   smoothers fit a model to your data and then plot predictions from the model.

-   boxplots compute a robust summary of the distribution and then display a specially formatted box.

ggplot2 provides over 20 stats for you to use. Each stat is a function, so you can get help in usual way, e.g. `?stat_bin`. To see a complete list of stats, try the ggplot2 cheatsheet.

Position adjustments
--------------------

There's one more piece of magic associated with bar charts. You can colour a bar chart using either the `colour` aesthetic, or more usefully, `fill`:

``` r
colours <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

more_colours <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


panel3 <- cowplot::plot_grid(colours, more_colours, labels = c("colours", 
"even more colours"), hjust = -1) 
  
panel3
```

<img src="fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-22-1.png" width="50%" />

Note what happens if you map the fill aesthetic to another variable, like `clarity`: the bars are automatically stacked. Each colored rectangle represents a combination of `cut` and `clarity`.

``` r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-23-1.png)

The stacking is performed automatically by the **position adjustment** specified by the `position` argument. If you don't want a stacked bar chart, you can use one of three other options: `"identity"`, `"dodge"` or `"fill"`.

-   `position = "identity"` will place each object exactly where it falls in the context of the graph. This is not very useful for bars, because it overlaps them. To see that overlapping we either need to make the bars slightly transparent by setting `alpha` to a small value, or completely transparent by setting `fill = NA`.

``` r
  stacked <- ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
      geom_bar(alpha = 1/5, position = "identity")
  
  stacked_not_filled <- ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
      geom_bar(fill = NA, position = "identity")
    
cowplot::plot_grid(stacked, stacked_not_filled)    
```

<img src="fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-24-1.png" width="50%" />

    The identity position adjustment is more useful for 2d geoms, like points,
    where it is the default.

-   `position = "fill"` works like stacking, but makes each set of stacked bars the same height. This makes it easier to compare proportions across groups.

``` r
    ggplot(data = diamonds) + 
      geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-25-1.png)

-   `position = "dodge"` places overlapping objects directly *beside* one another. This makes it easier to compare individual values.

``` r
    ggplot(data = diamonds) + 
      geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-26-1.png)

There's one other type of adjustment that's not useful for bar charts, but it can be very useful for scatterplots. Recall our first scatterplot. Did you notice that the plot displays only 126 points, even though there are 234 observations in the dataset?

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-27-1.png)

The values of `hwy` and `displ` are rounded so the points appear on a grid and many points overlap each other. This problem is known as **overplotting**. This arrangement makes it hard to see where the mass of the data is. Are the data points spread equally throughout the graph, or is there one special combination of `hwy` and `displ` that contains 109 values?

You can avoid this gridding by setting the position adjustment to "jitter". `position = "jitter"` adds a small amount of random noise to each point. This spreads the points out because no two points are likely to receive the same amount of random noise.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-28-1.png)

Adding randomness seems like a strange way to improve your plot, but while it makes your graph less accurate at small scales, it makes your graph *more* revealing at large scales. Because this is such a useful operation, ggplot2 comes with a shorthand for `geom_point(position = "jitter")`: `geom_jitter()`.

To learn more about a position adjustment, look up the help page associated with each adjustment: `?position_dodge`, `?position_fill`, `?position_identity`, `?position_jitter`, and `?position_stack`.

The layered grammar of graphics
-------------------------------

In the previous sections, you learned much more than how to make scatterplots, bar charts, and boxplots. You learned a foundation that you can use to make *any* type of plot with ggplot2. To see this, let's add position adjustments, stats, coordinate systems, and faceting to our code template:

    ggplot(data = <DATA>) + 
      <GEOM_FUNCTION>(
         mapping = aes(<MAPPINGS>),
         stat = <STAT>, 
         position = <POSITION>
      ) +
      <COORDINATE_FUNCTION> +
      <FACET_FUNCTION>

Our new template takes seven parameters, the bracketed words that appear in the template. In practice, you rarely need to supply all seven parameters to make a graph because ggplot2 will provide useful defaults for everything except the data, the mappings, and the geom function.

The seven parameters in the template compose the grammar of graphics, a formal system for building plots. The grammar of graphics is based on the insight that you can uniquely describe *any* plot as a combination of a dataset, a geom, a set of mappings, a stat, a position adjustment, a coordinate system, and a faceting scheme.

########################################################################## 

########################################################################## 

Reproducible research.
======================

I do not think it is necessary to explain the literal meaning of reproducible research. All of you can grasp what is about. But, from a data scientists' point of view the term it is probable slightly more complex.

In data science reproducible research is the possibility to reproduce every step in the process of data analysis. Meaning from the moment a data-file (sometimes in it's very rudimentary and raw form) is received, to the final reporting of all the steps that were undertaken to do an analysis. This process is usually characterized by the following steps:

1.  Getting data: getting data in the context of R means getting the (raw) data file into R

2.  Inspecting the data: means getting an idea of what kind of data the data file contains, how many variables, how many observations, what kind of experiment, what kind of groups and how many, so basically: getting an idea of the experimental design.

3.  Cleaning the data: Usually the data is not yet in an analyzable form. Cleaning the data to a tidy data frame, with consistent naming of variables e.g., normally takes a lot of time and is the most crucial step in preparation for any analysis to come after.

4.  Exploratory data analysis: In this step an initial set of graphical representations of the data are generated. It serves to identify trends, to get summarizing results of the data in a graph and to explore the data. This is a preparative step for the step hereafter.

5.  Statistical inference: the *formal* data analysis. The process of checking assumptions, relating the data to scientific questions and hypotheses. The analysis uses statistical methods, appropriate for the design of the data and the experiment.

6.  Reporting: The process of writing the analysis into a comprehensive report, according a set of rules, and compliant to the standard of the field of research. Preferable the report is written in such a way that reproduction of the whole of experiment + data analysis can be followed through by a peer, and reproduced if necessary.

An important tool in reproducible research in R are the "rmarkdown" and "knitr" packages. The document that is in front of you is an Rmd file, an "RMarkdown" file. Markdown is a simple mark-up language that potentiates the use of simply coding for layouting documents. One of the most famous and widely used mark-up languages is HTML, which is broadly used for \_marking up\_\_ web pages. RMarkdown is an implementation of Markdown language in R. Together with the *knitr* package, it is a powerful tool to bring the principle of *literate programming* into practice. It is one of the most important implementation tools for reproducible research in the R language.

For a full example of reproducible research, see: <https://rpubs.com/maddocent/storm>

Statistics and R
================

This workshop does not cover statistical applications of R. Allbeit that we will look at an example of a linear regression later on. Nowadays R is a versatile language and can be used for various applications, but it was originally designed as a language for performing statistical analyses. This is why very many statistical applcations are available for R. To start learning about statisics and R, I can highly recommend the book "Discovering Statistics Using R" by Dr. Andy Field: <https://uk.sagepub.com/en-gb/eur/discovering-statistics-using-r/book236067%20>

R is also a very useful tool in teaching students about statistics. The way that R can be used interactively in explaning difficult concepts like distributions, assumptions, expectations, probability and power and variance can be really helpful in the classroom.

For more on learning R in the context of statistics: start e.g. with:

<http://www.statsteachr.org/> or

<https://www.coursera.org/learn/statistical-inference/home/welcome> or

<https://www.youtube.com/watch?v=ACWuV16tdhY&index=21&list=PLqzoL9-eJTNBDdKgJgJzaQcY6OXmsXAHU> and

<https://www.youtube.com/watch?v=kvmSAXhX9Hs&index=29&list=PLqzoL9-eJTNBDdKgJgJzaQcY6OXmsXAHU>

and the rest of Mike Marin's lectures, that are a really great way to start learning R.

Basic topics for working with R
===============================

Packages
--------

### List of available CRAN packages

<http://cran.r-project.org/web/packages/available_packages_by_date.html>

### Biological Packages

For Biological application go to <http://www.bioconductor.org>

Installing Bioconductor packages is easy with `pacman::p_load` function

``` r
library(pacman)
## a CRAN package to analyze affymetrix expression data   
pacman::p_load(affy)

## loading affy package and the vignettes pages of this package
library(affy)
browseVignettes("affy")

## and a BIOCONDUCTOR package to analyze LCMS data
pacman::p_load(xcms)
library(xcms)
??xcms
browseVignettes("xcms")
```

Vignettes are long explanations and demos of a package. Commonly, a vignette contains examples and a workflow that shows how the package can be used and which (research) questions can be adressed with the functions and datasets in the package. It usually is a good place to start for examples. It also shows the so-called dependence of a package: it explains which other packages you would need and how the data should look to be able to work with the package the vignette belongs to.

### Getting Help for R functions and packages

``` r
install.packages("dplyr")
library(dplyr)
library(ggplot2)
??dplyr
??ggplot2
?mean
??mean  # go's to the page with functions related with '.mean.'
apropos("mean") # search on more options of or alternatives for a certain function
```

### Examples and demos on functions and packages

``` r
example(mean) # to see a worked example

demo(graphics) # demonstration of R functions
```

Data objects
============

Vectors
-------

R is an object oriented language: meaning you can create and work with (manipulate/index/access) objects. Vectors are R's elementary objects and come in different flavours:

1.  Nummeric vector: contains only numbers: decimal separator in R is "." (decimal point) and not "," (decimal comma) as is common in the English language.

2.  Character vector: contains only "words", but words can also be numbers: "23" or other items "100%" or "$2,000.00"

3.  An integer vector: an nummeric series: 1, 2, 3 is an integer of length 3.

4.  Logical: logical vectors contain only two values: "TRUE" and/or "FALSE"

5.  Mixed: Vectors do not need to be of one type. They can be mixed. They can only be of one class, so this operation will induce ***coercion***.

### Numeric vectors

``` r
c(2,8,5)    # combines its arguments to form a vector
```

    ## [1] 2 8 5

``` r
nv_1 <- c(2,8,5) # assignment statement (use 'alt' + '-' OR 'option' + '-')
nv_1 # view the content of the object "x"
```

    ## [1] 2 8 5

``` r
# combine commands on the same line seperate with ';'
nv_2 <- c(8.4,5.6,10.1,13.1,2.5,7.8,15.2,3.8,20.9); nv_2
```

    ## [1]  8.4  5.6 10.1 13.1  2.5  7.8 15.2  3.8 20.9

``` r
class(nv_2)
```

    ## [1] "numeric"

### Character vectors

``` r
cv <- c("this is", "an", "example of", "1", "character", "vector", "with length:", "length(cv)")
cv
```

    ## [1] "this is"      "an"           "example of"   "1"           
    ## [5] "character"    "vector"       "with length:" "length(cv)"

``` r
length(cv)
```

    ## [1] 8

``` r
class(cv)
```

    ## [1] "character"

### Integers

``` r
int <- as.integer(1:5)
int
```

    ## [1] 1 2 3 4 5

``` r
length(int)
```

    ## [1] 5

``` r
class(int)
```

    ## [1] "integer"

### Logical vectors

``` r
lv <- c(TRUE, FALSE, TRUE, TRUE)
lv
```

    ## [1]  TRUE FALSE  TRUE  TRUE

``` r
class(lv)
```

    ## [1] "logical"

``` r
## logical vectors can also be converted to numeric vectors
nlv <- as.numeric(lv)
nlv
```

    ## [1] 1 0 1 1

``` r
## note that coercion of a logical to a numeric vector changes the "TRUE" value to 1 and the "FALSE" value to 0
```

Manipulating vectors
--------------------

You can add/subtract/devide or use other arithmetic functions on numeric vectors

``` r
a <- c(1,3,5,7,9)
b <- c(2,4,6,8,10)

z1 <- a - b
z1
```

    ## [1] -1 -1 -1 -1 -1

``` r
z2 <- b - a
z2
```

    ## [1] 1 1 1 1 1

``` r
z3 <- a / b
z3
```

    ## [1] 0.5000000 0.7500000 0.8333333 0.8750000 0.9000000

``` r
z4 <- sum(a)
z4
```

    ## [1] 25

``` r
z5 <- max(a) - max(b)
z5
```

    ## [1] -1

You can get the individual items of a vector by using the index "[](#section-6)"

``` r
x<-c(8,5,10,13,2,7,15,3,20,8);x # create vector with 10 variables
```

    ##  [1]  8  5 10 13  2  7 15  3 20  8

``` r
length(x)
```

    ## [1] 10

``` r
mode(x) # information on data mode (numeric, character, logic)
```

    ## [1] "numeric"

``` r
class(x)
```

    ## [1] "numeric"

``` r
## using the index
x[3]
```

    ## [1] 10

``` r
## creating a subset by indexing:
x[c(3, 4, 7)]
```

    ## [1] 10 13 15

``` r
# apply a simple function
mean(x) # example of a function
```

    ## [1] 9.1

``` r
max(x)
```

    ## [1] 20

``` r
quantile(x)
```

    ##    0%   25%   50%   75%  100% 
    ##  2.00  5.50  8.00 12.25 20.00

``` r
## Using the vector index "[]" some more
# extra data from vector
x[5] # (i = 5), ith element
```

    ## [1] 2

``` r
x[-2] # all but the ith (second) element
```

    ## [1]  8 10 13  2  7 15  3 20  8

``` r
x[3:5] # element 3 to 5
```

    ## [1] 10 13  2

``` r
x[x>9] # all greater than some value
```

    ## [1] 10 13 15 20

``` r
# manipulations
y <- c(x,0,x); y # separate multiple commands on the same line with ";"
```

    ##  [1]  8  5 10 13  2  7 15  3 20  8  0  8  5 10 13  2  7 15  3 20  8

``` r
sum(y) # sum of elements in the vector
```

    ## [1] 182

### Plotting series/vectors

``` r
c <- c(1:7,9,11)
d <- c(1:9)

# performing a linear correlation
m1 <- lm(c ~ d)
summary(m1)
```

    ## 
    ## Call:
    ## lm(formula = c ~ d)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.70000 -0.33333  0.03333  0.21667  0.93333 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -0.58333    0.38670  -1.508    0.175    
    ## d            1.18333    0.06872  17.220 5.47e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.5323 on 7 degrees of freedom
    ## Multiple R-squared:  0.9769, Adjusted R-squared:  0.9736 
    ## F-statistic: 296.5 on 1 and 7 DF,  p-value: 5.47e-07

``` r
# make a plot 
plot(c, d, ylim=c(0,13))
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-38-1.png)

``` r
plot(c, d, ylim=c(0,13), abline(m1))  #abline plots the correaltion model in the graph
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-38-2.png)

``` r
m1$coefficients
```

    ## (Intercept)           d 
    ##  -0.5833333   1.1833333

### Handeling character vectors

What happens if you use arithmetic functions on character vectors and numeric vector?

``` r
w <- c("1", "2")
u <- c("a", "b", "c")
z6 <- w-y  
z7 <- u+w
```

This does not work because the vectors are of different type

we can use the paste command for this

``` r
w <- c("1", "2")
u <- c("a", "b", "c")
z8 <- paste(u,w, sep = "_")
z8 ## because w is shorter than u, it get's recycled over u
```

    ## [1] "a_1" "b_2" "c_1"

Let's clean up the workspace
============================

``` r
rm(list=ls())

root <- find_root_file(criterion = is_rstudio_project)

## Note: never use this in code that is meant for others!!!
```

**The above is an effective way to clear all the items in the Global Environment, but is is not very friendly to use this in code you share with others: can you think of why?**

Data Structures: Lists and Dataframes
=====================================

When using R for data analysis you will most likely work with data in a matrix, an array, a list or even more likely: a dataframe.

A matrix is a table with only numeric values. An array consists of multiple matices. A list is collection of R objects of different data type. A dataframe is a table with variable names in the first row and observations in the consecutive rows. The columns in a dataframe represnet different variables.

The dataframe and the list are the most widely used datastructures when considering experimental Biological data.

Lists
-----

### Create a List

``` r
lst <-list(name="Fred", wife="Mary", no.children=3, child_ages=c(4,7,9))
lst # Lst is a list with 4 components
```

    ## $name
    ## [1] "Fred"
    ## 
    ## $wife
    ## [1] "Mary"
    ## 
    ## $no.children
    ## [1] 3
    ## 
    ## $child_ages
    ## [1] 4 7 9

``` r
str(lst) # display structure of lst
```

    ## List of 4
    ##  $ name       : chr "Fred"
    ##  $ wife       : chr "Mary"
    ##  $ no.children: num 3
    ##  $ child_ages : num [1:3] 4 7 9

### Accessing items in a list

There are 2 ways to select a single variable from a list The indexing of lists work also with square brackets or the dollars sign, but we will see there is a difference:

``` r
str(lst)
```

    ## List of 4
    ##  $ name       : chr "Fred"
    ##  $ wife       : chr "Mary"
    ##  $ no.children: num 3
    ##  $ child_ages : num [1:3] 4 7 9

``` r
lst$child_ages # MyListName$MyVariableName 
```

    ## [1] 4 7 9

``` r
lst[4]# MyListName[MyVariableColumnNumber] 
```

    ## $child_ages
    ## [1] 4 7 9

To select a single element from a variable in a list

``` r
lst$child_ages[2] 
```

    ## [1] 7

``` r
lst[[4]][2]
```

    ## [1] 7

``` r
# returns the value of the second element for your variable
```

The Dataframe
-------------

The dataframe is the most widely used data structure in the context of experimental biology and chemistry. **Remember "Tidy data!"**

### Create a data frame

``` r
people <- data.frame(age=c(24, 27, 19, 34),      
                       sex=c("F","F","M", "M"), 
                       weight=c(64,55,80, 70),
                     names = c("Christa", "Suzan", 
                     "Matt", "John"))
```

### Viewing the contents of a dataframe

``` r
summary(people)
```

    ##       age        sex       weight          names  
    ##  Min.   :19.00   F:2   Min.   :55.00   Christa:1  
    ##  1st Qu.:22.75   M:2   1st Qu.:61.75   John   :1  
    ##  Median :25.50         Median :67.00   Matt   :1  
    ##  Mean   :26.00         Mean   :67.25   Suzan  :1  
    ##  3rd Qu.:28.75         3rd Qu.:72.50              
    ##  Max.   :34.00         Max.   :80.00

``` r
table(people)
```

    ## , , weight = 55, names = Christa
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 64, names = Christa
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 1 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 70, names = Christa
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 80, names = Christa
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 55, names = John
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 64, names = John
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 70, names = John
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 1
    ## 
    ## , , weight = 80, names = John
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 55, names = Matt
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 64, names = Matt
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 70, names = Matt
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 80, names = Matt
    ## 
    ##     sex
    ## age  F M
    ##   19 0 1
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 55, names = Suzan
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 1 0
    ##   34 0 0
    ## 
    ## , , weight = 64, names = Suzan
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 70, names = Suzan
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0
    ## 
    ## , , weight = 80, names = Suzan
    ## 
    ##     sex
    ## age  F M
    ##   19 0 0
    ##   24 0 0
    ##   27 0 0
    ##   34 0 0

``` r
head(people)            # gives the content of the data frame
```

    ##   age sex weight   names
    ## 1  24   F     64 Christa
    ## 2  27   F     55   Suzan
    ## 3  19   M     80    Matt
    ## 4  34   M     70    John

``` r
names(people) 
```

    ## [1] "age"    "sex"    "weight" "names"

``` r
str(people)
```

    ## 'data.frame':    4 obs. of  4 variables:
    ##  $ age   : num  24 27 19 34
    ##  $ sex   : Factor w/ 2 levels "F","M": 1 1 2 2
    ##  $ weight: num  64 55 80 70
    ##  $ names : Factor w/ 4 levels "Christa","John",..: 1 4 3 2

``` r
people$age # gives the content of the variable "age" from the data frame ""
```

    ## [1] 24 27 19 34

### Using Index on Dataframes

Using the index "[](#section-6)" on a dataframe is a bit tricky. The dataframe always consists of rows and columns. Indexing a dataframe goes like:

`dataframe[row number(s), column number(s)]`

``` r
people$age[1]   # first element of this vector
```

    ## [1] 24

``` r
people[,2]  # content of 2nd variable (column) which is a character vector -> factor
```

    ## [1] F F M M
    ## Levels: F M

``` r
people[1,]  # content of the 1st row
```

    ##   age sex weight   names
    ## 1  24   F     64 Christa

``` r
# multiple indices
people[2:3, c(1,3)] # remember to use c
```

    ##   age weight
    ## 2  27     55
    ## 3  19     80

Import data into R
==================

read.table reads space-delimited or tab delimited files
-------------------------------------------------------

``` r
gender_age <-read.table(paste0(root, "/data/gender.txt"), header=TRUE)

# getting the first few rows 
head(gender_age)
```

    ##   gender age
    ## 1      F  12
    ## 2      F  23
    ## 3      F  34
    ## 4      M  12
    ## 5      M  15
    ## 6      M  17

``` r
# getting information on the variable, the dimensions
str(gender_age)
```

    ## 'data.frame':    17 obs. of  2 variables:
    ##  $ gender: Factor w/ 2 levels "F","M": 1 1 1 2 2 2 1 1 2 1 ...
    ##  $ age   : int  12 23 34 12 15 17 18 14 56 67 ...

``` r
# selecting a variable
gender_age$gender
```

    ##  [1] F F F M M M F F M F M M M F F F M
    ## Levels: F M

``` r
gender_age$age
```

    ##  [1] 12 23 34 12 15 17 18 14 56 67 89 34 45 12  3  5 NA

``` r
gender_age[1:6,2]
```

    ## [1] 12 23 34 12 15 17

read\_csv
---------

CSV is a format of a data file that uses commas or semicolons as seprators for the columns.

``` r
library(readr)
skin <- read_csv(paste0(root, "/data/skincolumns.csv")) 
str(skin)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    15 obs. of  2 variables:
    ##  $ Genotype A: num  54.9 48.8 50.8 45 28.7 ...
    ##  $ Genotype B: num  30.5 24.8 24.2 27.9 18.8 ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 2
    ##   .. ..$ Genotype A: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ Genotype B: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
    ##   ..- attr(*, "class")= chr "col_spec"

``` r
head(skin)   # content of the data frame
```

    ## # A tibble: 6 × 2
    ##   `Genotype A` `Genotype B`
    ##          <dbl>        <dbl>
    ## 1     54.89321     30.48837
    ## 2     48.77277     24.75629
    ## 3     50.75909     24.20443
    ## 4     44.96176     27.94116
    ## 5     28.74590     18.76385
    ## 6     35.31823     25.51043

``` r
dim(skin)
```

    ## [1] 15  2

``` r
attributes(skin)
```

    ## $class
    ## [1] "tbl_df"     "tbl"        "data.frame"
    ## 
    ## $row.names
    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
    ## 
    ## $names
    ## [1] "Genotype A" "Genotype B"
    ## 
    ## $spec
    ## cols(
    ##   `Genotype A` = col_double(),
    ##   `Genotype B` = col_double()
    ## )

``` r
summary(skin)
```

    ##    Genotype A      Genotype B   
    ##  Min.   :28.75   Min.   :18.76  
    ##  1st Qu.:42.89   1st Qu.:23.95  
    ##  Median :47.98   Median :25.16  
    ##  Mean   :48.22   Mean   :25.73  
    ##  3rd Qu.:53.04   3rd Qu.:27.40  
    ##  Max.   :69.13   Max.   :31.59  
    ##                  NA's   :1

``` r
## ?read_csv     # help on the function

## dataset contains an NA, some functions do not work with NAs:
mean(skin$`Genotype A`)
```

    ## [1] 48.22066

``` r
mean(skin$`Genotype B`)
```

    ## [1] NA

``` r
# to remove the NA
skin_noNA <- na.omit(skin)
mean(skin_noNA$`Genotype B`)
```

    ## [1] 25.72858

Smoking example with multiple variables
---------------------------------------

Create data frame with 4 variables: gender, smoke, age, weigth

``` r
set.seed(6000) # set it at the same number, then we will all produce the same output
gender<-c(sample(c(1,2), size=1000, replace=TRUE))
smoke<-c(sample(c(1,2), size=1000, replace=TRUE))
age<-c(sample(c(1,2,3), size=1000, replace=TRUE))
weight<-round(rnorm(1000, mean=65, sd=10),1)
smoking <- data.frame(cbind(gender, smoke, age, weight))

head(smoking, 5)
```

    ##   gender smoke age weight
    ## 1      2     1   3   65.1
    ## 2      2     1   1   66.9
    ## 3      1     2   3   46.9
    ## 4      1     1   3   70.5
    ## 5      1     2   1   66.9

``` r
smoking[1:5,]
```

    ##   gender smoke age weight
    ## 1      2     1   3   65.1
    ## 2      2     1   1   66.9
    ## 3      1     2   3   46.9
    ## 4      1     1   3   70.5
    ## 5      1     2   1   66.9

### replace numbers by descriptive labels

``` r
# replace numbers by characters
smoking$genderf=factor(smoking$gender, labels=c("female","male"))
table(smoking$genderf,smoking$gender)
```

    ##         
    ##            1   2
    ##   female 497   0
    ##   male     0 503

``` r
smoking$smokef=factor(smoking$smoke, labels=c("Y","N"))
table(smoking$smokef,smoking$smoke)
```

    ##    
    ##       1   2
    ##   Y 521   0
    ##   N   0 479

``` r
smoking$agecf=factor(smoking$age, labels=c("A: <15","B: 15-30","C: >30"))
table(smoking$agecf,smoking$age)
```

    ##           
    ##              1   2   3
    ##   A: <15   332   0   0
    ##   B: 15-30   0 355   0
    ##   C: >30     0   0 313

``` r
summary(smoking)
```

    ##      gender          smoke            age            weight     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :28.50  
    ##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:58.40  
    ##  Median :2.000   Median :1.000   Median :2.000   Median :65.60  
    ##  Mean   :1.503   Mean   :1.479   Mean   :1.981   Mean   :65.47  
    ##  3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:72.50  
    ##  Max.   :2.000   Max.   :2.000   Max.   :3.000   Max.   :98.60  
    ##    genderf    smokef       agecf    
    ##  female:497   Y:521   A: <15  :332  
    ##  male  :503   N:479   B: 15-30:355  
    ##                       C: >30  :313  
    ##                                     
    ##                                     
    ## 

### Subsetting data frame

``` r
library(tidyverse)
names(smoking)
```

    ## [1] "gender"  "smoke"   "age"     "weight"  "genderf" "smokef"  "agecf"

``` r
smoking_male <- smoking %>% filter(genderf == "male")
smoking_age_gender <- smoking %>% select(genderf, agecf)
```

Summarizing data
================

For summarizing data there are many ways in R (as is the case with many operations). I find the dplyr way the most intuitive. Using dplyr has the advantage that you can easily built on existing function and examples, because the code is faily easy to understand.

One thing that makes dplyr great is that it works with the "%&gt;%" symbol. Which is in programming jargon also called the "pipe" symbol. The pipe symbol takes the previous result of an operation and put it in the next. The pipe symbol can replace the use of annoying round brackets: or "(parentheses)"

Let's look at quite a simple example:

``` r
library(dplyr)
### IMPORTANT: RUN ALL THE LINES BELOW AT ONCE INCLUDING THE SET.SEET OPTION, BECAUSE OF REPRODUCIBILITY. (Cntrl + Shift + Enter)


## If we want to calculate the sum, of the square root of the mean, of two nummeric vectors (each of length = 1000) we could do:

set.seed(12345)    
zzz <- sqrt(mean(x <- rnorm(10000, mean = 34, sd = 2))) +
sqrt(mean(y <- rnorm(10000, mean = 23, sd = 4)))
zzz
```

    ## [1] 10.6257

``` r
## the above is almost impossible to read because of all the round brackets, note the closing brackets: 3 of them!!


## let's try the dplyr way with the %>% (pipe) operator

set.seed(12345)
qqq <- rnorm(10000, mean = 34, sd = 2) %>% mean() %>% sqrt() +
rnorm(10000, mean = 23, sd = 4) %>% mean() %>% sqrt()
qqq
```

    ## [1] 10.6257

``` r
zzz == qqq
```

    ## [1] TRUE

The dplyr way is a lot better is it not? Do you get what the above (dplyr-way) lines do?

1.  the result of the fist vector (1000 random numbers, with mean of 34 and a sd of 2 is piped into the function mean, which calculates the mean of these 1000 numbers (which will be around 34)

2.  From that the square root is taken by piping the mean in the function sqrt()

3.  The result of the firt vector is added to the calculation of the second vector (which is done the same way as the first).

4.  The result is qqq

5.  Is qqq equal to zzz, which we calculated the "old-fashioned" mathematical way? YES!

Let's apply the above to our smoking dataset
--------------------------------------------

Usually, if we want to make a graph we need some sort of summarizing variable that indicates hwat is going on, e.g. a group mean and standard deviation.

From the smoking dataset we will genrate a new dataframe with average weight, grouped by gender, age and grouped by smoking or non smoking. We will use dplyr verse to do so.

I will also show you how to sort the data, let's say to decreasing weight, by using the dplyr function 'arrange'.

``` r
## it is handy to have the names of the dataset variables at hand when writing pipes

names(smoking)
```

    ## [1] "gender"  "smoke"   "age"     "weight"  "genderf" "smokef"  "agecf"

``` r
str(smoking)
```

    ## 'data.frame':    1000 obs. of  7 variables:
    ##  $ gender : num  2 2 1 1 1 2 1 1 1 2 ...
    ##  $ smoke  : num  1 1 2 1 2 2 1 2 2 1 ...
    ##  $ age    : num  3 1 3 3 1 3 1 3 3 1 ...
    ##  $ weight : num  65.1 66.9 46.9 70.5 66.9 93 67.1 74.5 77.6 61.6 ...
    ##  $ genderf: Factor w/ 2 levels "female","male": 2 2 1 1 1 2 1 1 1 2 ...
    ##  $ smokef : Factor w/ 2 levels "Y","N": 1 1 2 1 2 2 1 2 2 1 ...
    ##  $ agecf  : Factor w/ 3 levels "A: <15","B: 15-30",..: 3 1 3 3 1 3 1 3 3 1 ...

``` r
smoking_weight <- smoking %>% select(genderf, smokef, weight, agecf) %>%
  group_by(genderf, smokef, agecf) %>% summarise(mean_weight = mean(weight)) %>%
  arrange(desc(mean_weight))

head(smoking_weight)
```

    ## Source: local data frame [6 x 4]
    ## Groups: genderf, smokef [4]
    ## 
    ##   genderf smokef    agecf mean_weight
    ##    <fctr> <fctr>   <fctr>       <dbl>
    ## 1  female      N   C: >30    67.07625
    ## 2  female      Y   A: <15    66.93647
    ## 3    male      Y B: 15-30    66.77500
    ## 4  female      Y   C: >30    66.35316
    ## 5    male      Y   C: >30    65.51786
    ## 6    male      N B: 15-30    65.32222

Let's look at what is going on above. The smoking\_weight datset contains newly created, more descriptive denominators, we will use those.

1.  The first step is to inspect the dataframe to see if the grouping variables are set to "factor"

2.  The second step is to select the proper variables to work with

3.  Than the data is grouped by the genderf, agecf and by the smokef variables

4.  Summarise creates a new variable "mean\_weight" that is what it says: the mean weight for the groups defined.

5.  Finally, the data is sorted, according the newly created mean\_weight variable, in decending order "(dec(mean\_weight))". If we want ascending order we can just use arrange(mean\_weight). Arrange has the default to order the variable in ascending order.

Explore data: Graphics
======================

We will use the demo dataset of the "Old Faithful" Geyser in US Yellowstone National Park

The dataset contains two variables "eruptions" and "waiting". Remember how to learn more on the dataset?

``` r
data("faithful")

?"faithful"

head(faithful)
```

    ##   eruptions waiting
    ## 1     3.600      79
    ## 2     1.800      54
    ## 3     3.333      74
    ## 4     2.283      62
    ## 5     4.533      85
    ## 6     2.883      55

``` r
hist(faithful$eruptions,breaks = 15)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-55-1.png)

``` r
hist(faithful$waiting, breaks = 15)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-55-2.png)

``` r
boxplot(faithful$eruptions)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-55-3.png)

``` r
qqnorm(faithful$eruptions);qqline(faithful$eruptions)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-55-4.png)

``` r
plot(faithful$eruptions,type="l")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-55-5.png)

``` r
plot(faithful$eruptions, faithful$waiting)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-55-6.png)

Grammar of Graphics (ggplot2 package)
-------------------------------------

ggplot2 is a data visualization package for the statistical programming language R. Created by Hadley Wickham in 2005, ggplot2 is an implementation of Leland Wilkinson's Grammar of Graphics—a general scheme for data visualization which breaks up graphs into semantic components such as scales and layers. ggplot2 can serve as a replacement for the base graphics in R and contains a number of defaults for web and print display of common scales. Since 2005, ggplot2 has grown in use to become one of the most popular R packages. It is licensed under GNU GPL v2.\[from Wikipedia, September, 2016\]

### **The ggplot2 package is very very versatile and can not be demonstrated to it's full abilities during this short workshop. Here we are barely scratching the ggplot2 surface. If you want to learn more about the power of R, you must start with exploring the posibilities of ggplot2, it is the future of data visualization.**

ggplot2 is also very good for creating heat-mas, which are very informative for visualization of large-scale and high deminensional data, e.g. obtained from genomics or proteomics experiments.

A good place to start learning more on The Grammar of Graphics: <http://www.cookbook-r.com/Graphs/>

We illustrate the workings of ggplot with two demo data-sets:

1.  "TootGrowth"
2.  "Household Power Consumption"

``` r
tg <- datasets::ToothGrowth
head(tg)
```

    ##    len supp dose
    ## 1  4.2   VC  0.5
    ## 2 11.5   VC  0.5
    ## 3  7.3   VC  0.5
    ## 4  5.8   VC  0.5
    ## 5  6.4   VC  0.5
    ## 6 10.0   VC  0.5

``` r
library(ggplot2)
g <- ggplot(data = tg, aes(len))
g + geom_histogram(bins = 25) 
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-56-1.png)

The graph shows a histogram of the Toothgrowth data (len = length teeth of Guinea pigs, treated with two different vitamine C food-sources).

This looks nice, but what if we would like to add a title to the graph: Simple we add

`+ ggtitle("ToothGrowth")`

``` r
g <- ggplot(data = tg, aes(len))
g + geom_histogram(bins = 30) + ggtitle("ToothGrowth")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-57-1.png)

Let's see if we can make a more meaningfull graph, that shows something about the result of the treatment, on teeth growth.

``` r
g <- ggplot(data = tg, aes(x = dose, y = len, group = supp, colour = supp))
g + geom_point() + ggtitle("ToothGrowth")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-58-1.png)

Now we get a scatterplot with colours indicating the different supplement. Already more informative, but not very pretty.

Let's try a panel plot:

``` r
str(ToothGrowth)
```

    ## 'data.frame':    60 obs. of  3 variables:
    ##  $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
    ##  $ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...

``` r
g <- ggplot(data = tg, aes(x = dose, y = len, group = 1))
g + geom_point() + 
  facet_wrap(facets = "supp") + 
  geom_smooth() + ggtitle("ToothGrowth")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-59-1.png)

``` r
## ignore the warnings if you get them...
## clean up the workspace again
```

Hey, that's nice, now we have a panelplot, with in each panel a smoother line and data points, for each tratment. Which vitamine C supplement (OJ or VC) has the most potent effect on the growth of the teeth of the tested Guinea pigs?

First, clean up the workspace again.
------------------------------------

``` r
rm(list=ls())
root <- find_root_file(criterion = is_rstudio_project)



## Note: never use this in code that is meant for others!!!
```

GRAMMAR OF GRAPHICS DEMO ON A BIGGER DATASET
============================================

Want to work on a bigger dataset? I guessed you would want to do so, so I prepared a bit on "big(ger) data below"
-----------------------------------------------------------------------------------------------------------------

I have prepared a script that will analyze a big dataset &gt;2 million datapoints on power consumption by US households. The script is called "power\_households.R". The script handles a number of steps: 1) System settings and packages are handeled

1.  Getting the data, the data is downloaded directly from the web

2.  The data is cleaned up and subsets are selected (only data from 48 hrs of power consumption are included)

3.  A data summary dataframe is generated

4.  Exploratory data figures are generated to find trends and patterns in the data

5.  Statistical analysis and thourough exploration is not included

External scripts can be called by the 'source' command Try it below and look in the folder "images" to see the result. Do you see the items in the Global environment?

What is the name of the object used for generating the figures?

The code below will download the data and create a tidy version of a subset of the data. We will work with summarized data from a period of 48 hours of power consumption by US households.

Calling an external script
==========================

This script will add a new dataset to the Global Environment: "data\_twoDays"

``` r
source(paste0(root, "/code/power_households.R"))
```

    ## 'data.frame':    2075259 obs. of  9 variables:
    ##  $ Date                 : Factor w/ 1442 levels "1/1/2007","1/1/2008",..: 342 342 342 342 342 342 342 342 342 342 ...
    ##  $ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1045 1046 1047 1048 1049 1050 1051 1052 1053 1054 ...
    ##  $ Global_active_power  : num  4.22 5.36 5.37 5.39 3.67 ...
    ##  $ Global_reactive_power: num  0.418 0.436 0.498 0.502 0.528 0.522 0.52 0.52 0.51 0.51 ...
    ##  $ Voltage              : num  235 234 233 234 236 ...
    ##  $ Global_intensity     : num  18.4 23 23 23 15.8 15 15.8 15.8 15.8 15.8 ...
    ##  $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ Sub_metering_2       : num  1 1 2 1 1 2 1 1 1 2 ...
    ##  $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

``` r
glimpse(data_twoDays)
```

    ## Observations: 2,880
    ## Variables: 10
    ## $ date                  <chr> "1/2/2007", "1/2/2007", "1/2/2007", "1/2...
    ## $ time                  <chr> "00:00:00", "00:01:00", "00:02:00", "00:...
    ## $ global_active_power   <dbl> 0.326, 0.326, 0.324, 0.324, 0.322, 0.320...
    ## $ global_reactive_power <dbl> 0.128, 0.130, 0.132, 0.134, 0.130, 0.126...
    ## $ voltage               <dbl> 243.15, 243.32, 243.51, 243.90, 243.16, ...
    ## $ global_intensity      <dbl> 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, ...
    ## $ sub_metering_1        <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
    ## $ sub_metering_2        <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
    ## $ sub_metering_3        <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
    ## $ date_time             <dttm> 2007-02-01 00:00:00, 2007-02-01 00:01:0...

The code to create the graphs is included in the code chunck below.

Can you figure out what is shown in the graphs, and what exploratory data questions could be addressed by looking at these graphs individually?

### Plot 1: Base plotting system

``` r
# save the file


hist(data_twoDays$global_active_power, col = "red", 
     xlab = "Global Active Power", ylab = "Frequency", main = "Global Active Power")
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-61-1.png)

### Plot 2: ggplot2 example

``` r
## ---- Plot2--------------------------------------------------------------
levels_date <- levels(as.factor(data_twoDays$date))

## plot2.png in ggplot2 syntax 
names(data_twoDays)
```

    ##  [1] "date"                  "time"                 
    ##  [3] "global_active_power"   "global_reactive_power"
    ##  [5] "voltage"               "global_intensity"     
    ##  [7] "sub_metering_1"        "sub_metering_2"       
    ##  [9] "sub_metering_3"        "date_time"

``` r
plot2 <- ggplot(data_twoDays, aes(date_time, global_active_power)) + 
  geom_line() +
  scale_x_datetime(date_breaks = "1 day", 
                   date_labels = c("Sat", "Thu", "Fri")) +
  ylab("Global Active Power (kilowatts)") + xlab("Day") +
theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.title.x = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm"))

# saving the plot to disk
plot2
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-62-1.png)

### Plot 3: ggplot2 example

``` r
## ---- Plot3--------------------------------------------------------------
# checking the names
names(data_twoDays)
```

    ##  [1] "date"                  "time"                 
    ##  [3] "global_active_power"   "global_reactive_power"
    ##  [5] "voltage"               "global_intensity"     
    ##  [7] "sub_metering_1"        "sub_metering_2"       
    ##  [9] "sub_metering_3"        "date_time"

``` r
# creating plot3 with ggplot
plot3 <- ggplot(data_twoDays, aes(x = date_time)) + 
  geom_line(aes(y = sub_metering_1, color = "Sub_metering_1")) +
  geom_line(aes(y = sub_metering_2, color = "Sub_metering_2")) +
  geom_line(aes(y = sub_metering_3, color = "Sub_metering_3")) +
  scale_x_datetime(date_breaks = "1 day", date_labels = c("Sat", "Thu", "Fri")) +
  ylab("Energy sub metering") +
  xlab("Day")
  scale_colour_manual("", values = c("Sub_metering_1" = "black", 
                                     "Sub_metering_2" = "red",
                                     "Sub_metering_3" = "blue")) +
theme_bw() +
theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.title.x = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) +
  theme(plot.margin = unit(c(1,1,1,1), "cm")) +
  theme(legend.position=c(0.7, 0.9)) +
  theme(legend.background = element_rect(fill="gray95", size=.3, linetype="dotted"))
```

    ## NULL

``` r
plot3
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-63-1.png)

### Plot 4: ggplot2 example

``` r
## ---- Plot4--------------------------------------------------------------
# checking names
names(data_twoDays)
```

    ##  [1] "date"                  "time"                 
    ##  [3] "global_active_power"   "global_reactive_power"
    ##  [5] "voltage"               "global_intensity"     
    ##  [7] "sub_metering_1"        "sub_metering_2"       
    ##  [9] "sub_metering_3"        "date_time"

``` r
## plot 4 is a panel of four plots consiting of plot2, plot3 and two new plots
## first create the two additonal plots (plot5 and plot6) that have to go in the panel

## plot5 --> x = date_time, y = voltage
plot5 <- ggplot(data_twoDays, aes(x = date_time)) + 
  geom_line(aes(y = voltage)) +
  scale_x_datetime(date_breaks = "1 day", 
                   date_labels = c("Sat", "Thu", "Fri")) +
  ylab("Voltage") +
  xlab("Day") +
  theme_bw() +
theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) +
theme(plot.margin = unit(c(1,1,1,1), "cm"))

## plot6 --> x = date_time, y = global_reactive_power
names(data_twoDays)
```

    ##  [1] "date"                  "time"                 
    ##  [3] "global_active_power"   "global_reactive_power"
    ##  [5] "voltage"               "global_intensity"     
    ##  [7] "sub_metering_1"        "sub_metering_2"       
    ##  [9] "sub_metering_3"        "date_time"

``` r
plot6 <- ggplot(data_twoDays, aes(x = date_time)) + 
  geom_line(aes(y = global_reactive_power)) +
  scale_x_datetime(date_breaks = "1 day", 
                   date_labels = c("Sat", "Thu", "Fri")) +
  ylab("Global_reactive_power") +
  xlab("Day") +
  theme_bw() +
theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) + 
  theme(plot.margin = unit(c(1,1,1,1), "cm"))

plot5
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-64-1.png)

``` r
plot6
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-64-2.png)

CREATING A PANEL PLOT
---------------------

``` r
# creating the panel with plot_grid 
panel <- plot_grid(plot2, plot5, plot3, plot6,
          labels=c("A", "C", "B", "D"), ncol = 2)

panel
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-65-1.png)

The above is meant as a demo for the strength of the Grammar of Graphics lingo. There is a lot more to ggplot2 than can be shown in this short demo. As mentioned above, a good place to start learning ggplot2 is:

<http://www.cookbook-r.com/Graphs/>.

Other resources are:

<https://www.google.nl/url?sa=t&rct=j&q>=&esrc=s&source=web&cd=9&cad=rja&uact=8&ved=0ahUKEwiK5ZeV0N3PAhUhBMAKHUt5A-gQtwIIXzAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DHeqHMM4ziXA&usg=AFQjCNGE4PNS-\_O1LzB3qiv8b9DI2Q\_FiA

and

<https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf>

The reason why I do not show examples from other plotting systems is that I think ggplot2 is the most advanced system that best puts the principles of "reproducible research" in practice.

################################################################ 

START BIONCONDUCTOR DEMO
========================

################################################################ 

Bioconductor packages installation

``` r
library(pacman)
p_load(Biostrings,
       XVector,
       BiocGenerics,
       IRanges,
       S4Vectors,
       GenomicRanges,
       BSgenome)
```

**First, clear the workspace to have an overview!**
---------------------------------------------------

``` r
library(rprojroot)

rm(list=ls())

root <- find_root_file(criterion = is_rstudio_project)
```

Let's work on some biological data.
-----------------------------------

Biological data can be sequence data, genomic information, proteomics and metabolomics data, expression array data, genomic alignments etc. etc.

As mentioned above www.bioconductor.org, but also packages from CRAN and packages people posted on www.github.com and www.bitbucket.org can be used to work with and analyze biological data.

Lets' work with an example from the Bioconductor package "Biostrings" To get help on packages and learn about BIOCONDUCTOR workflows visit: <https://www.bioconductor.org/help/workflows/>

Below we will show a little on the workflows: "Multiple Alignment" and "Sequencing / Pathway analysis. To get started we need two "BIOCONDUCTOR" packages:

``` r
library(Biostrings)
library(IRanges)
```

To view the vignettes (from which I distilled the code chunks below)

``` r
browseVignettes("Biostrings")
browseVignettes("IRanges")
```

### R code from vignette source 'Biostrings2Classes.Rnw'

Create a BString class object

``` r
b <- BString(c("I am a BString object"))
b
```

    ##   21-letter "BString" instance
    ## seq: I am a BString object

``` r
length(b)
```

    ## [1] 21

``` r
class(b)
```

    ## [1] "BString"
    ## attr(,"package")
    ## [1] "Biostrings"

Create a DNAString class object, with two ambiguous nucleotides

``` r
d <- DNAString("TTGAAAA-CTC-N")
d
```

    ##   13-letter "DNAString" instance
    ## seq: TTGAAAA-CTC-N

``` r
length(d)
```

    ## [1] 13

``` r
class(d)
```

    ## [1] "DNAString"
    ## attr(,"package")
    ## [1] "Biostrings"

``` r
DNA_ALPHABET
```

    ##  [1] "A" "C" "G" "T" "M" "R" "W" "S" "Y" "K" "V" "H" "D" "B" "N" "-" "+"
    ## [18] "."

To see the meaning of the "N" and the other UIPAC nucleotide ambiguity codes in this sequence:

<http://www.chick.manchester.ac.uk/SiteSeer/IUPAC_codes.html>

Indexing works the same as with **'normal'** vectors

``` r
d[3]
```

    ##   1-letter "DNAString" instance
    ## seq: G

``` r
d[7:12]
```

    ##   6-letter "DNAString" instance
    ## seq: A-CTC-

``` r
b[length(b):1] ## gets the reverse sequence (could be handy to use on DNAStrings...know why?)
```

    ##   21-letter "BString" instance
    ## seq: tcejbo gnirtSB a ma I

``` r
d[length(d):1] ## see that d gets reversed?!
```

    ##   13-letter "DNAString" instance
    ## seq: N-CTC-AAAAGTT

To get subsequencces of a larger sequence (e.g. to check primer sequences in a genomic sequence)

``` r
bb <- subseq(b, 3, 6)
bb
```

    ##   4-letter "BString" instance
    ## seq: am a

``` r
dd1 <- subseq(d, end=7)
dd1
```

    ##   7-letter "DNAString" instance
    ## seq: TTGAAAA

``` r
d
```

    ##   13-letter "DNAString" instance
    ## seq: TTGAAAA-CTC-N

``` r
dd2 <- subseq(d, start=8)
dd2
```

    ##   6-letter "DNAString" instance
    ## seq: -CTC-N

``` r
d
```

    ##   13-letter "DNAString" instance
    ## seq: TTGAAAA-CTC-N

To find a specific pattern (a substring) in a larget string

``` r
###################################################
### code chunk number 6: b1
###################################################
bb == "am a"
```

    ## [1] TRUE

``` r
dd2 != DNAString("TG") ## is not containing?
```

    ## [1] TRUE

DNAString, RNAString, Amino acid strings (protein)
--------------------------------------------------

Logically, we can als define RNA and proteins a string-object. Converting DNA to RNA **transcribes** the DNA string. Remember, what was so typical about RNA?

Tranlating a DNA string to protein \_\_translates the DNA sequence (triplets) to a string of amino acids. A physiologically relevant protein had a start, and a stop coding sequence.

``` r
r <- RNAString(d)
r
```

    ##   13-letter "RNAString" instance
    ## seq: UUGAAAA-CUC-N

``` r
r == d
```

    ## [1] TRUE

``` r
gene <- DNAString(c("ATGAAATTTGGGCGCGCTTTAAAATGGGCGCTGAACTCTTTCCCCCGCGCGCTTGTGTGTGAAATATATATGTAATAAATATTGCCCCCGCGCGCGTTTGTGTGGGGCTCGCCGCGCTTTTAG"))
                  


length(gene)
```

    ## [1] 123

``` r
protein <- Biostrings::translate(gene)                  
gene
```

    ##   123-letter "DNAString" instance
    ## seq: ATGAAATTTGGGCGCGCTTTAAAATGGGCGCTGA...CGCGCGTTTGTGTGGGGCTCGCCGCGCTTTTAG

``` r
length(gene)/3
```

    ## [1] 41

``` r
protein
```

    ##   41-letter "AAString" instance
    ## seq: MKFGRALKWALNSFPRALVCEIYM**ILPPRAFVWGSPRF*

Each triplet codes for one amino acid.

\_Notice the ambiguous amino acids indicated by \*.\_

Views on strings
----------------

IRanges Views are a way to describe the subsequences of a longer sequence.

``` r
v4 <- Views(dd2, start=3:0, end=5:8)
v4
```

    ##   Views on a 6-letter DNAString subject
    ## subject: -CTC-N
    ## views:
    ##     start end width
    ## [1]     3   5     3 [TC-]
    ## [2]     2   6     5 [CTC-N]
    ## [3]     1   7     7 [-CTC-N ]
    ## [4]     0   8     9 [ -CTC-N  ]

``` r
length(v4)
```

    ## [1] 4

``` r
v4[4:2]
```

    ##   Views on a 6-letter DNAString subject
    ## subject: -CTC-N
    ## views:
    ##     start end width
    ## [1]     0   8     9 [ -CTC-N  ]
    ## [2]     1   7     7 [-CTC-N ]
    ## [3]     2   6     5 [CTC-N]

``` r
v4[[2]]
```

    ##   5-letter "DNAString" instance
    ## seq: CTC-N

``` r
v12 <- Views(DNAString("TAATAATG"), start=-2:9, end=0:11)
v12
```

    ##   Views on a 8-letter DNAString subject
    ## subject: TAATAATG
    ## views:
    ##      start end width
    ##  [1]    -2   0     3 [   ]
    ##  [2]    -1   1     3 [  T]
    ##  [3]     0   2     3 [ TA]
    ##  [4]     1   3     3 [TAA]
    ##  [5]     2   4     3 [AAT]
    ##  ...   ... ...   ... ...
    ##  [8]     5   7     3 [AAT]
    ##  [9]     6   8     3 [ATG]
    ## [10]     7   9     3 [TG ]
    ## [11]     8  10     3 [G  ]
    ## [12]     9  11     3 [   ]

``` r
## a complete sequence can also be descibed as a views object, start, stop and width defines a string...
as(d, "Views")
```

    ##   Views on a 13-letter DNAString subject
    ## subject: TTGAAAA-CTC-N
    ## views:
    ##     start end width
    ## [1]     1  13    13 [TTGAAAA-CTC-N]

``` r
###################################################
as(d, "Views")[[1]]
```

    ##   13-letter "DNAString" instance
    ## seq: TTGAAAA-CTC-N

IRanges package to use views and strings for biological sequences
=================================================================

### R code from vignette source 'IRangesOverview.Rnw'

``` r
p_load(IRanges)
library(IRanges)
library(Biostrings)
```

Generating dummy DNA sequence
-----------------------------

### Encoding long strings and sequences

The storage of large sequences in a friendly, accessible and small format is feasibe for the very long sequences of DNA that we use in Biology. When ragarding a full genome we can easily have sequences over 50 milion bases. Considering the longest chomosome of the human (chromosome 1) is over 200 milion base pairs long, you can appriciate the neccessity to store these strings of nucleotides in a computational-and-storage-friendle format. In R this format is encoded by the Rle class of objects.

Let's look at Rle. Assume you have a short DNA sequence: AAATTGTGTGCCCTTT

This sequence can be converted to a DNAString

``` r
seq_demo <- DNAString("AAATTGTGTGCCCTTT")
seq_demo
```

    ##   16-letter "DNAString" instance
    ## seq: AAATTGTGTGCCCTTT

let's see what happens if we convert this sequence to an Rle object

``` r
seq_rle <- Rle(as.vector(seq_demo))

seq_rle
```

    ## factor-Rle of length 16 with 9 runs
    ##   Lengths: 3 2 1 1 1 1 1 3 3
    ##   Values : A T G T G T G C T
    ## Levels(18): A C G T M R W S Y K V H D B N - + .

Hey!, That is clever! So we can describe a DNAString as a collection of Lengths and Values. The fist three A nucleotides in this sequence can be described as Lengths = 3, Value = A, the consecutive two T nucleotides can be described by Lengths = 2, Value = T, and so on...

This encoding for DNA sequences, or other very long sequences, is used e.g. in sequencing files that contain the genomes. It is a way to condense the information and to prevent writing very very long sequences in a file, that are hard to work with. The sequence encoded in this way is also more easily accessible by the computer and this encoding will reduce computation time.

Let's create a longer sequence and some shorter ones that we want to match to the longer sequence. The shorter sequences ar stored in a dictionary. This disctionary can contain only sequence that are of equal lenth. Although, there are ways to do multiple matchings with sequences of unequal length we will not go into detail on this here.

``` r
## Our subject sequence (the longer sequence)
subject_seq <- DNAString(c("ATTTGTTGATCATCATCATGTTTTATGTTTGTGTGTATTATTATTATTTCCGCGCGTA"))

## the dictionary with a few three-base long sequences
dictionary <- PDict(c("ATC", "ATG", "ATT", "TAT", "TTA"))

## the actual matching of the dictionary against the subject DNA sequence
match <- Biostrings::matchPDict(pdict = dictionary, subject = subject_seq)
names_patterns <- c("ATC", "ATG", "ATT", "TAT", "TTA")

## the names of the pattern are added to the match object
match@NAMES <- c(names_patterns)
 str(match)
```

    ## Formal class 'ByPos_MIndex' [package "Biostrings"] with 7 slots
    ##   ..@ dups0          :Formal class 'Dups' [package "IRanges"] with 5 slots
    ##   .. .. ..@ high2low       : int [1:5] NA NA NA NA NA
    ##   .. .. ..@ low2high       :List of 5
    ##   .. .. .. ..$ : NULL
    ##   .. .. .. ..$ : NULL
    ##   .. .. .. ..$ : NULL
    ##   .. .. .. ..$ : NULL
    ##   .. .. .. ..$ : NULL
    ##   .. .. ..@ elementType    : chr "integer"
    ##   .. .. ..@ elementMetadata: NULL
    ##   .. .. ..@ metadata       : list()
    ##   ..@ ends           :List of 5
    ##   .. ..$ : int [1:3] 11 14 17
    ##   .. ..$ : int [1:2] 20 27
    ##   .. ..$ : int [1:5] 3 39 42 45 48
    ##   .. ..$ : int [1:5] 26 38 41 44 47
    ##   .. ..$ : int [1:4] 25 40 43 46
    ##   ..@ width0         : int [1:5] 3 3 3 3 3
    ##   ..@ NAMES          : chr [1:5] "ATC" "ATG" "ATT" "TAT" ...
    ##   ..@ elementType    : chr "IRanges"
    ##   ..@ elementMetadata: NULL
    ##   ..@ metadata       : list()

``` r
 match@NAMES
```

    ## [1] "ATC" "ATG" "ATT" "TAT" "TTA"

``` r
 ## contructing an IRangesList from match
ir <- lapply(match, IRanges::IRanges)
ir_list <- IRanges::IRangesList(ir)

head(ir_list, 2)
```

    ## IRangesList of length 2
    ## $ATC
    ## IRanges object with 3 ranges and 0 metadata columns:
    ##           start       end     width
    ##       <integer> <integer> <integer>
    ##   [1]         9        11         3
    ##   [2]        12        14         3
    ##   [3]        15        17         3
    ## 
    ## $ATG
    ## IRanges object with 2 ranges and 0 metadata columns:
    ##           start       end     width
    ##       <integer> <integer> <integer>
    ##   [1]        18        20         3
    ##   [2]        25        27         3

Although with the Views you could figure out for each pattern in the dictionary where the match to the subject is located and how many times it is represented in the subject sequence, we could use a plot here to see the details in an overview. Let's make a plot!

The code below is rather complicated, do not worry if you do not understand, you will understand the end-result, anyway.

``` r
### code chunk number 31: plotRanges
IRanges_plot <- function(IRanges_object, sep=0.5, height=1,
                         set_breaks=TRUE, labcol="grey",
                                                names=NULL, cov=FALSE, clear=FALSE,
                                                disjoint=NULL,
                                                color=NULL) {
    library(ggplot2)

  if (!is.null(colors)) stopifnot(length(colors) <= 3L)
    COLORS <- c("white", "#383838", "#DDDDDD")
    x <- list(IRanges_object)
    if (!is.null(names))
        names(x) <- names
    dl <- lapply(x, function(d) {
                             out <- as.data.frame(d)
                             out$y <- GenomicRanges::disjointBins(d)
                             out
                            })
    d <- do.call(rbind, dl)
    if (!is.null(disjoint))
        # manually assigned bins
        d$y <- disjoint
    d$ymin <- d$y * (sep + height) - height
    d$ymax <- d$ymin + height
    if (!is.null(color))
        d$color <- color
    if (length(x) > 1 && is.null(names(x)))
        stop("multiple ranges must be given names like
             plotRanges(rng1=y, rng2=x)")
    if (length(x) > 1)
        d$range <- factor(rep(names(x), sapply(x, length)), names(x))
    p <- ggplot2::ggplot(d)
    if (clear)
        p <- p + ggplot2::geom_rect(aes(ymin=ymin, ymax=ymax,
                               xmin=start-0.5, xmax=end+0.5),
                                             fill="white", color="grey30", size=0.3)
    else if(is.null(color))
        p <- p + ggplot2::geom_rect(aes(ymin=ymin, ymax=ymax, xmin=start-0.5,
                               xmax=end+0.5))
    else {
        p <- p + ggplot2::geom_rect(aes(ymin=ymin, ymax=ymax, xmin=start-0.5,
                                                     xmax=end+0.5, fill=color),
                                                     color="grey30", size=0.3)
        p <- p + ggplot2::scale_fill_manual("", guide=FALSE,
                                                             values=COLORS[1:length(unique(color))])
    }
    p <- p + ggplot2::theme_bw()
    if (!is.null(d$names)) {
        p <- p + ggplot2::geom_text(aes(x=start + width/2 - 0.5,
                                                     y=ymin+(ymax-ymin)/2, label=names),
                                                     size=4, color=labcol)
    }
    xmin <- min(d$start)
    xmax <- max(d$end)
    xbreaks <- seq(xmin - 1L, xmax + 1L)
    if (set_breaks)
        p <- p + ggplot2::scale_x_continuous(breaks=xbreaks)
    p <- p + ggplot2::theme(panel.grid.major=element_blank(),
                                 panel.grid.minor.y=element_blank(),
                                 axis.ticks=element_blank())
    if (!cov)
        p <- p + ggplot2::theme(axis.text.y=element_blank())
    p <- p + xlab("") + ylab("")
    if (length(unique(d$range)) > 1)
        p <- p + facet_wrap(~ range, ncol=1)
    if (cov)
        p <- p + ggplot2::geom_line(aes(x=pos, y=cov), covdf(coverage(rngs)),
                           color="red", size=3)
    p
}

## Calling the plot
plot_iranges <- IRanges_plot(unlist(ir_list))
plot_iranges
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-81-1.png)

A coverage plot indicates the depth of coverage of sequence and a number of patterns. Look at the plot to understand how coverage works.
----------------------------------------------------------------------------------------------------------------------------------------

``` r
coverage_plot <- function(cx, start, end, min.depth, max.depth){
  plot.new()
  plot.window(c(start, end), c(min.depth, max.depth))
  axis(1)
  axis(2)
  axis(4)
  lines(start:end, cx[start:end], type="l")
}



## Get the coverage of the original subject:
cov3R <- as.integer(IRanges::coverage(match, width=length(subject_seq)))
max(cov3R)
```

    ## [1] 3

``` r
mean(cov3R)
```

    ## [1] 0.9827586

``` r
sum(cov3R != 0) / length(cov3R)
```

    ## [1] 0.5689655

``` r
## A plot that shows the depth of the coverage (depht on the y-axis,
## subject on the x-axis)

coverplot <- coverage_plot(cx = cov3R,
                           start = 1, end = 58,
                           min.depth = 0, max.depth = 5)
```

![](fnt_r_workshop_files/figure-markdown_github/unnamed-chunk-82-1.png)

The above matching, Views, plotting an IRangesList and coverage are cocepts that play an important role in understanding the methodology of sequencing and how sequence data can be interpreted. If you want to learn more about analysis of sequence data in R, take a look at the BIOCONDUCTOR workflow below.

Sequencing workflow
===================

Commonly used workflows can be downloaded from the the BIOCONDUCTOR website. Workflows are installed as packages and demonstrate a data workflow for commond experiments and data types in Life Sciences and Chmeistry. Examples of workflows can be found at:

To start with a Biological workflow on sequencing data:
-------------------------------------------------------

``` r
BiocInstaller::biocValid()

## Full genome sequences for Homo sapiens (Human) as provided by UCSC (hg19, Feb. 2009) and stored in Biostrings objects.

## url <- c("http://bioconductor.org/packages/release/data/annotation/src/contrib/BSgenome.Hsapiens.UCSC.hg19_1.4.0.tar.gz")

## download.file(url = url, destfile = paste0(root, "/data/BSgenome.Hsapiens.UCSC.hg19_1.4.0.tar.gz"))

source("http://bioconductor.org/biocLite.R")

## installing Human genome from downloaded source file:

## install.packages("./data/BSgenome.Hsapiens.UCSC.hg19_1.4.0.tar.gz", 
##                 repo = NULL, type = "source")

## source("http://bioconductor.org/workflows.R")
## workflowInstall("sequencing", dependencies = TRUE, type = "source")
## browseVignettes("sequencing")
```

see also <http://bioconductor.org/packages/release/bioc/html/GenomicRanges.html> for learning annotation, gene IDs, pathway analysis and much more:

To start working on pathway analysis with KEGG and Bioreactome
--------------------------------------------------------------

``` r
library(pacman)
## url_kegg_package <- c("http://bioconductor.org/packages/release/data/annotation/src/contrib/KEGG.db_3.2.3.tar.gz")

## dir.create(paste0(root, "/tar_gz"))

## download.file(url = url_kegg_package, 
##              destfile = paste0(root, "/tar_gz/KEGG.db_3.2.3.tar.gz"))

## install.packages(paste0(root, "/tar_gz/KEGG.db_3.2.3.tar.gz"), repos = NULL, type = "source")

p_load(KEGGREST)

## url_reactome_db <- c("http://bioconductor.org/packages/release/data/annotation/src/contrib/reactome.db_1.58.0.tar.gz")

## download.file(url = url_reactome_db,
##              destfile = paste0(root, "/tar_gz/reactome.db_1.58.0.tar.gz"))

## install.packages(paste0(root, "/tar_gz/reactome.db_1.58.0.tar.gz"), repos = NULL, type = "source")

## An example with KEGG
## from: http://bioconductor.org/packages/release/bioc/vignettes/GenomicRanges/inst/doc/GenomicRangesHOWTOs.R

library(KEGG.db)
pathways <- toTable(KEGGPATHNAME2ID)
pathways[grepl("cancer", pathways$path_name, fixed=TRUE),] 

## For the complete how-to: see the link above.
```

Want to learn more about R and BIOCONDUCTOR?
============================================

Visit the BIOCONDUCTOR workflows: <https://www.bioconductor.org/help/workflows/>

To learn R interactively visit <http://swirlstats.com/>

There is a enormous amount of information on R freely available on the web. I find it realy helpful to use youtube tutorials, online tutorials, vignettes and workflows (BIOCONDUCTOR.org). Feel free to contact me for questions on which resource is best to start with or to advance your skills.

For statistics, which was not covered in this workshop: The book by Andy Field "Discovering Statistics Using R" kept me awake at night!! So it is a good place to start (if you have ambitions to becoming an insomniac).

E-books from Amazon are good tools, take a look at the ratings and the reviews before buying, though. I find the books from Publisher 'O Reilly very good starting points and a book can be helpful as a solid go-to.

One thing that will speed up your learning is running the code below. Good luck and let's **swirl!!**

``` r
install.packages("swirl")
library(swirl)
swirl()

## swirl will interact with you through the console. Type answers to the questions in the console, or run them in a script in the script editor.
```

Now what?
=========

One of the biggest advantages of using a system like R and RStudio over e.g. MS Excel or other spreadsheet applications is the reproducibility. You can run and re-run code as often as you like, tweaking it on the fly. Furthermore, you can exactly replicate things you have done in the nearby, or further away future. A big step forward in the way we work with data, if you ask me, is to introduce this concept of "Reproducible research" into our teachings.

**To my opinion, every future technician, scientist, or professional that works with data, will have to have some form of introduction in the "Reproducible Research" concept. And, yes! will have to learn a bit about programming**

**Everybody a programmer!**, will you join me?

And lastly: if you feel ready to take on this challenge, look me up and let's start a new **pRoject**.

This code can be used under the Creative Commons License. Author: Marc A.T. Teunis, 2016 For commercial applications contact the author at <marc.teunis@hu.nl>

Citations
=========

``` r
citation("base")
```

    ## 
    ## To cite R in publications use:
    ## 
    ##   R Core Team (2016). R: A language and environment for
    ##   statistical computing. R Foundation for Statistical Computing,
    ##   Vienna, Austria. URL https://www.R-project.org/.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {R: A Language and Environment for Statistical Computing},
    ##     author = {{R Core Team}},
    ##     organization = {R Foundation for Statistical Computing},
    ##     address = {Vienna, Austria},
    ##     year = {2016},
    ##     url = {https://www.R-project.org/},
    ##   }
    ## 
    ## We have invested a lot of time and effort in creating R, please
    ## cite it when using it for data analysis. See also
    ## 'citation("pkgname")' for citing R packages.

``` r
citation("ggplot2")
```

    ## 
    ## To cite ggplot2 in publications, please use:
    ## 
    ##   H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
    ##   Springer-Verlag New York, 2009.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Book{,
    ##     author = {Hadley Wickham},
    ##     title = {ggplot2: Elegant Graphics for Data Analysis},
    ##     publisher = {Springer-Verlag New York},
    ##     year = {2009},
    ##     isbn = {978-0-387-98140-6},
    ##     url = {http://ggplot2.org},
    ##   }

``` r
citation("tidyverse")
```

    ## 
    ## To cite package 'tidyverse' in publications use:
    ## 
    ##   Hadley Wickham (2016). tidyverse: Easily Install and Load
    ##   'Tidyverse' Packages. R package version 1.0.0.
    ##   https://CRAN.R-project.org/package=tidyverse
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {tidyverse: Easily Install and Load 'Tidyverse' Packages},
    ##     author = {Hadley Wickham},
    ##     year = {2016},
    ##     note = {R package version 1.0.0},
    ##     url = {https://CRAN.R-project.org/package=tidyverse},
    ##   }

``` r
citation("knitr")
```

    ## 
    ## To cite the 'knitr' package in publications use:
    ## 
    ##   Yihui Xie (2016). knitr: A General-Purpose Package for Dynamic
    ##   Report Generation in R. R package version 1.15.1.
    ## 
    ##   Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd
    ##   edition. Chapman and Hall/CRC. ISBN 978-1498716963
    ## 
    ##   Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible
    ##   Research in R. In Victoria Stodden, Friedrich Leisch and Roger
    ##   D. Peng, editors, Implementing Reproducible Computational
    ##   Research. Chapman and Hall/CRC. ISBN 978-1466561595

``` r
citation("sequencing")
```

    ## 
    ## To cite package 'sequencing' in publications use:
    ## 
    ##   Bioconductor Package Maintainer (2016). sequencing: Dummy
    ##   Package. R package version 0.99.120890.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {sequencing: Dummy Package},
    ##     author = {Bioconductor Package Maintainer},
    ##     year = {2016},
    ##     note = {R package version 0.99.120890},
    ##   }
