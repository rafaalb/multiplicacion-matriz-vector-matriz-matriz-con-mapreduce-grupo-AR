## Comando para establecer el directorio de trabajo
setwd("/home/hduser/Downloads/Proyecto")
setwd("C:/Users/terra/Documents/MATERIAS/MATERIAS/Sem 2-2015/PROY_BIG_DATA/Proyecto")

## Librer√?a de MapReduce sobre Hadoop
library(rmr2) 
ignore <- rmr.options(backend="local") # Opciones "local" o "hadoop"

source("productmv.R") # matriz x vector
source("productmm.R") # matriz x matriz


productmv("tblAkv10x10.csv", "tblxkv10.csv", 10, 1800,'MV')
productmm("tblAkv10x10.csv", "tblAkv10x10ident.csv", 10, 1900)
