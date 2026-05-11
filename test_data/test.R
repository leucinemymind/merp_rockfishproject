library(tidyverse)
test <- read_csv("Dropbox/merp_rockfishproject/test_data/test.csv")

graphs <- function(x_value, text){
  ggplot(test, aes(x = x_value, y = mp_per_stomach)) +
    geom_boxplot(fill = "skyblue") +
    geom_jitter(width = 0.1, alpha = 0.5) +
    labs(title = paste("Microplastic concentration vs.", text), x = text, y = "microplastic count per stomach") +
    theme_minimal()
}

# mp stomach vs location
graphs(location, "Location")
# vs species
graphs(species_ID, "Species")
