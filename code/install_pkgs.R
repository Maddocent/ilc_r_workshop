
# install packrat if not installed
#require("packrat") || utils::install.packages("packrat")
#library(packrat)

# installs "pacman" if not installed
require("pacman") || utils::install.packages("pacman")
library(pacman)

require("latticeExtra") || utils::install.packages("latticeExtra")
library(latticeExtra)

# installs additonal R packages (CRAN and BIOCONDUCTOR packages)
p_load(car,
       dplyr,
       grid,
       downloader,
       lubridate,
       gridExtra,
       cowplot,
       readr,
       gplots, 
       ggplot2, 
       reshape2, 
       RCurl, 
       knitr,
       Biostrings,
       tibble,
       XVector,
       BiocGenerics,
       IRanges,
       S4Vectors,
       lattice,
       rmarkdown,
       circlize,
       devtools,
       lubridate,
       ciclize
       )

## downloading required datasets, will create dir "data" if nessecary
library(downloader)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="project_dataset.zip", mode="wb") 
unzip("project_dataset.zip", exdir = "./data")

## Full genome sequences for Homo sapiens (Human) as provided by UCSC 
## (hg19, Feb. 2009) and stored in Biostrings objects.
## download the file containing the Homo sapiens genome 
# url <- c("http://bioconductor.org/packages/release/data/annotation/src/contrib/BSgenome.Hsapiens.UCSC.hg19_1.4.0.tar.gz")
# download(url = url, destfile = "./BSgenome.Hsapiens.UCSC.hg19_1.4.0.tar.gz")

source("http://bioconductor.org/biocLite.R")

# biocLite("BSgenome.Hsapiens.UCSC.hg19", repo = NULL, type = "source")

source("http://bioconductor.org/workflows.R")
workflowInstall("sequencing", dependencies = TRUE)
