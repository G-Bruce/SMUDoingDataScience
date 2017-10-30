# Tidy Data - A Primer
Tom Tibbett  



Disclaimer: These are not real data.  They have been fabricated for instructional purposes.

### Live Coding Session Demo
First, let's read in, well, read_in.txt.  This file is tab delimited with no headers.  My client informed me what the column names are.


```r
df <- read.table("../../data/read_in.txt", sep="\t", header=FALSE, col.names = c("Name", "ID", "IQ", "Grades", "Legs"))
head(df)
```

```
##                 Name    ID  IQ Grades Legs
## 1      Whit_Lukianov 10001  93  68.24    2
## 2     Rosene_Sculley 10002  99  53.98    2
## 3 Artemas_Rickertsen 10003  87  62.04    2
## 4  Anestassia_Ervine 10004  95  70.77    2
## 5      Isaak_Stelfax 10005  95  91.00    2
## 6 Saundra_Benettelli 10006 101  98.43    2
```

Next, let's take a look at some of the summary information.


```r
summary(df)
```

```
##              Name           ID              IQ             Grades      
##  Ad_Furlonge   :  1   Min.   :10001   Min.   : 67.00   Min.   : 52.10  
##  Adham_Bowart  :  1   1st Qu.:10039   1st Qu.: 89.00   1st Qu.: 67.30  
##  Ailina_Alyutin:  1   Median :10078   Median : 99.00   Median : 73.38  
##  Alethea_Buss  :  1   Mean   :10078   Mean   : 99.22   Mean   : 73.78  
##  Alfonso_Scragg:  1   3rd Qu.:10116   3rd Qu.:109.00   3rd Qu.: 79.42  
##  Ambros_Charter:  1   Max.   :10154   Max.   :134.00   Max.   :102.41  
##  (Other)       :148                                                    
##       Legs      
##  Min.   :1.000  
##  1st Qu.:2.000  
##  Median :2.000  
##  Mean   :1.994  
##  3rd Qu.:2.000  
##  Max.   :3.000  
## 
```

```r
unique(df$Legs)
```

```
## [1] 2 1 3
```

Hmm... that's weird that someone has three legs.  I ought to go back and ask the client about what the Legs column means!

### Splitting a Name

We'll be using the reshape2 package as an alternative to the Lecture Assignments.  With R, you have options in what library you use.

I'm going to use colsplit(), because it's a quick way of cutting out names if there's an obvious separator.  Here, we have an underscore.


```r
library("reshape2")
vars<-colsplit(df$Name, "_", names=c("FirstName", "LastName"))
df<-cbind(vars, df) # Adding it back to the original dataframe.
head(df)
```

```
##    FirstName   LastName               Name    ID  IQ Grades Legs
## 1       Whit   Lukianov      Whit_Lukianov 10001  93  68.24    2
## 2     Rosene    Sculley     Rosene_Sculley 10002  99  53.98    2
## 3    Artemas Rickertsen Artemas_Rickertsen 10003  87  62.04    2
## 4 Anestassia     Ervine  Anestassia_Ervine 10004  95  70.77    2
## 5      Isaak    Stelfax      Isaak_Stelfax 10005  95  91.00    2
## 6    Saundra Benettelli Saundra_Benettelli 10006 101  98.43    2
```

### Searching with grep

First off, remember that subsetting dataframes is as simple as ```df[{row}, {column}]```.

* df[1,] - if you want the first row and all columns
* df[1, c(1,2)] - if you want the first row and columns 1 and 2
* df[1, c("ID", "Gophers")] - Same deal, but with explicit names

You can even use logical statements to affect your dataframe.

* df[which(df$Legs==3),] - To find the row(s) which there are persons with three legs.
* df[which(df$Legs < 3),] - To find the row(s) which there are persons with less than three legs.
* df[order(df$IQ), ] - To sort your dataframe by ascending IQ score

To find a particular pattern within strings, you can format things similarly to the df[row, columns] structure. Using regular expression syntax, which I highly recommend you read up using ```?grep```, you can search for and display matches to patterns in your character data.

My client would like to see all the people with last names that start with "Pa."

* ```^``` indicates you want to make sure this is at the start of a string.
* ```[Pp]``` indicates the first character should be either a P or a p.
* ```a``` indicates the next letter should be a lowercase a.
* So, a match here indicates that a last name starts with either 'Pa' or 'pa.'


```r
df[grep('^[Pp]a', df$LastName),]
```

```
##    FirstName LastName           Name    ID IQ Grades Legs
## 44     Lesly Paterson Lesly_Paterson 10044 76  74.78    2
## 64    Tracey  Parrish Tracey_Parrish 10064 97  74.56    2
## 72     Tybie   Pagnin   Tybie_Pagnin 10072 76  84.06    2
```

### Reports

Now I can put all of this together to create reports my client needs.

* Ordering by descending IQ
* Including First Name and Last Name
* Dropping all other variables


```r
report<-df[order(-df$IQ),c("FirstName", "LastName", "IQ")]
report
```

```
##       FirstName      LastName  IQ
## 62      Fairfax          Real 134
## 121        Gare        Chaffe 134
## 19     Karlotte      Crisford 129
## 67         Lira      Winspurr 127
## 130        Hart        Oxtaby 122
## 137    Christan       Brymner 122
## 92     Madeline      Francois 121
## 10     Sharline       Doggett 120
## 42      Teirtza     Valentino 120
## 143      Catlin      Berriman 120
## 30    Stephenie       McIleen 119
## 59        Morty        Astell 119
## 60     Katerina        Gerren 119
## 73        Annie     Pritchitt 119
## 112       Adham        Bowart 119
## 139     Devonne       Chaundy 119
## 46       Merwyn          Arlt 118
## 65       Ambros       Charter 118
## 100      Lissie      Uttridge 118
## 21          Cob         Eliaz 117
## 32          Pet      Sterrick 117
## 49         Emma       Dongles 117
## 123    Maryanna          Sink 117
## 117     Merlina          Bown 116
## 15          Jim        Prosek 115
## 37        Tucky      Challens 115
## 76       Roxine     Nornasell 115
## 131      Nathan     Stilliard 115
## 84          Dar       Hurford 114
## 63       Marice        Kestle 113
## 35        Jerry        Twaite 112
## 153       Lewes     Jacobsson 112
## 23      Caprice   Toderbrugge 111
## 52   Marguerite         Roman 111
## 40       Galvan         Fogel 110
## 70    Demetrius       McMahon 110
## 103        Star   Rosenvasser 110
## 16        Lefty      Barribal 109
## 26     Orbadiah        Gapper 109
## 33      Pepillo       Gowrich 109
## 55       Kermie        Rymmer 109
## 78     Hurleigh        Ablett 109
## 90         Cort        Reolfi 109
## 94        Shell          Virr 109
## 114      Welbie    de Quincey 108
## 147      Ignace       Fairham 108
## 150     Darrell        Swaton 108
## 151    Katuscha          Born 108
## 22         Mike         Povah 107
## 126       Dolly       Huntall 107
## 132       Orlan          Lemm 106
## 20      Alethea          Buss 105
## 68  Cairistiona        Levett 105
## 25    Evangelin        Rieger 104
## 85       Josiah          Zink 104
## 87        Weber      Mackison 104
## 115   Hyacintha      Leborgne 104
## 149   Krystalle         Petre 104
## 45       Rodina       Follitt 103
## 48        Artur       Newtown 103
## 54       Vasily       Davidde 103
## 79         Flor        Hawyes 103
## 99        Vinni    Spottswood 103
## 101      Darbie        Tankus 103
## 106       Heall        Jankin 103
## 107      Buckie        Haysar 103
## 13         Tait        Kahane 102
## 29    Enriqueta      Roycroft 102
## 50           Ad      Furlonge 102
## 116       Ennis      Rickaert 102
## 6       Saundra    Benettelli 101
## 39      Rozanne        Domeny 100
## 71        Nikki        Edgars 100
## 74        Caryn    Aizkovitch 100
## 141      Maggie     Spratling 100
## 2        Rosene       Sculley  99
## 18      Erasmus       Skylett  99
## 38       Dulsea       Gerauld  99
## 66    Catherine         Shire  99
## 113       Dyana Cowperthwaite  99
## 120       Haley   Jedrzejczyk  99
## 124       Amory         Demko  98
## 127     Eolanda     Killigrew  98
## 142       Jaime       Gallier  98
## 64       Tracey       Parrish  97
## 91       Dewitt        Sandry  97
## 122     Malanie       Ketchen  97
## 31      Alfonso        Scragg  96
## 41        Morly    Grichukhin  96
## 53     Matthieu        Allitt  96
## 56       Clarke      Casellas  96
## 58       Ailina       Alyutin  96
## 108     Kirsten      Petrasch  96
## 111    Atalanta     McKeevers  96
## 4    Anestassia        Ervine  95
## 5         Isaak       Stelfax  95
## 28       Jacobo      Alenshev  95
## 109     Thornie          Igoe  95
## 125     Joseito       Nutbeem  95
## 144        Babs    Ollivierre  95
## 11       Anselm    MacTrustie  94
## 134      Normie      Blacktin  94
## 1          Whit      Lukianov  93
## 128   Kristofer       Goodman  93
## 7       Colleen         Linny  92
## 81       Dennis       Dugdale  92
## 83      Silvana      Amberger  92
## 93        Vinny     Vanderson  92
## 98       Delora        Burdas  92
## 14         Wilt       Mancell  91
## 75        Daron         Tebbe  91
## 129     Carolyn      Dohrmann  91
## 148       Lucio        Emblen  90
## 12     Nataline      Farquhar  89
## 27        Winny      Aldcorne  89
## 104     Fredric     Hucklesby  89
## 82        Dolli      Seacroft  88
## 95    Henderson           Pim  88
## 119       Rheba       Boolsen  88
## 140     Larissa         Fried  88
## 3       Artemas    Rickertsen  87
## 61        Brian         Frift  87
## 80        Corny       Goucher  87
## 88    Reinaldos        Effemy  86
## 135      Eartha       Tatnell  86
## 24        Terry   Dobrowolski  84
## 138      Temple       Lambdon  84
## 152      Ferrel       Faughny  84
## 9       Valerie       Kingham  83
## 57      Susanna       Topling  83
## 17        Yorgo      MacNamee  82
## 77          Dix         Folke  82
## 105       Niven         Klouz  82
## 133         Max       Mahomet  82
## 145      Saudra          Addy  82
## 154     Rosanne         Maben  82
## 89       Darrel       Girodin  81
## 96       Cyrill       Chidley  81
## 110       Jaime      Oldfield  81
## 136        Orin      Guiduzzi  80
## 36       Sandye        Mayhow  77
## 43     Gwenneth        Darree  76
## 44        Lesly      Paterson  76
## 72        Tybie        Pagnin  76
## 118      Melosa         Noice  76
## 34        Ruthy   Donnersberg  75
## 86       Rosita        Cordle  75
## 97        Cully        Treher  75
## 47       Gianna  Kolodziejski  74
## 146       Isaak       Farrall  73
## 51       Rockie      Mainland  72
## 69      Eustace     Wiltshier  72
## 102        Gage        Riseam  71
## 8        Noelyn        Fearne  67
```
