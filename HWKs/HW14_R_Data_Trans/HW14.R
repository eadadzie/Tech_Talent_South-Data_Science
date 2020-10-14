### EX

library(tidyverse)
library(dplyr)
library(knitr)
library(readr)
library(dplyr)

# Ex 1
file_list <- read_csv(readr_example())
file_list

# Ex 2
mtcars <- read_csv(readr_example("mtcars.csv"))
mtcars

# Ex 3
head(mtcars, 10)

# Ex 4
ex_log = read_log(readr_example("example.log"))
ex_log

# Ex 5
library("readxl")

excel_sheets(readxl_example("datasets.xlsx"))
path <- readxl_example("datasets.xls")
lapply(excel_sheets(path), read_excel, path = path)

# Ex 6
read_excel(readxl_example("datasets.xlsx"), sheet = 4)

# Ex 7
library(AER)

data("Fertility")
glimpse(Fertility)


# Ex 8
Fertility[35:50, c("age", "work")]

# Ex 9
last_row <- Fertility[dim(Fertility)[1], ]
print(last_row)

# Ex 10
more_kids <- Fertility[which(Fertility[,"morekids"] == "yes"),]
nrow(more_kids)
count(more_kids)

# Ex 11

# A long approach
unique(Fertility[c("gender1", "gender2")] )

num_twoBoys <- count(Fertility[which(Fertility[,"gender1"] == "male" & Fertility[,"gender2"] == "male"),])
num_twoGirls <- count(Fertility[which(Fertility[,"gender1"] == "female" & Fertility[,"gender2"] == "female"),])
num_BoyGirl <- count(Fertility[which(Fertility[,"gender1"] == "male" & Fertility[,"gender2"] == "female"),])
num_GirlBoy <- count(Fertility[which(Fertility[,"gender1"] == "female" & Fertility[,"gender2"] == "male"),])

max(num_twoBoys, num_twoGirls, num_BoyGirl, num_GirlBoy)

sprintf("male-male: %s | female-female: %s | male-female: %s | female-female: %s", num_twoBoys, num_twoGirls, num_BoyGirl, num_GirlBoy)


# A concise and efficient approach
df_agg <- aggregate(numeric(nrow(Fertility)), Fertility[c("gender1", "gender2")], length)
df_agg

df_agg[which.max(df_agg$x),]

# OR df_agg[which(df_agg[, "x"] == max(df_agg$x)),]
