## Comando para establecer el directorio de trabajo
setwd("C:/Users/terra/Documents/MATERIAS/MATERIAS/Sem 2-2015/PROY_BIG_DATA/Proyecto")

## Librería de MapReduce sobre Hadoop
library(rmr2) 
ignore <- rmr.options(backend="local") # Opciones "local" o "hadoop"

## Cargo la función de multiplicación de Matriz x Vector, Tipo 1
source("prod_Mv_type1.R")



## Prueba de la función

M <- matrix(1:9,ncol=3, byrow=TRUE)
M
v <- 1:3
v
w <- M %*% v
w
A <- read.csv("tblAkv3x3.csv",header=F)
A
A <- to.dfs(A)
from.dfs(A)
x <- read.csv("tblxkv3.csv",header=F)
x
x = to.dfs(x)
from.dfs(x)
y <- MultMV_1.mr(A,x)
y

M <- diag(10)
M
v <- 1:10
v
w <- M %*% v
w
A <- read.csv("tblAkv10x10ident.csv")
A
A <- to.dfs(A)
from.dfs(A)
x <- read.csv("tblxkv10.csv",header=F)
x
x = to.dfs(x)
from.dfs(x)
y <- MultMV_1.mr(A,x)
y



d <- 1:100
M <- matrix(1:100,ncol=10, byrow=TRUE)
M
v <- 1:10
v
w <- M %*% v
w
A <- read.csv("tblAkv10x10.csv",header=F)
A
A <- to.dfs(A)
from.dfs(A)
y <- MultMV_1.mr(A,x)
y



