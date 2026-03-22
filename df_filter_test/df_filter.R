# pkgs and imports
library(tidyverse)
library(readr)
filter_trial <- read_csv("~/Dropbox/merp_rockfishproject/df_filter_test/filter_trial.csv")
# just playing around with this at the moment. will prob have to be refined

# cleaning it up
filter_trial$picture <- NULL # not necessary for processing anything

filter_trial <- filter_trial[-7, ] # the one we got rid of