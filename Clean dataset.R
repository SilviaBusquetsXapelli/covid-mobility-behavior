library(tidyverse) # includes most of the verbs we will use
library(readxl) # to import excel files
library(ggplot2) # for (beautiful) plots
library(stargazer) # for (amazing) tables
library(readr)
library(dplyr)
library(lubridate)
library(tidyverse) # includes most of the verbs we will use
library(readxl) # to import excel files
library(modelsummary) # for regression tables
library(nnet) # for multinomila regressi0n 
library(gt)
library(kableExtra)
library(fixest)
setwd("C:/Users/32468/OneDrive - ucp.pt/Semester 2/T3/Applied Economics/Final Project")
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

# Crear la nueva base de datos con la misma cantidad de filas que Google_Mobility_City_Daily
cleandata <- data.frame(
  Date = as.Date(paste(Google_Mobility_City_Daily$year, 
                       Google_Mobility_City_Daily$month, 
                       Google_Mobility_City_Daily$day, sep = "-"), 
                 format = "%Y-%m-%d"),
  CityID = Google_Mobility_City_Daily$cityid
)
#Fusionar datos nombre city
cleandata <- cleandata %>% rename(cityid = CityID)
cleandata <- cleandata %>%
  left_join(GeoIDs_City %>% select(cityid, cityname, statename), by = "cityid")
# Agregar las columnas del dataset COVID_City_Daily desde la fila 2543 hasta la fila 53687
cleandata <- cleandata %>%
  mutate(
    GPS_Away_From_Home = Google_Mobility_City_Daily$gps_away_from_home,
    New_Case_Rate = COVID_City_Daily$new_case_rate[2543:53687],
    New_Case_Count = COVID_City_Daily$new_case_count[2543:53687],
    FullVaccine_Count = COVID_City_Daily$fullvaccine_count[2543:53687],
    Case_Count = COVID_City_Daily$case_count[2543:53687],
    Death_Count = COVID_City_Daily$death_count[2543:53687],
    # Employment_Level = Employment_City_Weekly$emp[319:7632]
  )
# Realizar la fusión de datos
cleandata <- cleandata %>% rename(date = Date)
cleandata <- cleandata %>%
  left_join(Policy_Milestones_State %>% select(statename, date, schools_first_closed, nonessential_biz_first_closed, stayathome_first_start), 
            by = c("statename", "date"), relationship = "many-to-many")
# # Rellenar valores faltantes con el último disponible para cada estado
cleandata <- cleandata %>%
  group_by(statename) %>%        # Agrupa por estado
  arrange(date, .by_group = TRUE) %>%  # Ordena por fecha dentro de cada estado
  fill(schools_first_closed, nonessential_biz_first_closed, stayathome_first_start, .direction = "down") %>%  # Rellena valores hacia abajo
  # fill(schools_first_closed, nonessential_biz_first_closed, stayathome_first_start, .direction = "up") %>%    # Rellena valores hacia arriba (opcional)
  replace_na(list(  # Si aún quedan NA, reemplaza con 0
    schools_first_closed = 0,
    nonessential_biz_first_closed = 0,
    stayathome_first_start = 0
  )) %>%
  ungroup()  # Desagrupa para evitar efectos secundarios

# Asegurar que las variables sean numéricas
cleandata <- cleandata %>%
  mutate(
    GPS_Away_From_Home = as.numeric(GPS_Away_From_Home),
    New_Case_Rate = as.numeric(New_Case_Rate),
    New_Case_Count = as.numeric(New_Case_Count),
    FullVaccine_Count = as.numeric(FullVaccine_Count),
    Case_Count = as.numeric(Case_Count),
    schools_first_closed = as.numeric(schools_first_closed),
    nonessential_biz_first_closed = as.numeric(nonessential_biz_first_closed),
    stayathome_first_start = as.numeric(stayathome_first_start),
    Death_Count = as.numeric(Death_Count)
  )

final_week <- cleandata %>%
  mutate(week_start = floor_date(date, "week", week_start = 1)) %>%  # Agrupar en semanas (lunes a domingo)
  group_by(statename, cityname, week_start) %>%  # Agrupar por ciudad, estado y semana
  summarise(
    GPS_Away_From_Home = sum(GPS_Away_From_Home, na.rm = TRUE),  # Suma de la variable por semana
    .groups = "drop"
  ) %>%
  rename(week_range = week_start)  # Renombrar la columna de la semana

# Crear columna para el inicio de la semana
cleandata <- cleandata %>%
  mutate(week_start = floor_date(date, "week", week_start = 1))  # Lunes de cada semana

# Sumar variables numéricas por semana
weekly_sums <- cleandata %>%
  group_by(statename, cityname, week_start) %>%
  summarise(
    GPS_Away_From_Home = sum(GPS_Away_From_Home, na.rm = TRUE),
    .groups = "drop"
  )

# Obtener valores del último día disponible en cada semana
weekly_last_day <- cleandata %>%
  group_by(statename, cityname, week_start) %>%
  filter(date == max(date)) %>%  # Toma el último día disponible en la semana
  select(statename, cityname, week_start, New_Case_Rate, New_Case_Count, FullVaccine_Count, Case_Count, 
         schools_first_closed, nonessential_biz_first_closed, stayathome_first_start, Death_Count) %>%
  ungroup()

# Unir las sumas semanales con los valores del último día disponible
final_week <- left_join(weekly_sums, weekly_last_day, by = c("statename", "cityname", "week_start")) %>%
  rename(week_range = week_start)  # Renombrar la columna de la semana

#Regresión linear
library(dplyr)
library(lmtest)

# ---- 1. Crear variables rezagadas (t-1) ----
final_week <- final_week %>%
  arrange(cityname, week_range) %>%  # Ordenamos por ciudad y semana
  group_by(cityname) %>%  # Agrupamos por ciudad
  mutate(
    New_Case_Count_lag = lag(New_Case_Count, 1),
    Case_Count_lag = lag(Case_Count, 1),
    FullVaccine_Count_lag = lag(FullVaccine_Count, 1),
    schools_first_closed_lag = lag(schools_first_closed, 1),
    nonessential_biz_first_closed_lag = lag(nonessential_biz_first_closed, 1),
    stayathome_first_start_lag = lag(stayathome_first_start, 1),
    Death_Count_lag = lag(Death_Count, 1)
  ) %>%
  ungroup()

# Eliminar filas con NA (se generan porque no hay datos de t-1 para la primera semana de cada ciudad)
# final_week <- na.omit(final_week)
# 
# final_week <- final_week %>%
#   mutate(
#     schools_first_closed_lag = ifelse(schools_first_closed_lag %in% c(0,1), schools_first_closed_lag, NA),
#     nonessential_biz_first_closed_lag = ifelse(nonessential_biz_first_closed_lag %in% c(0,1), nonessential_biz_first_closed_lag, NA),
#     stayathome_first_start_lag = ifelse(stayathome_first_start_lag %in% c(0,1), stayathome_first_start_lag, NA))
#   # ) %>%
#   # mutate(across(ends_with("_lag"), ~factor(., levels = c(0,1))))
library(dplyr)

# Convertir a factores binarios con etiquetas
final_week <- final_week %>%
  mutate(
    schools_first_closed_lag = factor(
      x = schools_first_closed_lag,
      levels = c(0, 1),
      ordered = FALSE
    ),
    nonessential_biz_first_closed_lag = factor(
      x = nonessential_biz_first_closed_lag,
      levels = c(0, 1),
      ordered = FALSE
    ),
    stayathome_first_start_lag = factor(
      x = stayathome_first_start_lag,
      levels = c(0, 1),
      ordered = FALSE
    )
  )
# ---- 2. Primera regresión: Predicción de New_Case_Rate ----
model1a <- lm(New_Case_Rate ~ New_Case_Count_lag + 
                Case_Count_lag +
                Death_Count_lag +
                           schools_first_closed_lag + nonessential_biz_first_closed_lag + stayathome_first_start_lag, 
                           data = final_week)
model1b <- lm(New_Case_Rate ~ New_Case_Count_lag 
              + Case_Count_lag
              + Death_Count_lag + FullVaccine_Count_lag, data = final_week)

# Obtener las filas utilizadas en el modelo
filas_usadas <- as.numeric(rownames(model1a$model))
# Verificar el número de filas
length(filas_usadas)  # Debería ser 7190
# Crear una columna de residuos inicializada con NA
final_week$error_ta <- NA
# Asignar los residuos a las filas correspondientes
final_week$error_ta[filas_usadas] <- resid(model1a)
# Obtener las filas utilizadas en el modelo
filas_usadas_b <- as.numeric(rownames(model1b$model))
# Crear una columna de residuos inicializada con NA
final_week$error_tb <- NA
# Asignar los residuos a las filas correspondientes
final_week$error_tb[filas_usadas_b] <- resid(model1b)

# ---- 3. Crear variable rezagada del error (t-1) ----
final_week <- final_week %>%
  arrange(cityname, week_range) %>%
  group_by(cityname) %>%
  mutate(error_ta_lag = lag(error_ta, 1)) %>%
  ungroup()
final_week <- final_week %>%
  arrange(cityname, week_range) %>%
  group_by(cityname) %>%
  mutate(error_tb_lag = lag(error_tb, 1)) %>%
  ungroup()

# ---- 4. Segunda regresión: Relación entre error y GPS_Away_From_Home ----
model2a <- lm(GPS_Away_From_Home ~ error_ta_lag, data = final_week)
model2b <- lm(GPS_Away_From_Home ~ error_tb_lag, data = final_week)

# ---- 5. Resultados ----
# Define table title
gof_map <- tibble::tribble(~raw, ~clean, ~fmt, "r.squared", "R²", "%.3f", "nobs", "N", "%.0f")
gof_map <- tibble::tribble( ~raw, ~clean, ~fmt, "r.squared", "R²", "%.3f",  "adj.r.squared", "Adjusted R²", "%.3f",
  "fstatistic", "F Statistic", "%.3f",
  "nobs", "N", "%.0f"
)
c <- list("New Case Rate Model 1A" = model1a, "New Case Rate Model 1B" = model1b)
modelsummary(c,
             output = "kableExtra",
             stars = TRUE,  
             title = "Table 1: Estimating the New Case Rate", gof_map = gof_map, fmt = "%.5f") %>%
  kable_classic(full_width = F, html_font = "Cambria")

d <- list("GPS Away From Home Model 2A" = model2a, "GPS Away From Home Model 2B" = model2b)
modelsummary(d,
             output = "kableExtra",
             stars = TRUE,  
             title = "Table 2: Estimating the time spent away from home", gof_map = gof_map, fmt = "%.5f") %>%
  kable_classic(full_width = F, html_font = "Cambria")

# stargazer(model1a,model1b
#           , type = "text"
#           , digits = 4
#           , no.space = TRUE
#           , column.labels= c("Model1a", "Model1b")
#           , title = "Estimating the new case rate")
# stargazer(model2a,model2b
#           , type = "text"
#           , digits = 4
#           , no.space = TRUE
#           , column.labels= c("Model2a", "Model2b")
#           , title = "Estimating the time spent away from home")