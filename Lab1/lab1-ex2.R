attach(Orange)
tree1 = Orange[Tree == 1,]
tree4 = Orange[Tree == 4,]
tree1_4 = rbind(tree1$circumference, tree4$circumference)
plot(tree1$age,tree1$circumference,cex=1.2,pch=15,xlab="age",ylab="circumference", ylim = c(0,225),col="red")
points(tree4$age,tree4$circumference, pch=18, col="blue")
legend(x="topleft",c("tree1","tree4"),cex=1.2, col=c("red","blue"),pch=c(15,18))
barplot(tree1_4,beside = T, names.arg = tree1$age, xlab = "age", ylab = "circumference",
        legend.text = c('tree1','tree4'), col= c('red','blue'), args.legend = list(x='topleft'))
