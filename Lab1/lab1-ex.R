setwd("~/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab1")
x1 = 5 + 6
x2 = 9 - 3
x3 = 4 * 8
x4 = 12 / 3
x5 = 2^4
x6 = (5 + 9)/2 + 12^2
x7 = sqrt(9) #sqrt is a function calculates the square root
x8 = log(10)
x9 = log2(4) 
x10 = log(9, base = 3) 
##############################
#Variable/object#
x = 5
x
y <- 10; y  
n = "black"; print(n)
sumN <- 5 + 1 * 4
print(sumN)
##############################
#Vectors#
vec = c(1,2,3,7,8,9,10,14)
vec
vec[1:3] #print the first 3 items in vec
vec[4:8] #print the rest of the vec
length(vec)
rm(vec)
vec1 = c(10:20)
vec1
vec2 = seq(1,10,1)
vec2
vec3 = seq(10,20,2)
vec3
vec4 = seq(1,2, by = 0.1)
vec4
rm(vec1, vec2, vec3, vec4)
color = c("red","blue","yellow","green","purple")
rev(color)
color[c(1,3,5)]
color1 = rep("red", 8)
color1
color2 = c(c("bule","green"), rep("red",2), rep("purple",3))
color2
days_vector = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
days_vector[3]
days_vector[c(3,5)] #print 3rd and 5th in days_vector
days_vector[3:5] #print from 3rd to 5th in days_vector
rev(days_vector)
l = c(TRUE, TRUE, FALSE, T, F)
print(l)
a = c(1,2,3,4,5)
a1 = a * 2; a1
a2 = a * a; a2
b = c(7,3,9,3,4)
a3 = a + b; a3
b = c(6,5,4,7,8,9)
a4 = a + b; a4
ls() 
rm(list = ls())
##############################
#Matrix#
my_matrix = matrix(1:9, byrow = TRUE, nrow =3); my_matrix
my_matrix = matrix(1:9, byrow = FALSE, nrow =3); my_matrix
my_matrix = matrix(1:20, byrow = FALSE, nrow =4); my_matrix
m1 = t(my_matrix); m1
rownames(my_matrix) = c("r1","r2","r3","r4")
colnames(my_matrix) = c("c1","c2","c3","c4","c5")
my_matrix
rownames(my_matrix) = c("only1","only2","only3") #error
rowSums(my_matrix)
colSums(my_matrix)
#example
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.800)
box_office <- c(new_hope, empire_strikes, return_jedi)
star_war <- matrix(box_office, nrow = 3, byrow = TRUE); star_war
title <- c("new_hope", "empire_strikes", "return_jedi"); title
region <- c("US", "non-US"); region
rownames(star_war) = title
colnames(star_war) = region
star_war
star_war <- rbind(new_hope, empire_strikes, return_jedi);star_war
colnames(star_war) = region
star_war
rowSums(star_war)
colSums(star_war)
star_war[1,1]
star_war[2,]
star_war[1:2, 1:2]
##############################
#Factors#
gender_vector = c("Male", "Female", "Female", "Male", "Male")
factor_gender_vector = factor(gender_vector); factor_gender_vector
levels(factor_gender_vector)
summary(factor_gender_vector)
##############################
#Data Frame#
name <- c("John", "Mary", "David", "Joe")
gender <- c("male", "female", "male", "female")
married <- c(TRUE, TRUE, FALSE, FALSE)
age <- c(42, 28, 19, 10)
info_df <- data.frame(name, gender, married, age); info_df
info_df$name
info_df$married
star_war_DF = as.data.frame(star_war)
class(star_war_DF)
info_matrix = as.matrix(info_df); info_matrix
class(info_matrix)
##############################
#List#
info_list = list(name, gender, married, age); info_list
class(info_list)
x = c(1,2,3,4,5,6)
info_list_1 = c(info_list, list(x)); info_list_1
##############################
#Loop#
for(i in 1:10){
  print(i)
}

color = c("red","yellow","blue","purple","black")

for(col in color){
  print(col)
}
##############################
#If-else#
color = c("red","yellow","blue","purple","black")
for(col in color){
  if(col != "blue"){
    print(col)
  }
}

for(j in 1:20){
  if(j > 10){
    print(j)
  }else{
    print(j * 10)
  }
}
##############################
#Custimized Function#
#calulate (a + b * 5)^2
calcu = function(a, b){
  result = (a + b * 5)^2
  return(result)
}

calcu(4,2)
calcu(0.5, 0.1)




