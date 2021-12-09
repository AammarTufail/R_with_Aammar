Combine two data frames
================
RwithAammar

## 1- Install following packages

    install.packages("dplyr")
    install.packages("tidyr")
    install.packages("writexl")

## 2- Load packages

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyr)
library(writexl)
```

## 3- Load or Import your data sets:

we will use builtin data sets of R for this purpose

``` r
data("ToothGrowth")
data("iris")
```

## 4- To combine different column into another new dataframe, we have to use **bind_cols()** function of *dplyr*

``` r
new_datframe <- as.data.frame(bind_cols(iris[0:50,2:4], ToothGrowth[0:50,2:3]))
tibble(new_datframe) #to view dataset
```

    ## # A tibble: 50 x 5
    ##    Sepal.Width Petal.Length Petal.Width supp   dose
    ##          <dbl>        <dbl>       <dbl> <fct> <dbl>
    ##  1         3.5          1.4         0.2 VC      0.5
    ##  2         3            1.4         0.2 VC      0.5
    ##  3         3.2          1.3         0.2 VC      0.5
    ##  4         3.1          1.5         0.2 VC      0.5
    ##  5         3.6          1.4         0.2 VC      0.5
    ##  6         3.9          1.7         0.4 VC      0.5
    ##  7         3.4          1.4         0.3 VC      0.5
    ##  8         3.4          1.5         0.2 VC      0.5
    ##  9         2.9          1.4         0.2 VC      0.5
    ## 10         3.1          1.5         0.1 VC      0.5
    ## # ... with 40 more rows

**iris\[0:50,2:4\]** shows the 0:50 (0-50 rows), 2:4 (2-4 columns) from
iris data. You can use ***c(2,4,5)*** to specify columns and row numbers

## 5- Write the new data frame as an excel file

``` r
write_xlsx(new_datframe, ".\\new_dataset.xlsx") #export excel file
```

This will make an excel file based on the current dataframe into your
current working directory, therefore, set the working directory first by
pressing **Ctrl+Shift+H**

# *Subscribe our youtube channel (Codanics)\[<https://www.youtube.com/watch?v=rPAyZJ_4X70&list=PL9XvIvvVL50E8HimtAnVL8N70MqImYOLS>\] for a complete Data Science COurse in R.*
