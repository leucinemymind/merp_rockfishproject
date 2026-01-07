# pkgs and imports
library(tidyverse)
library(readr)
sample_log <- read_csv("Dropbox/sample_log - Sheet2.csv")


sample_log <- sample_log %>%
  add_row(Species_ID = "Blue", Length_cm = 27, Location = "PP", MP_Stomach = 2) %>%
  add_row(Species_ID = "Blue", Length_cm = 35.5, Location = "PP", MP_Stomach = 0) %>%
  add_row(Species_ID = "Blue", Length_cm = 27, Location = "PP", MP_Stomach = 4) %>%
  add_row(Species_ID = "Blue", Length_cm = 27.5, Location = "PP", MP_Stomach = 2) %>%
  add_row(Species_ID = "Blue", Length_cm = 30.5, Location = "PP", MP_Stomach = 23) %>%
  add_row(Species_ID = "Blue", Length_cm = 31.5, Location = "PP", MP_Stomach = 7)

# mp stomach vs location
ggplot(sample_log, aes(x = Location, y = MP_Stomach)) +
  geom_boxplot(fill = "skyblue") +
  geom_jitter(width = 0.1, alpha = 0.5) +
  labs(title = "Microplastic concentration vs. location", x = "Location", y = "microplastics") +
  theme_minimal()


