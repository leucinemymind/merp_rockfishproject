# pkgs and imports
library(tidyverse)
library(readr)
sample_log <- read_csv("Dropbox/sample_log - Sheet2.csv")


sample_log <- sample_log %>%
  add_row(Species_ID = "Blue", Length_cm = 27, Location = "PP", MP_Stomach = 2, stomach_mass = 5.94) %>%
  add_row(Species_ID = "Blue", Length_cm = 35.5, Location = "PP", MP_Stomach = 0, stomach_mass = 15.05) %>%
  add_row(Species_ID = "Blue", Length_cm = 27, Location = "PP", MP_Stomach = 4, stomach_mass = 4.72) %>%
  add_row(Species_ID = "Blue", Length_cm = 27.5, Location = "PP", MP_Stomach = 2, stomach_mass = 6.07) %>%
  add_row(Species_ID = "Blue", Length_cm = 30.5, Location = "PP", MP_Stomach = 23, stomach_mass = 8.06) %>%
  add_row(Species_ID = "Blue", Length_cm = 31.5, Location = "PP", MP_Stomach = 7, stomach_mass = 2.98)

graphs <- function(x_value){
                   ggplot(sample_log, aes(x = x_value, y = MP_Stomach)) +
                     geom_boxplot(fill = "skyblue") +
                     geom_jitter(width = 0.1, alpha = 0.5) +
                     labs(title = "Microplastic concentration vs. location", x = "Location", y = "microplastics") +
                     theme_minimal()
  }

# mp stomach vs location
graphs(sample_log$Location)
# vs species
graphs(sample_log$Species_ID)

# anova
locaov <- aov(MP_Stomach ~ Location, data = sample_log)
speciesaov <- aov(MP_Stomach ~ Species_ID, data = sample_log)
summary(locaov)
summary(speciesaov)

shapiro.test(locaov$residuals)
shapiro.test(speciesaov$residuals)

TukeyHSD(locaov)
TukeyHSD(speciesaov)

