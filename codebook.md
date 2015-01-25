first I loaded the dplyr package, that we will use later. 
next I did as follows:

1. read the data into well named variable using read.table function
2.bind the measurment of the two groups (test and train) together to one variable
3.defined the wanted varibale the contains the word "mean" or "std" using grep and extracting only those 
4.binding the activity and the subjects data and adding to the measurments data frame with titles
5. transforming the numbers of the activity to the actuak name of the activity
6.grouping the data set by the sybject and the Avtivity type using group_by function
7. summarizing the above using "summarise each" function and producting the wanted dataset
