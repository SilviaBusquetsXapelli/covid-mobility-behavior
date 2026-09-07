# Let's start by installing (if needed) and uploading important packages

library(tidyverse) # includes most of the verbs we will use
library(readxl) # to import excel files
library(ggplot2) # for (beautiful) plots
library(stargazer) # for (amazing) tables
library(readr)

Affinity_City_Daily <- read_csv("data research paper/EconomicTracker-main/data/Affinity - City - Daily.csv")
Affinity_County_Daily <- read_csv("data research paper/EconomicTracker-main/data/Affinity - County - Daily.csv")
Affinity_National_Daily <- read_csv("data research paper/EconomicTracker-main/data/Affinity - National - Daily.csv")
Affinity_State_Daily <- read_csv("data research paper/EconomicTracker-main/data/Affinity - State - Daily.csv")
COVID_City_Daily <- read_csv("data research paper/EconomicTracker-main/data/COVID - City - Daily.csv")
COVID_County_Daily_2020 <- read_csv("data research paper/EconomicTracker-main/data/COVID - County - Daily 2020.csv")
COVID_County_Daily_2023 <- read_csv("data research paper/EconomicTracker-main/data/COVID - County - Daily 2023.csv")
COVID_National_Daily <- read_csv("data research paper/EconomicTracker-main/data/COVID - National - Daily.csv")
COVID_State_Daily <- read_csv("data research paper/EconomicTracker-main/data/COVID - State - Daily.csv")
Earnin_ZCTA_2020 <- read_csv("data research paper/EconomicTracker-main/data/Earnin - ZCTA - 2020.csv")
Employment_City_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Employment - City - Weekly.csv")
Employment_County_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Employment - County - Weekly.csv")
Employment_National_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Employment - National - Weekly.csv")
Employment_State_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Employment - State - Weekly.csv")
GeoIDs_City <- read_csv("data research paper/EconomicTracker-main/data/GeoIDs - City.csv")
GeoIDs_County <- read_csv("data research paper/EconomicTracker-main/data/GeoIDs - County.csv")
GeoIDs_State <- read_csv("data research paper/EconomicTracker-main/data/GeoIDs - State.csv")
Google_Mobility_City_Daily <- read_csv("data research paper/EconomicTracker-main/data/Google Mobility - City - Daily.csv")
Google_Mobility_State_Daily <- read_csv("data research paper/EconomicTracker-main/data/Google Mobility - State - Daily.csv")
Job_Postings_City_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Job Postings - City - Weekly.csv")
Job_Postings_County_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Job Postings - County - Weekly.csv")
Job_Postings_National_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Job Postings - National - Weekly.csv")
Job_Postings_State_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Job Postings - State - Weekly.csv")
Job_Postings_State_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Job Postings - State - Weekly.csv")
Policy_Milestones_State <- read_csv("data research paper/EconomicTracker-main/data/Policy Milestones - State.csv")
UI_Claims_City_Weekly <- read_csv("data research paper/EconomicTracker-main/data/UI Claims - City - Weekly.csv")
UI_Claims_County_Weekly <- read_csv("data research paper/EconomicTracker-main/data/UI Claims - County - Weekly.csv")
UI_Claims_National_Weekly <- read_csv("data research paper/EconomicTracker-main/data/UI Claims - National - Weekly.csv")
UI_Claims_State_Weekly <- read_csv("data research paper/EconomicTracker-main/data/UI Claims - State - Weekly.csv")
Womply_City_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Womply - City - Weekly.csv")
Womply_County_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Womply - County - Weekly.csv")
Womply_National_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Womply - National - Weekly.csv")
Womply_State_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Womply - State - Weekly.csv")
Womply_ZCTA_2020 <- read_csv("data research paper/EconomicTracker-main/data/Womply - ZCTA - 2020.csv")
Zearn_City_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Zearn - City - Weekly.csv")
Zearn_National_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Zearn - National - Weekly.csv")
Zearn_County_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Zearn - County - Weekly.csv")
Zearn_State_Weekly <- read_csv("data research paper/EconomicTracker-main/data/Zearn - State - Weekly.csv")

library(dplyr)
Google_Mobility_City_Daily <- Google_Mobility_City_Daily %>%
  mutate(fecha = as.Date(paste(year, month, day, sep = "-")))
COVID_City_Daily <- COVID_City_Daily %>%
  mutate(fecha = as.Date(paste(year, month, day, sep = "-")))

#City1 mobility and new cases
Google_Mobility_City_Daily %>%
  filter(cityid == 1) %>%  # Filtrar solo cityid == 1
  ggplot(aes(x = fecha, y = gps_away_from_home)) + 
  geom_point() + 
  geom_smooth(method = lm, color = "red3") +
  ggtitle("Mobility per day (City ID = 1)") +
  theme_classic()
COVID_City_Daily %>%
  filter(cityid == 1) %>%  # Filtrar solo cityid == 1
  #filter(month == 2) %>%
  #filter(year == 2021) %>%
  ggplot(aes(x = fecha, y = as.numeric(new_case_count))) + 
  geom_point() + 
  geom_smooth(method = lm, color = "red3") +
  ggtitle("New cases COVID (City ID = 1)") +
  theme_classic()

#City2 mobility and new cases
Google_Mobility_City_Daily %>%
  filter(cityid == 2) %>%  # Filtrar solo cityid == 1
  ggplot(aes(x = fecha, y = gps_away_from_home)) + 
  geom_point() + 
  geom_smooth(method = lm, color = "red3") +
  ggtitle("Mobility per day (City ID = 2)") +
  theme_classic()
COVID_City_Daily %>%
  filter(cityid == 2) %>%  # Filtrar solo cityid == 1
  #filter(month == 2) %>%
  #filter(year == 2021) %>%
  ggplot(aes(x = fecha, y = as.numeric(new_case_count))) + 
  geom_point() + 
  geom_smooth(method = lm, color = "red3") +
  ggtitle("New cases COVID (City ID = 2)") +
  theme_classic()

#correlación de las variables new_cases con mobility
any = 2021
for (ciudad in 1:51) {
  nc_sub <-  COVID_City_Daily %>% filter(cityid == ciudad) %>% filter(year == any)
  gm_sub <- Google_Mobility_City_Daily %>% filter(cityid == ciudad)  %>% filter(year == any)
  cat("ciudad = ", ciudad, ", cor=", cor(as.numeric(nc_sub$new_case_count), gm_sub$gps_away_from_home), "\n")
}
library(tidyverse) # includes most of the verbs we will use
library(readxl) # to import excel files
library(ggplot2) # for (beautiful) plots
library(nnet) # for multinomila regressi0n 
library(kableExtra)
library(fixest)
install.packages(modelsummary)
library(modelsummary) # for regression tables
install.packages('modelsummary')
library(modelsummary)
install.packages(
  c("modelsummary", "tinytable", "insight", "performance", "parameters"),
  repos = c(
    "https://vincentarelbundock.r-universe.dev",
    "https://easystats.r-universe.dev"))
model <-   lm(as.numeric(nc_sub$new_case_count) ~ gm_sub$gps_away_from_home)
#model %>% 
#  stargazer(summary = FALSE,
#            header = FALSE)
# Store model
#models[[treat]] <- model


# Define variable labels (coef_map)
#cm <- c('completepre_perc' = 'Pre-Program Rate', 
 #       'per_gop' = 'GOP vote', 
  #      'prop_p18_24hs' = 'High School Attainment', 
   #     'prop_p18_24somecoll' = 'College Attainment', 
    #    'census2019' = 'Population')

# Define table title

gof_map <- tibble::tribble(
  ~raw, ~clean, ~fmt,
  "r.squared", "R²", "%.3f",
  "nobs", "N", "%.0f"
)

# Generate formatted table using modelsummary + kableExtra
modelsummary(models, 
             output = "kableExtra",
             stars = TRUE,  
             title = "Regression: Treatments vs. Control", gof_map = gof_map) %>%
  kable_classic(full_width = F, html_font = "Cambria")
