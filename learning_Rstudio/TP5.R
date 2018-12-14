############################# TP5 ############################


#pOUR CHARGER LE FICHIER DANS R
install.packages('readxl')
library(readxl)
notes_2012 <- read_excel('C:/Users/Administrateur/Desktop/Doc_GIT/document_GIT/learning_Rstudio/notes_etudiants.xlsx', sheet = 1)
notes_2012

#POUR afficher les 6 première lignes
notes_2012[1:6,]


#Conserver uniquement la colonne note_stat du tableau de données notes_2012 dans un objet que l'on appellera tmp.
tmp <- notes_2012[,"note_stat"]


#Conserver uniquement les colonnes num_etudiant, note_stat et note_macro dans l'objet tmp.
tmp <- notes_2012[,c("num_etudiant","note_stat")]
tmp <- notes_2012[,c(1,3,4)]
tmp

tmp[1,2]

#Remplacer le contenu de tmp par les observations de notes_2012 pour lesquelles l'individu a obtenu une note de stat supérieure (strictement) à 10.
for (i in 0:24){
  if (tmp[i,2]>10){
    tmp[i] <- tmp[-i,]
    
  }
}
tmp

#Remplacer le contenu de tmp par les observations de notes_2012 pour lesquelles l'individu a obtenu une note de stat supérieure (strictement) à 10.
tmp <- tmp[tmp$note_stat > 10,]
tmp


#Remplacer le contenu de tmp par les observations de notes_2012 pour lesquelles l'individu a obtenu une note comprise dans l'intervalle (10, 15).
tmp <- tmp[tmp$note_macro > 10 & tmp$note_macro<15,]


#Regarder s'il y a des doublons dans le tableau de données notees_2012 ; le cas échéant, les retirer du table
unique.data.frame(tmp)


#Afficher le type des données de la colonne num_etudiant, puis afficher le type de toutes les colonnes de notes_2012. 
typeof(tmp$note_stat)
typeof(tmp$note_macro)
typeof(tmp$num_etudiant)
typeof(tmp)


#Ajouter au tableau notes_2012 les colonnes suivantes : 
#(a) note_stat_maj : la note de stat (note_stat) majorée d'un point, 
#(b) note_macro_maj : la note de macro (note_macro) majorée de trois points (le faire en deux étapes : d'abord deux points en plus, puis un point). 
df <- data.frame(notes_2012, note_stat_maj = c(notes_2012$note_stat + 1))
df 

df1 <- data.frame(df, note_macro_maj = c(notes_2012$note_macro + 2)) 
df1
