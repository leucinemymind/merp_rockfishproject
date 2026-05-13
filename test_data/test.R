library(tidyverse)
library(readr)
test <- read_csv("Dropbox/merp_rockfishproject/test_data/test.csv")

graph_boxplot <- function(x_value, text){
  ggplot(test, aes(x = {{ x_value }}, y = mp_per_stomach)) +
    geom_boxplot(fill = "skyblue") +
    geom_jitter(width = 0.1, alpha = 0.5) +
    labs(title = paste("Microplastic concentration vs.", text), x = text, y = "microplastic count per stomach") +
    theme_minimal()
}

graph_scatter <- function(x_value, text){
  ggplot(data = test, mapping = aes(x = {{ x_value }}, y = mp_per_stomach)) +
    geom_point(fill = "skyblue")+
    labs(title = paste("Microplastic concentration vs.", text), x = text, y = "microplastic count per stomach") +
    theme_minimal()
}

# mp stomach vs location
graph_boxplot(test$location, "Location")
# vs species
graph_boxplot(test$species_ID, "Species")

# correlations??? or not. with mass
graph_scatter(test$mass_g, "Mass (g)")
#with length
graph_scatter(test$length_cm, "Length (cm)")

#tests tests tests

aov_spec <- aov(mp_per_stomach ~ species_ID, data = test)
shapiro.test(residuals(model))
aov_loc <- aov(mp_per_stomach ~ location, data = test)
shapiro.test(residuals(model))

kruskal.test(mp_per_stomach ~ location, data = test)

kruskal.test(mp_per_stomach ~ species_ID, data = test)


# linear models
summary(lm(test$mp_per_stomach ~ test$mass_g))
summary(lm(test$mp_per_stomach ~ test$length_cm))
