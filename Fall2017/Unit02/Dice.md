# The dice Function
Tom Tibbett - tptibbett@gmail.com  
September 5, 2017  





## Background
The function ```dice``` can be used to simulate dice rolls with multiple or atypically sided dice (i.e., four-sided dice, 100-sided dice).  There are three arguments to this function.

* ```sides```: how many sides do the dice have?  The default is a standard six-sided die.
* ```reps```: how many dice are you rolling at once?
* ```adding```: Are there any modifiers you'd like to add after the dice are rolled?  You can add bonuses or levy penalties to a roll. The default is 0.

To Do:

* Create a variable that recognizes negative modifiers and have ```note``` return either ```+``` or ```-``` in the equation when printed.
* Create boolean argument to print dice rolls for QA purposes.

## Dice Function


```r
dice<-function(sides=6, reps, adding=0){
  x<-sample(1:sides, size = reps, replace=TRUE) # With dice, you roll with replacement
  total<-sum(x,na.rm = TRUE) + adding
  note<-paste0(reps,"d",sides," + ", adding)
  #print(note) # If you want to see the notation each time you roll, uncomment this part.
  total
}
```

Let's test it with 3 4-sided dice and adding 6.


```r
dice(sides=4, reps=3, adding=6)
```

```
## [1] 14
```

## Rolls

R is pretty good at doing mindless tasks in a loop.  It is very easy to form sampling distributions of the rolls from ```dice```.  As per the Central Limit Theorem, the resulting distribution of the totals should approach a normal distribution.  Of course, this is contingent on how many times you sample.  For this example, in the below code, I rolled 5 six-sided dice and added six.  Then I did that 499 more times for a 500-element vector of Totals, listed below.


```r
rolls<-0 # Initializing a numeric vector of Totals
for (i in 1:500){
  x<-dice(sides=6, reps=5, adding=6) # Creates a Total
  rolls[i]<-x # Adds this loop's total to the vector of Totals
}
rolls
```

```
##   [1] 27 28 23 24 26 19 28 24 24 15 29 21 22 19 23 25 21 28 23 25 20 21 24
##  [24] 21 23 27 24 26 24 26 22 19 24 25 29 19 25 24 24 27 24 24 21 23 21 29
##  [47] 26 27 22 26 24 24 18 25 16 31 23 25 25 21 22 23 18 25 23 27 23 30 26
##  [70] 17 19 27 28 26 21 24 21 23 24 29 26 25 30 26 23 20 23 22 25 26 22 31
##  [93] 23 14 33 29 21 32 20 22 23 26 24 24 25 22 23 27 22 24 26 23 17 27 26
## [116] 24 14 23 20 23 15 20 27 26 21 29 25 20 32 24 26 16 23 29 27 18 16 19
## [139] 24 25 21 23 26 21 25 20 27 22 21 23 23 25 24 21 28 23 22 21 29 25 18
## [162] 24 20 21 20 22 26 16 20 25 16 18 26 22 30 28 28 21 22 18 27 27 26 23
## [185] 23 22 30 23 23 33 25 25 22 23 25 28 26 27 25 22 26 23 24 30 26 28 22
## [208] 26 25 25 23 28 23 21 26 24 29 18 24 22 26 27 28 23 23 21 23 24 21 21
## [231] 25 27 25 20 24 19 28 21 24 24 22 21 24 23 25 28 30 23 26 18 27 30 26
## [254] 21 23 21 30 24 30 35 27 27 16 21 19 15 17 24 19 30 26 22 24 23 25 22
## [277] 26 21 16 23 24 19 30 29 25 22 23 24 23 25 33 22 26 25 23 27 28 20 15
## [300] 28 30 22 24 18 24 18 21 27 25 23 19 23 24 26 19 21 26 30 21 25 23 30
## [323] 24 12 27 26 31 22 17 25 18 23 23 23 20 27 23 25 25 20 23 23 30 24 16
## [346] 19 25 31 23 24 29 22 19 17 29 23 20 28 20 29 21 28 22 20 21 19 23 22
## [369] 17 24 28 22 18 19 26 26 17 25 23 21 25 28 21 32 25 23 15 24 25 21 23
## [392] 25 21 25 29 18 16 17 26 25 20 21 22 22 31 24 19 24 24 17 27 21 22 23
## [415] 18 18 20 31 17 28 23 21 24 29 30 26 23 24 17 17 24 26 25 24 22 25 24
## [438] 20 31 18 21 21 23 26 22 24 27 20 27 21 24 25 26 21 18 18 27 17 20 24
## [461] 28 23 20 24 29 18 26 23 17 27 19 28 17 23 19 29 34 23 20 28 20 24 21
## [484] 25 29 23 20 25 26 24 27 22 23 16 19 28 19 23 24 25
```

## Histogram of Rolls


```r
hist(rolls, main = "How often a total was rolled", xlab = "Dice roll total", col = "darkgreen")
```

![](Dice_files/figure-html/unnamed-chunk-5-1.png)<!-- -->


