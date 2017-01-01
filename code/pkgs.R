```{r, installing_packages, error=FALSE, message=FALSE, warning=FALSE}

# load packages at startup

if (!require ("devtools")) utils::install.packages( "devtools", dependencies = TRUE)
require("devtools") || utils::install.packages("devtools")

library(devtools)

if (!require("pacman")) utils::install.packages("pacman", dependencies = TRUE)
library(pacman)


if (!require("git2r")) utils::install.packages("git2r", dependencies = TRUE)
library(git2r)

if (!require("httr")) utils::install.packages("httr", dependencies = TRUE)
library(httr)

if (!require("rvest")) utils::install.packages("rvest", dependencies = TRUE)
library(httr)

if (!require("xml2")) utils::install.packages("xml2", dependencies = TRUE)
library(httr)

if(!require("tidyverse")) utils::install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

require("latticeExtra") || utils::install.packages("latticeExtra")
library(latticeExtra)

```


# installs additonal R packages (CRAN)
```{r}
p_load(car,
       lattice,
       latticeExtra,
       downloader,
       lubridate,
       gridExtra,
       gplots, 
       reshape2, 
       RCurl, 
       knitr,
       rmarkdown)

```
