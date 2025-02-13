************************************************************
**                                                        **
**   Sandhu & Watson Econometric Variables and Democracy  **
**         Last Revised 12/13 at 4:39 pm                  **
**                                                        **
************************************************************


***Reweighting***
gen wGDP = gdp/100000000
	*Reweights GDP to hundreds of millions.
gen wPopulation = Population/100000
	*Reweights Population to hundreds of thosands.
gen wGDPPC = gdppc/1000
	*Reweights GDP per Capita to thousands.
gen log_GDPpc = log(gdppc)
	*Creates the log of GDP per Capita.

	
***Generating Variables***
egen country_id=group(country)
	*Generates numerical values for countries | Drawn from Byker lab 9
bys country: egen dem_c_avg=mean(democracy_score)
	*Creates variable that holds average country democracy score
	

***Regressions***
*Naive Regression
reg democracy_score log_GDPpc, robust
outreg2 using LROutput, excel replace ctitle(Naive)

*Inflation Regression
reg democracy_score log_GDPpc inflation, robust
outreg2 using LROutput, excel append ctitle(Inflation)

*Gini Regression
reg democracy_score log_GDPpc gini, robust
outreg2 using LROutput, excel append ctitle(Gini Coefficient)

*Conflict Regression
reg democracy_score log_GDPpc vio_against_indv exp_weap prop_infrast civil_unrest dir_arm_confl other, robust
outreg2 using LROutput, excel append ctitle(Conflict)


***Panel Regressions***
xtset country_id year

*Country Fixed Effects
xtreg democracy_score log_GDPpc, fe cluster(country_id)
outreg2 using LROutput, excel append ctitle(State FE)

*Time Fixed Effects
xtreg democracy_score log_GDPpc i.year, vce(cluster country_id)
outreg2 using LROutput, excel append ctitle(Time FE)

*Both Fixed Effects
xtreg democracy_score log_GDPpc i.year, fe cluster(country_id)
outreg2 using LROutput, excel append ctitle(Both)

*Final Regression
xtreg democracy_score log_GDPpc inflation gini vio_against_indv dir_arm_confl exp_weap civil_unrest prop_infrast other i.year, fe cluster(country_id)
outreg2 using LROutput, excel append ctitle(Final)


***Hypothesis Testing***
testparm i.year

test vio_against_indv dir_arm_confl exp_weap civil_unrest prop_infrast other


***Visuals***
twoway (scatter dem_c_avg gdp_c_avg) (lfit dem_c_avg gdp_c_avg) if year == 2023, title("Democracy and Log GDP Per Capita") subtitle("average 2023") ytitle("Democracy Index") xtitle("Log GDP per capita") legend(off) name(c_averages, replace)
	*Creates scatterplot displaying how the log GDP per Capita influences Democracy Score in 2023.
	
twoway (scatter dem_c_avg gdp_c_avg) (lfit dem_c_avg gdp_c_avg), title("Democracy and Log GDP Per Capita") subtitle("averages 2006-2023") ytitle("Democracy Index") xtitle("Log GDP per capita") legend(off) name(c_averages, replace)
	*Creates scatterplot displaying how the log GDP per Capita influences Democracy Score from 2006 to 2023.

summarize
	*Creates table that we then edited in Excel to make a table with all the relevant variables in our study.

