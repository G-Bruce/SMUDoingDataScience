# Unit 1 Breakout Group Assignment

# O.W.L. Metrics 2017
# Contact Ministry of Magic at ministry@magic.com with questions
# Basic Demographics and scores of Fifth Years at Hogwarts' School of Witchcraft and Wizardry
# Created August 30, 2017
# Paired Dataset: OWLexamresults.csv

# Read in file
df<-read.csv("../../data/OWLexamresults.csv")

# How many students?
dim(df) # Shows both cases and variables
length(df$Student) # Looks at cases of a vector
unique(df$Student) # In case there were repeats

# How many pets do the fifth years have?
sum(df$Pet) # Add up all the pets!

# What is the average number of O.W.L.s that they pass?
mean(df$Pass, na.rm = TRUE) # Remember, you can use ?mean to see options you can add
round(mean(df$Pass, na.rm = TRUE), 2) # You can nest functions as well.  Rounding to 2 digits.