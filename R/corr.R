corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vec
        ## tor of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

numeric <- c(0)
i <- 0
c <- 0
path1 <- paste("C:\\Users\\JHD\\datasciencecoursera\\R\\",directory,sep = "")
for (filename in dir(directory)) {
    i <- i+1
    path <- paste(path1 ,"\\",filename,sep = "")
    data <- read.csv(path,header =T,row.names = 1)
    sum <- complete("specdata", i)
    if( sum[,1] > threshold ){ 
       numeric[c+1] <- c(cor(data ,use = "complete.obs")[1,2])
       c<- c+1
    }
}
if(c == 0){
return(numeric[0])
} else {
return(numeric)
}
}
