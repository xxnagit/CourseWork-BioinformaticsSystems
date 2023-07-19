#Install the bioconductor package
source("http://bioconductor.org/biocLite.R") 
biocLite("survival") 
library (survival) #load the package 
data (stanford2)
#Q1
dim(stanford2)
#Q2
colnames(stanford2, do.NULL = TRUE, prefix = "col")
?stanford2
#Q3
sub_status0 <- subset(stanford2, status == 0)
survival_status0 <- sub_status0$time
sub_status1 <- subset(stanford2, status == 1)
survival_status1 <- sub_status1$time
hist(survival_status0, xlab = "survival time", col = "red")
hist(survival_status1, xlab = "survival time", col = "blue")
#Q4
boxplot(survival_status0, xlab = "survival days for patient status = 0", 
        col = "red")
boxplot(survival_status1, xlab = "survival days for patient status = 1", 
        col = "blue")
#Q5
plot(sub_status0$age, sub_status0$time, pch = 15, xlab = "age", ylab = "time", 
     col = "red")
points(sub_status1$age, sub_status1$time, pch = 18, col = "blue")
legend(x="topleft",c("status = 0","status = 1"), col=c("red","blue"),pch=c(15,18))
#Q6
r_mean <- c(round(mean(survival_status0), 0), round(mean(survival_status1), 0))
r_median <- c(median(survival_status0), median(survival_status1))
r_status <- c(0, 1)
r_matrix <- cbind(r_status, r_mean, r_median)
write.table(r_matrix, 'result-lab1-q6.txt', sep = '          ', eol = '\n',
            col.names = TRUE, row.names = FALSE)
r_plot <- r_matrix[,2:3]
barplot(r_plot, beside = T, names.arg = c('mean', 'median'), 
        legend.text = c('status0', 'status1'), col = c('red', 'blue'), 
        args.legend = list(x='topright'))
