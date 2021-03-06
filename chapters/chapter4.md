---
title: 'Chapter 4: Data Manipulation'
description:
  'Transform and reshape data.'
prev: /chapter3
next: /chapter5
type: chapter
id: 4
---



<exercise id="1" title="General information">

In this chapter we will discuss different elements regarding data manipulation with `R`.

In practice, data are commonly not presented in a format that is suitable for statistical analysis. Indeed, it is common to clean and transform data before proceeding to a statistical analysis. Common types of operations include cleaning and transforming variables, computing new variables, and joining different variables together. All these operations on data constitute the pre-processing stage of an analysis and it is known to be very time consuming. 

We define the process of cleaning, transforming and mapping data from one "raw" data format to another format more appropriate for statistical analysis as **data wrangling (or data munging, data cleaning, data pre-processing)**. The goal of data wrangling is to assure suitable data for statistical analysis.

`R` provides various tools for operations on data, such as the packages from the [`tidyverse`](https://www.tidyverse.org/) collection of `R` packages.

To demonstrate, we will assume tabular data for all operations presented in this chapter.

</exercise>



<exercise id="2" title="Getting started" type = "slides">
<slides source="chapter4_01">
</slides>
</exercise>



<exercise id="3" title="Select, slice and filter" type = "slides">
<slides source="chapter4_02">
</slides>
</exercise>

<exercise id="4" title="Rename, recode and mutate" type = "slides">
<slides source="chapter4_03">
</slides>
</exercise>

<exercise id="5" title="Summarise, group and arrange" type = "slides">
<slides source="chapter4_04">
</slides>
</exercise>

<exercise id="6" title="Pivot and joins" type = "slides">
<slides source="chapter4_05">
</slides>
</exercise>

<exercise id = "7" title ="Data manipulation: Exercises">

---

### 1) Consider the dataset `world` in the `poliscidata` package. Find the description of the dataset [here](https://rdrr.io/cran/poliscidata/man/world.html). Clean names of the variables and return the public expenditure on education as a percentage of GDP (UN) (`spendeduc`) and the public expenditure on health as a percentage of GDP (UN) (`spendhealth`) for the 5 countries with the highest oil production, in barrels per day (CIA) (`oil`).

<codeblock id="04_01">

</codeblock>


### 2) Consider the dataset `murders` in the `dslabs` package. Find the description of the dataset [here](https://www.rdocumentation.org/packages/dslabs/versions/0.7.3/topics/murders). Group the data by state abbreviation and create the summarizing variables `total_pop` and `total_murders`. Then, compute the variable `murder_rate` and extract the 5 state abreviations with the highest murder rates.

<codeblock id="04_02">

</codeblock>


### 3) Consider the dataset `esoph` in the `datasets` package. Find the description of the dataset [here](https://stat.ethz.ch/R-manual/R-patched/library/datasets/html/esoph.html). Rename the variables `alcgp` and `tobgp` to `alcool_consum` and `tobacco_consum`, respectively. Create a new variable that groups observation per alcool consumption to the groups: `"small drinker"`, `"medium drinker"`, `"heavy drinker"` and `"dangerous drinker"`. Then, group the data by these groups and sort the resulting group according to the highest number of cancer cases (`ncases`).

<codeblock id="04_03">

</codeblock>


### 4) Consider the dataset `results_us_election_2016` and the dataset `murders` in the `dslabs` package. Find the descriptions of the datasets [here](https://rdrr.io/cran/dslabs/man/polls_us_election_2016.html) and   [here](https://www.rdocumentation.org/packages/dslabs/versions/0.7.3/topics/murders), respectively. Join both datasets by `state` and identify the winner of the election by state by computing a variable `prop_clinton_trump`. Rename the variable `total` from the `murders` dataset to `total_murders`. Sort (in decreasing order) the observations based on `total_murder` and output the variables `state`, `total_murders` and `winner` for the ten first observations. 

<codeblock id="04_04">

</codeblock>


### 5) Consider the following dataset:

```out
  id treatment_control measure_1 measure_2 measure_3 measure_4
1 01                 1      0.21      0.43      0.52      0.61
2 02                 0      0.45      0.72      0.87      0.97
3 03                 1      0.60      0.50      0.42      0.61
4 04                 1      0.71      0.41      0.14      0.26
5 05                 0      0.11      0.52      0.23      0.85
```

Complete the code to obtain the following pivoted dataset (we here just print the first few observations for a glance of the structure):

```out
   id    treatment_control measurement value
 1 01                    1 measure_1    0.21
 2 01                    1 measure_2    0.43
 3 01                    1 measure_3    0.52
 4 01                    1 measure_4    0.61
 5 02                    0 measure_1    0.45
 6 02                    0 measure_2    0.72
```

<codeblock id="04_05">

</codeblock>

