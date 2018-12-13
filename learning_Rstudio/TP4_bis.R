ecrin = read.table('http://pbil.univ-lyon1.fr/R/donnees/ecrin.txt', header = TRUE)
ecrin

#vérification 
dim(ecrin)

#Statistique élémentaire
moy = mean(ecrin$RIC)
max(ecrin$RIC)
min(ecrin$RIC)
vari = sd(ecrin$RIC)
#ou 
summary(ecrin$RIC)

#interprètation des graphiques
plot(ecrin$RIC)
plot(ecrin$SEM, ecrin$STA)


#Tracer un histogramme des données RIC
hist(ecrin$RIC, main = paste("Histogram RIC avec moyenne =",round(moy,2),"et ecart type = ",round(vari,2)))
#interpretation de l'histogramme:
#Une varible est dite quantitative si elle est représenté par un nombre (un age, une distance, une duré, une note)
#Une variable qui n'est pas quantitative est qualitative (nom, couleur, un diplôme)
#la 1ère Barre : En moyenne ont à observé 100 fois des espèces comprises entre [0,2]
#la 2ème Barre : En moyenne ont à observé 230 fois des espèces comprises entre [2,4.5]
#la 3ème Barre : En moyenne ont à observé plus de 250 fois des espèces comprises entre [4.5,6]


#recodage
ecrin$sem.f=factor(ecrin$SEM)
ecrin$sem.f

ecrin$heu.f=factor(ecrin$HEU,labels=c("matin","soir"))
ecrin$heu.f

#comptage

table(ecrin$heu.f)
n1 = sum(ecrin$heu.f == 'matin')
n1
summary(ecrin$sem.f)

tab = table(ecrin$sem.f, ecrin$heu.f)
tab   

df = data.frame(tab)
df



RICsem = rep(0,52,1)
for (i in 1:52){
  RICsem[i] = tab[i,1] + tab[i,2]
}
RICsem


#La moyenne des especes observée chaque semaine
aa = tapply(ecrin$RIC, ecrin$sem.f, mean)
aa

pt = plot(1:52,round(aa,2),col="red",pch="+",xlab="Semaine",ylab="Nombre moyen d'espèces observées")
title("Observations d'espèces ECRIN par semaine")

omat = tapply(ecrin$RIC,list(ecrin$sem.f,ecrin$heu.f),mean)
mode(omat)

#Plot supperpo deux graphes
plot(omat[,1],col="red",pch="+", type = 'l',xlab="Semaine",ylab="Moyenne Matin et soir")
lines(omat[,2],col="green",pch="+", type = 'l',xlab="Semaine",ylab="Soir")
legend(1,14.5, legend = c("Matin","Soir"), col = c("red","green"), lty = 1:3, cex = 1)
title("Affichage des deux graphs")


par (mfrow = c(2,3))
plot(omat[,1],col="red",pch="+", type = 'l',xlab="Semaine",ylab="Moyenne Matin et soir")
lines(omat[,2],col="green",pch="+", type = 'l',xlab="Semaine",ylab="Soir")
legend(1,14.5, legend = c("Matin","Soir"), col = c("red","green"), lty = 1:3, cex = 1)
title("Affichage des deux graphs")

plot(omat[,1],col="red",pch="+", type = 'b',xlab="Semaine",ylab="Moyenne Matin et soir")
lines(omat[,2],col="green",pch="+", type = 'l',xlab="Semaine",ylab="Soir")
legend(1,14.5, legend = c("Matin","Soir"), col = c("red","green"), lty = 1:3, cex = 1)
title("Affichage des deux graphs")

plot(omat[,1],col="red",pch="+", type = 'b',xlab="Semaine",ylab="Moyenne Matin et soir")
lines(omat[,2],col="green",pch="+", type = 's',xlab="Semaine",ylab="Soir")
legend(1,14.5, legend = c("Matin","Soir"), col = c("red","green"), lty = 1:3, cex = 1)
title("Affichage des deux graphs")

plot(omat[,1],col="red",pch="+", type = 'c',xlab="Semaine",ylab="Moyenne Matin et soir")
lines(omat[,2],col="green",pch="+", type = 'l',xlab="Semaine",ylab="Soir")
legend(1,14.5, legend = c("Matin","Soir"), col = c("red","green"), lty = 1:3, cex = 1)
title("Affichage des deux graphs")

plot(omat[,1],col="red",pch="+", type = 'b',xlab="Semaine",ylab="Moyenne Matin et soir")
lines(omat[,2],col="green",pch="+", type = 'n',xlab="Semaine",ylab="Soir")
legend(1,14.5, legend = c("Matin","Soir"), col = c("red","green"), lty = 1:3, cex = 1)
title("Affichage des deux graphs")


for (t in c('l','h','b','n','s','p')){
  plot(tab[,2], type=t, main=paste(type)
}

par (mfrow = c(1,1))
boxplot(ecrin$RIC~ecrin$sem.f)

#Représenter sur un même graphique les boîtes à moustaches du nombre d'espèces observées par semaine.

