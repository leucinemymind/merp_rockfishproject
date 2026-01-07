### rockfish data ###

# load in csv
library(tidyverse)
library(readr)
emery_fishlog <- read_csv("Downloads/Emeryville_fish_log - Sheet1.csv")

ggplot(emery_fishlog, aes(x = emery_fishlog$Location, y = emery_fishlog$MP_Stomach,
                      )) + geom_boxplot()
