
productmv <- function(M, V, N, memsize,typemult,columna) {
  
  file <- "mapreduce.csv"
  file_result <- "result_mv.csv"
  if (file.exists(file_result)&typemult=='MV') file.remove(file_result)
  
  f <- function(x){
    Av3 <- read.csv(V, header = FALSE,skip=x[2]-1,nrows = 1)
    Av3 <-to.dfs(Av3)
    d <- values(from.dfs(Av3))
    return(x[3]*d[1,2])
  }
  
  map <- function(.,m) {
      i <- m[1]
      m <- as.matrix(m)
      valor <- apply(m,1,f)
      return (keyval(i,valor))
  }
  
  reduce <- function(i, xi) { 
    keyval(i, sum(xi))
  }
  
  ###############MAPREDUCE PROCESS
  
  skipear <- 0
  A3 <- read.csv(M, header = FALSE,nrows=1)  
  size_by_line3 <- object.size(A3)
  cant_elems <- memsize %/% size_by_line3 
  
  if (file.exists(file)) file.remove(file)
  
  while(N*N > skipear){
    A3 <- read.csv(M, header = FALSE,nrows=cant_elems,skip=skipear)
    i <- A3[1]
    A3 <-to.dfs(A3)
    calc <- mapreduce(input=A3, 
                    #output=output, 
                    #input.format="text", 
                    map=map, 
                    reduce=reduce,
                    verbose = FALSE)
    
    C = values( from.dfs( calc ) ) 
    skipear <- skipear+cant_elems
    if(skipear+cant_elems>N){cant_elems<-N-cant_elems} #esta linea no la entiendo, explicamela ahi D:
  
    write.table(keyval(i,C), file, append=T,sep=",", row.names=FALSE, col.names=FALSE) 
  }
  
  # Suma de  las multiplicaciones.
  for(i in 1:N) {
    
    skipear = i - 1
    valor <- read.csv(file, header = F, nrows = 1, skip = skipear)
    resultado <- valor# resultado para una entrada del vector
    skipear <- skipear + N
    
    while(N*N > skipear) {
      
      valor <- read.csv(file, header = F, nrows = 1, skip = skipear)
      resultado <- resultado + valor
      skipear <- skipear + N
      
    }
    
    print(resultado$V2[1]) # esto es un write en algun archivo donde se guarde el vector resultado
  
    if(typemult=='MV')
    {
      write.table(keyval(i,resultado$V2[1]), file_result, append=T,sep=",", row.names=FALSE, col.names=FALSE) 
    }
    else{
      x<-resultado$V2[1]
      var<-data.frame(i,columna,x)
      
      write.table(var, file_result, append=T,sep=",", row.names=FALSE, col.names=FALSE) 
    }
    
    
    
  }


}


