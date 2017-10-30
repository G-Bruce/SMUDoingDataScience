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
## [1] 11
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
##   [1] 28 20 23 32 26 20 30 23 26 22 25 29 16 19 28 25 28 18 18 21 24 19 25
##  [24] 23 21 20 24 23 26 25 30 17 16 30 21 23 21 20 14 27 27 28 21 19 25 20
##  [47] 21 24 17 24 21 20 23 22 21 29 20 24 27 21 22 23 29 31 21 22 23 24 22
##  [70] 21 22 23 25 21 20 19 20 19 21 25 25 26 22 20 20 21 19 24 18 22 25 21
##  [93] 29 27 15 23 26 22 22 22 21 21 24 20 27 17 24 24 19 24 21 31 24 21 23
## [116] 25 25 21 21 21 21 20 31 22 17 17 25 19 24 18 19 23 19 23 21 24 25 26
## [139] 17 25 30 26 16 24 16 22 25 24 28 26 22 17 15 21 15 24 22 24 23 19 21
## [162] 17 17 25 20 20 21 18 21 26 29 24 30 16 24 27 20 16 25 25 23 24 23 33
## [185] 28 23 23 22 21 16 30 25 21 30 28 25 22 24 21 22 24 28 25 21 30 24 23
## [208] 25 24 20 22 18 25 26 22 21 21 25 14 31 27 24 29 18 20 25 28 23 22 19
## [231] 27 17 27 22 18 26 23 25 17 18 20 28 26 21 19 18 23 20 25 20 23 24 28
## [254] 22 28 25 22 22 22 24 21 29 19 33 22 21 24 25 22 22 28 26 24 17 23 22
## [277] 28 29 18 18 18 20 25 16 24 28 28 27 23 26 24 27 30 25 21 26 25 27 20
## [300] 30 19 19 22 22 28 27 22 24 24 23 28 30 27 25 19 23 16 23 23 21 24 18
## [323] 26 22 27 19 23 28 20 24 18 19 27 25 29 18 23 21 15 14 26 22 28 23 26
## [346] 23 26 24 21 25 19 19 25 25 21 22 21 26 20 25 28 27 23 18 27 26 18 26
## [369] 25 19 21 20 27 30 26 18 29 18 30 33 23 27 19 25 23 22 25 23 25 24 25
## [392] 21 18 23 19 19 22 25 21 29 25 24 21 17 24 28 30 18 24 28 21 29 18 23
## [415] 26 24 19 22 24 28 20 23 17 24 24 29 21 19 26 27 24 20 21 24 26 27 26
## [438] 18 19 27 30 28 20 21 28 31 28 20 26 27 26 30 17 21 26 27 24 26 18 27
## [461] 26 23 17 31 27 22 20 17 23 20 23 27 28 27 22 23 26 24 26 23 23 21 16
## [484] 24 24 25 22 23 22 28 26 23 21 30 29 26 17 24 25 23
```

## Histogram of Rolls


```r
hist(rolls, main = "How often a total was rolled", xlab = "Dice roll total", col = "darkgreen")
```

![](Dice_files/figure-html/unnamed-chunk-5-1.png)<!-- -->


