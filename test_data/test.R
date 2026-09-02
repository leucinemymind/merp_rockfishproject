# pkgs and imports
library(tidyverse)
library(readr)
sample_log <- read_csv("~/Dropbox/merp_rockfishproject/test_data/by_RUCC.csv")

graphs <- function(x_value, text){
  ggplot(sample_log, aes(x = x_value, y = mp_per_stomach)) +
    geom_boxplot(fill = "skyblue") +
    geom_jitter(width = 0.1, alpha = 0.5) +
    labs(title = paste("Microplastic concentration vs.", text), x = text, y = "microplastic count per stomach") +
    theme_minimal()
}

# mp stomach vs location
graphs(sample_log$location, "Location")
# vs species
graphs(sample_log$species_ID, "Species")

# regular shapiro test
shapiro.test(sample_log$mp_per_stomach)

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
kruskal.test(mp_per_stomach ~ location, data = sample_log)
kruskal.test(mp_per_stomach ~ species_ID, data = sample_log)

t.test(mp_per_stomach ~ location, data = sample_log)
