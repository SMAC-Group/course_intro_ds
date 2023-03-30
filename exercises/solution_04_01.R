library(poliscidata)
library(janitor)
library(dplyr)
world %>% clean_names() %>%
  select(country, spendeduc, spendhealth, oil) %>%
  arrange(-oil) %>%
  slice(1:5)