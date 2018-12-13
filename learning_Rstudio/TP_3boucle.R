ent <- c(1:15)
ent


paire<- function(x){ 
  for (i in x)  {
    if(i%%2==0) print(i)}
  }

paire(ent)


factoriel <- function(x){
  if (x<0) return('factiorielle pas possible')
  if(x==1) return(1)
  else return(x*factoriel(x-1))}


facto <- function(x){
  i=1
  re =x
  while (i<x){
    if (x<2) re = 1
    re = re*(x-i)
    i = i+1
  }
  if (x<0) return ('Pas possible')
  return(re)
}

factoriel(7)

facto(6)


nbr_tirage <- function(x) {
  cpt = 0
  repeat{
    nbr_myst = runif(1,min = 1, max = 100)
    cpt = cpt+1;
    if (x == nbr_myst) break
  }
  return (cpt)
}

nbr_tirage(5)



devinette(18)

moyenne <- function(x){
  for (i in 1:10) devinette(x)
}

x = c(1,2)
f<-append(x,3)
append(1:5, 0:1, after = 3)
x
f

devinette <- function(y){
  cpt = 0
  nbre_m = y
  nbre_g = round(runif(1,min = 1, max = 100))
  while(nbre_m != nbre_g){
    nbre_g = round(runif(1,min = 1, max = 100))
    cpt = cpt + 1
  }
  return(cpt)
}

devinette(28)

moyenne <- function(x){
  nbre <- c()
  for (i in 1:100000) nbre <- append(nbre,devinette(x))
  moyenne<- mean(nbre)
  return (moyenne)
}

moyenne(43)



fibo <- function(n, x){
  nb <- c()
  if (n < 2) return (n)
  i = 1
  while (i < (n+1)){
  nb <- append(nb,(fibo(n-2) + fibo(n-1)))
  i = i+1
  }
  return (nb) 
}





fiba <- function(n){
  nb <- c()
  if (n < 2) return (n)
  i = 1
  while (i < (n+1)){
    nb <- fibo(n-2) + fibo(n-1)
    i = i+1
  }
  return (nb) 
  
}

fibo(4)
