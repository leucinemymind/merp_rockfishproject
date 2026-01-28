# pkgs and imports
library(tidyverse)
library(readr)
sample_log <- read_csv("sample_log.csv")

graphs <- function(x_value, text){
                   ggplot(sample_log, aes(x = x_value, y = MP_Stomach)) +
                     geom_boxplot(fill = "skyblue") +
                     geom_jitter(width = 0.1, alpha = 0.5) +
                     labs(title = paste("Microplastic concentration vs.", text), x = text, y = "microplastics") +
                     theme_minimal()
  }

# mp stomach vs location
graphs(sample_log$Location, "Location")
# vs species
graphs(sample_log$Species_ID, "Species")

# anova
locaov <- aov(MP_Stomach ~ Location, data = sample_log)
speciesaov <- aov(MP_Stomach ~ Species_ID, data = sample_log)
summary(locaov)
summary(speciesaov)

shapiro.test(locaov$residuals)
shapiro.test(speciesaov$residuals)

TukeyHSD(locaov)
TukeyHSD(speciesaov)


