library(tidyverse)
FH_data <- read.csv('/Users/kayleywatson/Desktop/Econ 211/(Edited)Aggregate_Category_and_Subcategory_Scores_FIW_2006-2023.csv')

names(FH_data)[1] <- "Country" 
names(FH_data)[4] <- "Year" 
FH_data_modified <- FH_data
FH_data_modified <- subset(FH_data_modified, select = -Region)
FH_data_modified <- subset(FH_data_modified, select = -X)
FH_data_modified <- subset(FH_data_modified, select = -X.1)
FH_data_modified <- subset(FH_data_modified, select = -X.2)
FH_data_modified <- subset(FH_data_modified, select = -X.3)
FH_data_modified <- subset(FH_data_modified, select = -X.4)
FH_data_modified <- subset(FH_data_modified, select = -X.5)
FH_data_modified <- subset(FH_data_modified, select = -X.6)
FH_data_modified <- subset(FH_data_modified, select = -X.7)
FH_data_modified <- subset(FH_data_modified, select = -X.8)
FH_data_modified <- subset(FH_data_modified, select = -X.9)
FH_data_modified <- subset(FH_data_modified, select = -X.10)
FH_data_modified <- subset(FH_data_modified, select = -X.11)
FH_data_modified <- subset(FH_data_modified, select = -X.12)
FH_data_modified <- subset(FH_data_modified, select = -X.13)
FH_data_modified <- subset(FH_data_modified, select = -X.14)
FH_data_modified <- subset(FH_data_modified, select = -x)
FH_data_modified <- subset(FH_data_modified, select = -Add.A)
FH_data_modified <- subset(FH_data_modified, select = -Add.Q)

names(FH_data_modified)[4] <- "Political Rights Rating" 
names(FH_data_modified)[5] <- "Civil Liberties" 
names(FH_data_modified)[6] <- "Electoral Process"
names(FH_data_modified)[7] <- "Political Pluralism and Participation"
names(FH_data_modified)[8] <- "Govt Function"
names(FH_data_modified)[10] <- "Freedom of Expression and Belief"
names(FH_data_modified)[11] <- "Assoc and Org Rights"
names(FH_data_modified)[12] <- "Rule of Law"
names(FH_data_modified)[13] <- "Autonomy and Indv Rights"

#unique country names
print(unique(FH_data_modified$Country))

FH <- FH_data_modified %>%
  select(1, 3, 16)

names(FH)[1] <- "Country Name"
names(FH)[3] <- "Democracy_Score"


#Worldbank indicators

#GDP Growth (in 2015 dollars)
GDPgrowth <- read.csv("/Users/kayleywatson/Desktop/Econ 211/World Bank - GDP Growth.csv", skip = 3, header = TRUE, check.names = FALSE) %>%
  select(1, c(51:68))

names(GDPgrowth)[2] <- "GDPgrowth_2006" 
names(GDPgrowth)[3] <- "GDPgrowth_2007" 
names(GDPgrowth)[4] <- "GDPgrowth_2008" 
names(GDPgrowth)[5] <- "GDPgrowth_2009" 
names(GDPgrowth)[6] <- "GDPgrowth_2010" 
names(GDPgrowth)[7] <- "GDPgrowth_2011" 
names(GDPgrowth)[8] <- "GDPgrowth_2012" 
names(GDPgrowth)[9] <- "GDPgrowth_2013" 
names(GDPgrowth)[10] <- "GDPgrowth_2014" 
names(GDPgrowth)[11] <- "GDPgrowth_2015" 
names(GDPgrowth)[12] <- "GDPgrowth_2016" 
names(GDPgrowth)[13] <- "GDPgrowth_2017"
names(GDPgrowth)[14] <- "GDPgrowth_2018"
names(GDPgrowth)[15] <- "GDPgrowth_2019"
names(GDPgrowth)[16] <- "GDPgrowth_2020"
names(GDPgrowth)[17] <- "GDPgrowth_2021"
names(GDPgrowth)[18] <- "GDPgrowth_2022"
names(GDPgrowth)[19] <- "GDPgrowth_2023"

gdp_growth_long <- GDPgrowth %>%
  pivot_longer(
    cols = starts_with("GDPgrowth_"),
    names_to = "year",
    names_prefix = "GDPgrowth_",
    values_to = "GDPgrowth"
  ) %>%
  mutate(year = as.integer(year))

names(gdp_growth_long)[2] <- "Year"


#Inflation, consumer prices
Inflation <- read.csv("/Users/kayleywatson/Desktop/Econ 211/World Bank -  Inflation.csv", skip = 3, header = TRUE, check.names = FALSE) %>%
  select(1, c(51:68))

names(Inflation)[2] <- "Inflation_2006" 
names(Inflation)[3] <- "Inflation_2007" 
names(Inflation)[4] <- "Inflation_2008" 
names(Inflation)[5] <- "Inflation_2009" 
names(Inflation)[6] <- "Inflation_2010" 
names(Inflation)[7] <- "Inflation_2011" 
names(Inflation)[8] <- "Inflation_2012" 
names(Inflation)[9] <- "Inflation_2013" 
names(Inflation)[10] <- "Inflation_2014" 
names(Inflation)[11] <- "Inflation_2015" 
names(Inflation)[12] <- "Inflation_2016" 
names(Inflation)[13] <- "Inflation_2017"
names(Inflation)[14] <- "Inflation_2018"
names(Inflation)[15] <- "Inflation_2019"
names(Inflation)[16] <- "Inflation_2020"
names(Inflation)[17] <- "Inflation_2021"
names(Inflation)[18] <- "Inflation_2022"
names(Inflation)[19] <- "Inflation_2023"

inflation_long <- Inflation %>%
  pivot_longer(
    cols = starts_with("Inflation_"),
    names_to = "year",
    names_prefix = "Inflation_",
    values_to = "Inflation"
  ) %>%
  mutate(year = as.integer(year))

names(inflation_long)[2] <- "Year"


#GDP
GDP <- read.csv("/Users/kayleywatson/Desktop/Econ 211/World Bank GDP.csv", skip = 3, header = TRUE, check.names = FALSE) %>%
  select(1, c(51:68))

names(GDP)[2] <- "GDP_2006" 
names(GDP)[3] <- "GDP_2007" 
names(GDP)[4] <- "GDP_2008" 
names(GDP)[5] <- "GDP_2009" 
names(GDP)[6] <- "GDP_2010" 
names(GDP)[7] <- "GDP_2011" 
names(GDP)[8] <- "GDP_2012" 
names(GDP)[9] <- "GDP_2013" 
names(GDP)[10] <- "GDP_2014" 
names(GDP)[11] <- "GDP_2015" 
names(GDP)[12] <- "GDP_2016" 
names(GDP)[13] <- "GDP_2017"
names(GDP)[14] <- "GDP_2018"
names(GDP)[15] <- "GDP_2019"
names(GDP)[16] <- "GDP_2020"
names(GDP)[17] <- "GDP_2021"
names(GDP)[18] <- "GDP_2022"
names(GDP)[19] <- "GDP_2023"

gdp_long <- GDP %>%
  pivot_longer(
    cols = starts_with("GDP_"),
    names_to = "year",
    names_prefix = "GDP_",
    values_to = "GDP"
  ) %>%
  mutate(year = as.integer(year))

names(gdp_long)[2] <- "Year"


#GNI
GNI <- read.csv("/Users/kayleywatson/Desktop/Econ 211/World Bank - GNI.csv", skip = 3, header = TRUE, check.names = FALSE) %>%
  select(1, c(51:68))

names(GNI)[2] <- "GNI_2006" 
names(GNI)[3] <- "GNI_2007" 
names(GNI)[4] <- "GNI_2008" 
names(GNI)[5] <- "GNI_2009" 
names(GNI)[6] <- "GNI_2010" 
names(GNI)[7] <- "GNI_2011" 
names(GNI)[8] <- "GNI_2012" 
names(GNI)[9] <- "GNI_2013" 
names(GNI)[10] <- "GNI_2014" 
names(GNI)[11] <- "GNI_2015" 
names(GNI)[12] <- "GNI_2016" 
names(GNI)[13] <- "GNI_2017"
names(GNI)[14] <- "GNI_2018"
names(GNI)[15] <- "GNI_2019"
names(GNI)[16] <- "GNI_2020"
names(GNI)[17] <- "GNI_2021"
names(GNI)[18] <- "GNI_2022"
names(GNI)[19] <- "GNI_2023"

gni_long <- GNI %>%
  pivot_longer(
    cols = starts_with("GNI_"),
    names_to = "year",
    names_prefix = "GNI_",
    values_to = "GNI"
  ) %>%
  mutate(year = as.integer(year))

names(gni_long)[2] <- "Year"

GDP_PC <- read.csv("/Users/kayleywatson/Desktop/Econ 211/GDP_PC_World_Bank.csv", skip = 3) %>%
  select(1, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68)

names(GDP_PC)[1] <- "Country Name"
names(GDP_PC)[2] <- "GDPPC_2006"
names(GDP_PC)[3] <- "GDPPC_2007"
names(GDP_PC)[4] <- "GDPPC_2008"
names(GDP_PC)[5] <- "GDPPC_2009"
names(GDP_PC)[6] <- "GDPPC_2010"
names(GDP_PC)[7] <- "GDPPC_2011"
names(GDP_PC)[8] <- "GDPPC_2012"
names(GDP_PC)[9] <- "GDPPC_2013"
names(GDP_PC)[10] <- "GDPPC_2014"
names(GDP_PC)[11] <- "GDPPC_2015"
names(GDP_PC)[12] <- "GDPPC_2016"
names(GDP_PC)[13] <- "GDPPC_2017"
names(GDP_PC)[14] <- "GDPPC_2018"
names(GDP_PC)[15] <- "GDPPC_2019"
names(GDP_PC)[16] <- "GDPPC_2020"
names(GDP_PC)[17] <- "GDPPC_2021"
names(GDP_PC)[18] <- "GDPPC_2022"
names(GDP_PC)[19] <- "GDPPC_2023"

gdppc_long <- GDP_PC %>%
  pivot_longer(
    cols = starts_with("GDPPC_"),
    names_to = "year",
    names_prefix = "GDPPC_",
    values_to = "GDPPC"
  ) %>%
  mutate(year = as.integer(year))

names(gdppc_long)[2] <- "Year"

#Merge Data
library(purrr)
data_list <- list(gdp_growth_long, gdp_long, inflation_long, gni_long, gdppc_long, FH)
merged_data <- reduce(data_list, ~ merge(.x, .y, by = c("Country Name", "Year")))
write.csv(merged_data, "merged_data.csv", row.names = FALSE)

# #FINAL DATA (only for 2020)
# fh_merge <- merge(merged_data, FH, by = "Country Name") %>% 
#   select(1,2,3,4,5,20)
# 
# names(fh_merge)[1] <- "Country"
# names(fh_merge)[2] <- "GDP_growth"
# 
# fh_merge %>%
#   ggplot()+
#   geom_point(aes(y = GNI, x = GDP_growth))


#Export to STATA
#install.packages("haven")
library(haven)
names(merged_data) <- make.names(names(merged_data), unique = TRUE)
names(merged_data)[1] <- "Country_Name"

write_dta(merged_data, "/Users/kayleywatson/fh_merged_data.dta")


######### 
#Merge Violence Indicators
acled_africa <-read_csv("/Users/kayleywatson/Downloads/Africa_1997-2024_Nov22.csv")

specafrica_subset <- acled_africa %>%
  filter(!sub_event_type %in% c("Peaceful protest", "Agreement", "Change to group/activity", "Non-violent transfer of territory"))

acled_mideast <- read_csv("/Users/kayleywatson/Downloads/MiddleEast_2015-2024_Nov22.csv")

acled_latin <- read_csv("/Users/kayleywatson/Downloads/LatinAmerica_2018-2024_Nov22.csv")

acled_asiapac <- read_csv("/Users/kayleywatson/Downloads/Asia-Pacific_2018-2024_Nov22.csv")

acled_eurcentasia <- read_csv("/Users/kayleywatson/Downloads/Europe-Central-Asia_2018-2024_Nov22.csv")

acled_uscan <- read_csv("/Users/kayleywatson/Downloads/USA_Canada_2020_2024_Nov22.csv")

# Merge Full Dataset
acled_full <- bind_rows(acled_africa, acled_asiapac, acled_eurcentasia, acled_latin, acled_mideast, acled_uscan)

# Filter out peaceful events
acled_subset <- acled_full %>%
  filter(!sub_event_type %in% c("Peaceful protest", "Agreement", "Change to group/activity", "Non-violent transfer of territory"))

summarized_data <- acled_subset %>%
  group_by(country, year, sub_event_type) %>%
  summarise(count = n(), .groups = "drop") %>%
  pivot_wider(names_from = sub_event_type, values_from = count, values_fill = 0) %>%
  mutate(total = rowSums(select(., -country, -year)))
#country and year

merged_fh <- read_csv("/Users/kayleywatson/Desktop/merged_data.csv")

names(merged_fh)[1] <- "country"
names(merged_fh)[2] <- "year"

fh_wb_violence <- merge(merged_fh, summarized_data, by = c("country", "year"))

#convert to .dta for Stata
# library(haven)
# names(fh_wb_violence) <- make.names(names(fh_wb_violence), unique = TRUE)
# names(fh_wb_violence)[1] <- "Country_Name"

library(janitor)
fh_wb_violence <- fh_wb_violence %>%
  clean_names() 

names(fh_wb_violence)[15] <- "exc_force_against_prot"
names(fh_wb_violence)[18] <- "hdqt_base_est"
names(fh_wb_violence)[21] <- "nstate_takeover"
names(fh_wb_violence)[26] <- "shell_art_missile_attack"

write_dta(fh_wb_violence, "/Users/kayleywatson/fh_wb_violence.dta")
colnames(fh_wb_violence)

write.csv(fh_wb_violence, "/Users/kayleywatson/fh_wb_violence.csv", row.names = FALSE)

#Add dummy variables and population
dummy_set <- fh_wb_violence %>%
  mutate(across(9:29, ~ case_when(. >= 1 ~ 1, TRUE ~ .))) %>%
  rename(total_events = total) %>%
  rename(Year = year) %>%
  rename(`Country Name` = country)

population <- read_csv("/Users/kayleywatson/Desktop/Econ 211/WB Population.csv", skip = 3) %>%
  select(-2, -3, -4)

for (i in 2:65) {
  year <- 1958 + i  # Calculate the year
  names(population)[i] <- paste0("pop_", year)
}

pop_long <- population %>%
  pivot_longer(
    cols = starts_with("pop_"),
    names_to = "year",
    names_prefix = "pop_",
    values_to = "Population"
  ) %>%
  mutate(year = as.integer(year))

names(pop_long)[2] <- "Year"

Merged_Dataset <- dummy_set %>%
  left_join(pop_long, by = c("Country Name", "Year")) %>%
  rename(Country_Name = `Country Name`) %>%
  rename(gdp_growth = gd_pgrowth)

write_dta(Merged_Dataset, "/Users/kayleywatson/Econ211_Final_Data.dta")
write.csv(Merged_Dataset, "/Users/kayleywatson/Econ211_Final_Data", row.names = FALSE)

install.packages("plm")
library(plm)
panel_df <- pdata.frame(Merged_Dataset, index = c("Country_Name", "Year"))

prelim <- lm(democracy_score ~ gdp_growth + gdp + inflation + gni + gdppc + total_events + population,data = Merged_Dataset)

test <- Merged_Dataset %>%
  mutate(across(3:7, ~ ifelse(is.na(.), 0, 1), .names = "missing_indicator_{col}")) %>%
  filter(Year == 2023)


test2023 <- lm(democracy_score ~ missing_indicator_gdp_growth + missing_indicator_gdp + missing_indicator_inflation + missing_indicator_gni + missing_indicator_gdppc + total_events/Population, data = Merged_Dataset)
summary(test2023)

#### violence merge?

violence_subset <- Merged_Dataset %>%
  mutate(vio_against_indv = abduction_forced_disappearance + sexual_violence + arrests) %>%
  mutate(dir_arm_confl = armed_clash + attack + government_regains_territory + nstate_takeover + chemical_weapon) %>%
  mutate(exp_weap = air_drone_strike + grenade + remote_explosive_landmine_ied + shell_art_missile_attack + suicide_bomb + disrupted_weapons_use) %>%
  mutate(civil_unrest = exc_force_against_prot + violent_demonstration + protest_with_intervention + mob_violence) %>%
  mutate(prop_infrast = looting_property_destruction + hdqt_base_est) %>%
  select(Country_Name, Year, gdp_growth, gdp, inflation, gni, gdppc, democracy_score, Population, 
         vio_against_indv, dir_arm_confl, exp_weap, civil_unrest, prop_infrast, other, total_events)

write_dta(violence_subset, "/Users/kayleywatson/Econ211_violence_subset.dta")
write.csv(violence_subset, "/Users/kayleywatson/Econ211_violence_subset", row.names = FALSE)

#no dummy var
population_long <- pop_long

names(population_long)[1] <- "country"
names(population_long)[2] <- "year"

names(fh_wb_violence)[3] <- "gdp_growth"

violence_counts <- fh_wb_violence %>%
  left_join(population_long, by = c("country", "year")) %>%
  mutate(vio_against_indv = abduction_forced_disappearance + sexual_violence + arrests) %>%
  mutate(dir_arm_confl = armed_clash + attack + government_regains_territory + nstate_takeover + chemical_weapon) %>%
  mutate(exp_weap = air_drone_strike + grenade + remote_explosive_landmine_ied + shell_art_missile_attack + suicide_bomb + disrupted_weapons_use) %>%
  mutate(civil_unrest = exc_force_against_prot + violent_demonstration + protest_with_intervention + mob_violence) %>%
  mutate(prop_infrast = looting_property_destruction + hdqt_base_est) %>%
  select(country, year, gdp_growth, gdp, inflation, gni, gdppc, democracy_score, Population, 
         vio_against_indv, dir_arm_confl, exp_weap, civil_unrest, prop_infrast, other) 
write.csv(violence_counts, "/Users/kayleywatson/Econ211_violence_counts", row.names = FALSE)
write_dta(violence_counts, "/Users/kayleywatson/Econ211_violence_counts.dta")

#GINI

GINI <- read_csv("/Users/kayleywatson/Downloads/UN_GINI_ex.csv") %>%
  select(-`Value Footnotes`) %>%
  na.omit() %>%
  rename(country = `Country or Area`) %>%
  rename(year = Year) %>%
  rename(gini = Value) %>%
  mutate(year = as.numeric(year)) %>%
  mutate(gini = as.numeric(gini))

violence_add_gini <- violence_counts %>% 
  left_join(GINI, by = c("country", "year")) 

write.csv(violence_add_gini, "/Users/kayleywatson/Econ211_violence_counts_gini_2", row.names = FALSE)
write_dta(violence_add_gini, "/Users/kayleywatson/Econ211_violence_counts_gini_2.dta")
  

  
  
  
