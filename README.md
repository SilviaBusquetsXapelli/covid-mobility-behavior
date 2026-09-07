# COVID-19, Mobility and Behavioral Responses

Empirical research project examining how individuals adjusted their mobility behavior in response to unexpected changes in COVID-19 infections.

The project uses high-frequency U.S. city-level data from the Opportunity Insights Economic Tracker and combines information on COVID-19 incidence, vaccination, mobility, and public-policy interventions.

The empirical analysis is implemented in **R**.

## Research Question

Do individuals reduce the amount of time they spend away from home when COVID-19 infections are unexpectedly higher than predicted?

The analysis distinguishes between predictable changes in infection rates and unexpected changes, allowing the relationship between new information about the pandemic and mobility behavior to be examined.

## Data

The project uses publicly available data from the **Opportunity Insights Economic Tracker**, developed by Raj Chetty, John N. Friedman, Michael Stepner, and the Opportunity Insights Team.

The main datasets used in the analysis are:

- `COVID - City - Daily.csv`
- `Google Mobility - City - Daily.csv`
- `GeoIDs - City.csv`
- `Policy Milestones - State.csv`

The data contain information on:

- COVID-19 cases and case rates
- COVID-19 deaths
- Vaccination
- Time spent away from home
- City and state identifiers
- School closures
- Non-essential business closures
- Stay-at-home policies

The original datasets are not duplicated in this repository because of their size. They are publicly available through the Opportunity Insights Economic Tracker:

https://github.com/OpportunityInsights/EconomicTracker

## Data Preparation

Daily observations from the different data sources are combined at the city level and transformed into a weekly dataset.

The data-preparation process includes:

- Matching geographic identifiers across datasets
- Combining COVID-19 and mobility information
- Incorporating state-level policy interventions
- Converting daily observations to weekly frequency
- Constructing lagged epidemiological and policy variables

## Empirical Strategy

The analysis is conducted in two stages.

### 1. Predicting COVID-19 Infection Rates

The first-stage models estimate the new COVID-19 case rate using lagged information on:

- New COVID-19 cases
- Cumulative cases
- Deaths
- Vaccination
- School closures
- Non-essential business closures
- Stay-at-home policies

Two alternative model specifications are estimated.

The residuals from these regressions capture the component of new infection rates that is not explained by previously available information.

### 2. Mobility Response to Unexpected Infections

The second stage examines whether unexpected changes in COVID-19 infections are associated with subsequent mobility behavior.

Mobility is measured using Google's `gps_away_from_home` indicator.

The lagged residual from the infection-rate model is used to examine whether individuals spend more or less time away from home following unexpectedly high or low infection rates.

## Exploratory Analysis

The project also examines:

- Daily mobility patterns across cities
- COVID-19 case dynamics
- City-level correlations between infections and mobility
- Differences in mobility behavior across locations

## Tools & Techniques

**R** · **tidyverse** · **dplyr** · **ggplot2** · **lubridate** · **modelsummary** · **Data Cleaning** · **Data Merging** · **Time-Series Aggregation** · **Regression Analysis**

## Repository Structure

```text
.
├── code/
│   ├── data-preparation.R
│   └── empirical-analysis.R
├── report/
│   └── covid-mobility-research-paper.pdf
└── README.md
```

## Academic Context

This project was developed as an individual research project for an Applied Economics course at Católica Lisbon School of Business & Economics.

I designed the research question and empirical strategy, prepared and merged the datasets, implemented the analysis in R, interpreted the results, and wrote the accompanying research paper.

The project uses publicly available data from the Opportunity Insights Economic Tracker; the empirical analysis presented in this repository was developed independently for this project.
