ecrin <- read.table('http://pbil.univ-lyon1.fr/R/donnees/ecrin.txt', header=TRUE)
ecrin

#Les donn�es concernnes 
dim(ecrin)

is.data.frame(ecrin)

length(ecrin$HEU)

plot(ecrin$RIC)

summary(ecrin)

m = round(mean(ecrin$RIC),2)
m

v = round(sd(ecrin$rRIC),2)
v

#question 6

par(nfrow=c(1,1))

plot(ecrin$SEM, ecrin$STA)

#question 7

hist(ecrin$RIC, main = paste("Nombre d'esp�ces, moyenne = ",m,"ecart type = ",v))



ecrin$HEU.f = 