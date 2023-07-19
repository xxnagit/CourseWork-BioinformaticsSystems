
###Introduction to R

dir.create("NEW_Directory")
#Get your current working directory
getwd() #hit Run or press Ctrl+Enter to run this line

#Set the working directory your want
setwd("NEW_Directory")


#List the files in the working directory
dir()

list.files()



######################################################
###Arithmetic in R
######################################################
#Just type in the entire formula

5 + 6

9 - 3

4 * 8

12 / 3

2^4

(5 + 9)/2 + 12^2

sqrt(9) #sqrt is a function calculates the square root

log(10)

log2(4) #But we do not have log3 or log5

log(9, base = 3) #set the base

#Variable/object, name and value
x = 5

x

y <- 10; y  #We can state more than one commands in one line by ";"

n = "black"; print(n)

sumN <- 5 + 1 * 4

print(sumN)



######################################################
###Data Types in R
###Vector
######################################################

vec = c(1,2,3,7,8,9,10,14)

vec

vec[1:3]

vec[4:8]

#the number of elements in vector
length(vec) 

#remove the variable
rm(vec) 

#other ways to generate vector
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

#Reverse the elements
rev(color)

color[c(1,3,5)] #indicate the elements by positions

#repeat red
color1 = rep("red", 8)

color1

color2 = c(c("bule","green"), rep("red",2), rep("purple",3))

color2

days_vector = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

#select element(s)
days_vector[3]

days_vector[c(3,5)]

days_vector[3:5]

rev(days_vector)

#A logical vector
l = c(TRUE, TRUE, FALSE, T, F) #note, no quotes needed

print(l) #print the vector

#Vector calculation
a = c(1,2,3,4,5)

a * 2

a * a

b = c(7,3,9,3,4)

a + b

#Try this
b = c(6,5,4,7,8,9)

a + b

ls() #list all the variablts 

rm(list = ls())


######################################################
###Matrix
######################################################

my_matrix = matrix(1:9, byrow = TRUE, nrow =3)

my_matrix

my_matrix = matrix(1:9, byrow = FALSE, nrow =3)

my_matrix

my_matrix = matrix(1:20, byrow = FALSE, nrow =4)

my_matrix

#Transposition of the matrix m
m1 = t(my_matrix) 

m1

#nameing rows and columns
rownames(my_matrix) = c("r1","r2","r3","r4")

colnames(my_matrix) = c("c1","c2","c3","c4","c5")

my_matrix

#The length of the names must equal to the dimension 
rownames(my_matrix) = c("only1","only2","only3") #error

#Sums by row or colunms
rowSums(my_matrix)

colSums(my_matrix)

#Another example, box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)

empire_strikes <- c(290.475, 247.900)

return_jedi <- c(309.306, 165.800)

#Create a matrix from vectors
box_office <- c(new_hope, empire_strikes, return_jedi)

star_war <- matrix(box_office, nrow = 3, byrow = TRUE)

star_war

title <- c("new_hope", "empire_strikes", "return_jedi")

title

region <- c("US", "non-US")

region

rownames(star_war) = title

colnames(star_war) = region

star_war

#OR, rbind(), connect vectors/matirx by row. Also cbind()
star_war <- rbind(new_hope, empire_strikes, return_jedi)

star_war

colnames(star_war) = region

star_war

rowSums(star_war)

colSums(star_war)

#selected parts of the matrix
star_war[1,1]

#the entire second row
star_war[2,]

star_war[1:2, 1:2]



######################################################
####Factors
######################################################

#Create a vector contains the observations that belong to a limited number of categories
gender_vector = c("Male", "Female", "Female", "Male", "Male")

#Create a factor objective
factor_gender_vector = factor(gender_vector) 

factor_gender_vector

levels(factor_gender_vector)

summary(factor_gender_vector)



######################################################
###Data frame
######################################################

name <- c("John", "Mary", "David", "Joe")

gender <- c("male", "female", "male", "female")

married <- c(TRUE, TRUE, FALSE, FALSE)

age <- c(42, 28, 19, 10)

info_df <- data.frame(name, gender, married, age)

info_df

info_df$name

info_df$married

#Convert the type of the data
star_war_DF = as.data.frame(star_war)

class(star_war_DF)

info_matrix = as.matrix(info_df)

info_matrix

class(info_matrix)



######################################################
###List
######################################################

info_list = list(name, gender, married, age)

info_list

class(info_list)

#The list allows different lengths of vectors
x = c(1,2,3,4,5,6)

info_list_1 = c(info_list, list(x))

info_list_1



######################################################
###Basic control statements
###loop
######################################################

for(i in 1:10){
  print(i)
}

color = c("red","yellow","blue","purple","black")

for(col in color){
  print(col)
}

###if-else
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



######################################################
###Customer function
######################################################

#calulate (a + b * 5)^2
calcu = function(a, b){
  result = (a + b * 5)^2
  return(result)
}

#a = 4, b = 2
calcu(4,2)

#a = 0.5, b = 0.1
calcu(0.5, 0.1)



