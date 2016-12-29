##### ggplot2 animation
# Example from https://github.com/dgrtwo/gganimate
library(ggplot2)

devtools::install_github("dgrtwo/gganimate")

## install.packages("ImageMagick")
 install.packages("gganimate")
library(gganimate)

install.packages(("cowplot")) 
library(cowplot) 

install.packages("gapminder")
 library(gapminder)
 library(ggplot2)
 theme_set(theme_bw())
 
 
 # For example, suppose we wanted to create an animation similar to the Gapminder 
# world animation, using Jenny Bryan's gapminder package for the data.
library(gapminder)

theme_set(theme_bw())
p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent, frame = year)) +
  geom_point() +
  scale_x_log10()

# Notice we added frame = year and saved the plot as p. 
# We then display it as an animation with the gg_animate function:
gganimate(p)

gg

