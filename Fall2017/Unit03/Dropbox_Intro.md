# File Management Basics - Dropbox_Example
Tom Tibbett  


```r
knitr::opts_chunk$set(echo = TRUE)
```

### Unit 3: Calling Data from a Dropbox Account

Objectives

* Downloading Data from Christopher Gandrud's Dropbox Folder
* Using rio package to import something from URLs
* File is on Financial Regulators

Installing rio package.  IMPORTANT: NEED install_formats() to complete the installation

* install.packages("rio")
* install_formats() - May have to do this as well.


```r
library("rio")
```

### Using Rio to Import
There are other libraries to do this, but here's one suggestion from another faculty member.

```r
URL <- "https://www.dropbox.com/s/130c5ol3o2jjmgk/public.fin.msm.model.csv?raw=1"
FinRegulatorData <- rio::import(URL)
```

### Structure
Let's take a look at the structure of the dataset.

```r
summary(FinRegulatorData)
```

```
##       idn          country               year        reg_4state   
##  Min.   : 1.00   Length:1615        Min.   :1987   Min.   :1.000  
##  1st Qu.:21.00   Class :character   1st Qu.:1992   1st Qu.:1.000  
##  Median :42.00   Mode  :character   Median :1997   Median :2.000  
##  Mean   :41.85                      Mean   :1997   Mean   :2.402  
##  3rd Qu.:62.00                      3rd Qu.:2002   3rd Qu.:4.000  
##  Max.   :83.00                      Max.   :2006   Max.   :4.000
```

```r
str(FinRegulatorData)
```

```
## 'data.frame':	1615 obs. of  4 variables:
##  $ idn       : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ country   : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
##  $ year      : int  1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 ...
##  $ reg_4state: int  1 1 1 1 1 1 1 1 1 1 ...
```

```r
unique(FinRegulatorData$country)
```

```
##  [1] "Afghanistan"          "Albania"              "Argentina"           
##  [4] "Australia"            "Austria"              "Bahamas"             
##  [7] "Bahrain"              "Bangladesh"           "Barbados"            
## [10] "Belgium"              "Brazil"               "Brunei Darussalam"   
## [13] "Bulgaria"             "Canada"               "Chile"               
## [16] "China"                "Colombia"             "Croatia"             
## [19] "Cyprus"               "Czech Republic"       "Denmark"             
## [22] "Dominican Republic"   "Ecuador"              "Egypt"               
## [25] "El Salvador"          "Estonia"              "Finland"             
## [28] "France"               "Germany"              "Ghana"               
## [31] "Greece"               "Guatemala"            "Honduras"            
## [34] "Hong Kong"            "Hungary"              "Iceland"             
## [37] "India"                "Indonesia"            "Ireland"             
## [40] "Israel"               "Italy"                "Jamaica"             
## [43] "Japan"                "Jordan"               "Kenya"               
## [46] "Korea"                "Latvia"               "Lithuania"           
## [49] "Luxembourg"           "Macedonia"            "Malawi"              
## [52] "Malaysia"             "Malta"                "Mexico"              
## [55] "Morocco"              "Netherlands"          "New Zealand"         
## [58] "Nicaragua"            "Nigeria"              "Norway"              
## [61] "Oman"                 "Peru"                 "Philippines"         
## [64] "Poland"               "Portugal"             "Saudi Arabia"        
## [67] "Singapore"            "Slovak Republic"      "Slovenia"            
## [70] "South Africa"         "Spain"                "Sri Lanka"           
## [73] "Sweden"               "Switzerland"          "Taiwan"              
## [76] "Thailand"             "Turkey"               "Uganda"              
## [79] "United Arab Emirates" "United Kingdom"       "United States"       
## [82] "Vietnam"              "Zambia"
```

```r
# Change to factor
FinRegulatorData$country<-as.factor(FinRegulatorData$country)
```

### Generating counts of a category
The plyr library used to be one of the biggest libraries in R.  Here, we'll see how easy it is to count factors.

```r
library('plyr')
count(FinRegulatorData, "country")
```

```
##                 country freq
## 1           Afghanistan   20
## 2               Albania   20
## 3             Argentina   20
## 4             Australia   20
## 5               Austria   20
## 6               Bahamas   20
## 7               Bahrain   20
## 8            Bangladesh   20
## 9              Barbados   20
## 10              Belgium   20
## 11               Brazil   20
## 12    Brunei Darussalam   20
## 13             Bulgaria   20
## 14               Canada   20
## 15                Chile   20
## 16                China   20
## 17             Colombia   20
## 18              Croatia   16
## 19               Cyprus   20
## 20       Czech Republic   14
## 21              Denmark   20
## 22   Dominican Republic   20
## 23              Ecuador   20
## 24                Egypt   20
## 25          El Salvador   20
## 26              Estonia   16
## 27              Finland   20
## 28               France   20
## 29              Germany   20
## 30                Ghana   20
## 31               Greece   20
## 32            Guatemala   20
## 33             Honduras   20
## 34            Hong Kong   20
## 35              Hungary   20
## 36              Iceland   20
## 37                India   20
## 38            Indonesia   20
## 39              Ireland   20
## 40               Israel   20
## 41                Italy   20
## 42              Jamaica   20
## 43                Japan   20
## 44               Jordan   20
## 45                Kenya   20
## 46                Korea   20
## 47               Latvia   16
## 48            Lithuania   16
## 49           Luxembourg   20
## 50            Macedonia   15
## 51               Malawi   20
## 52             Malaysia   20
## 53                Malta   20
## 54               Mexico   20
## 55              Morocco   20
## 56          Netherlands   20
## 57          New Zealand   20
## 58            Nicaragua   20
## 59              Nigeria   20
## 60               Norway   20
## 61                 Oman   19
## 62                 Peru   20
## 63          Philippines   20
## 64               Poland   16
## 65             Portugal   20
## 66         Saudi Arabia   20
## 67            Singapore   20
## 68      Slovak Republic   14
## 69             Slovenia   13
## 70         South Africa   20
## 71                Spain   20
## 72            Sri Lanka   20
## 73               Sweden   20
## 74          Switzerland   20
## 75               Taiwan   20
## 76             Thailand   20
## 77               Turkey   20
## 78               Uganda   20
## 79 United Arab Emirates   20
## 80       United Kingdom   20
## 81        United States   20
## 82              Vietnam   20
## 83               Zambia   20
```

### Using the updated dplyr package
This looks extremely similar, but it offers information in tibble format.

```r
library('dplyr')
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:plyr':
## 
##     arrange, count, desc, failwith, id, mutate, rename, summarise,
##     summarize
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
count(FinRegulatorData, country)
```

```
## # A tibble: 83 x 2
##        country     n
##         <fctr> <int>
##  1 Afghanistan    20
##  2     Albania    20
##  3   Argentina    20
##  4   Australia    20
##  5     Austria    20
##  6     Bahamas    20
##  7     Bahrain    20
##  8  Bangladesh    20
##  9    Barbados    20
## 10     Belgium    20
## # ... with 73 more rows
```

