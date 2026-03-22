# pkgs and imports
library(tidyverse)
library(readr)
sample_log <- read_csv("~/Dropbox/merp_rockfishproject/sample_log.csv")

graphs <- function(x_value, text){
                   ggplot(sample_log, aes(x = x_value, y = MP_Stomach)) +
                     geom_boxplot(fill = "skyblue") +
                     geom_jitter(width = 0.1, alpha = 0.5) +
                     labs(title = paste("Microplastic concentration vs.", text), x = text, y = "microplastic count per stomach") +
                     theme_minimal()
  }

# mp stomach vs location
graphs(sample_log$Location, "Location")
# vs species
graphs(sample_log$Species_ID, "Species")

# regular shapiro test
shapiro.test(sample_log$MP_Stomach)

# shapiro on residuals
# shapiro.test(locaov$residuals)
# shapiro.test(speciesaov$residuals)

# anova
# locaov <- aov(MP_Stomach ~ Location, data = sample_log)
# speciesaov <- aov(MP_Stomach ~ Species_ID, data = sample_log)
# summary(locaov)
# summary(speciesaov)

# TukeyHSD(locaov)
# TukeyHSD(speciesaov)

# kruskal wallis test
kruskal.test(MP_Stomach ~ Location, data = sample_log)
kruskal.test(MP_Stomach ~ Species_ID, data = sample_log)