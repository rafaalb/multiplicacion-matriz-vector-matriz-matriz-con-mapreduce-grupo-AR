
productmm <- function(M1, M2, N, memsize) {
  
  # Creando de cada columna de M2 un vector en un archivo separado #
  
  column <- 0
  index <- 1
  file_result <- "result_mv.csv"
  
  A3 <- read.csv(M1, header = FALSE,nrows=1)
  Av3 <- read.csv(M2, header = FALSE,nrows = 1)
  size_by_lineV <-object.size(Av3)
  size_by_line3 <- object.size(A3)
  memtotal<-size_by_lineV+size_by_line3
  cant_elems <- memsize %/% size_by_line3 
  
  if(cant_elems>0&&memtotal<memsize){
  if (file.exists(file_result)) file.remove(file_result)
  while(N*N > column) {
   
    skipear <- column
    
    file <- paste("Vector-MM",toString(index),".csv")
    if (file.exists(file)) file.remove(file)
    
    #print(file)
    
    for(i in 1:N) { # Se crean los vectores en archivos separados
      element <- read.csv(M2, header = F, colClasses=c(NA, 'NULL', NA), skip = skipear + i - 1, nrows = 1)
      write.table(element, file ,sep = ",", append = T, row.names=FALSE, col.names=FALSE)
    }
    
    print(paste("Columna del vector resultado: ", toString(index)))
    productmv(M1, file, N, memsize,'MM',index) # Se hace la multiplicacion de M1 con cada uno de los vectores que se van creando
    
    column <- column + N
    index <- index + 1
    
    
     
  }
  

  
  
  }else{
    print("No hay memoria disponible para procesar dichas matrices")
  }
}