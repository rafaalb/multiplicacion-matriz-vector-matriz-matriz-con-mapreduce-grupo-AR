memlimit <- function(x){
  if(.Platform$OS.type=="unix"){
    return(x);
  }else{
    if(x==-1){ return(memory.limit());
    }else{ return(x);}
  }
}