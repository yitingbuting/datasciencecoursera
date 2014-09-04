complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
id <- id
nobs <- 0
b <- data.frame(id,nobs)

path1 <- paste("C:\\Users\\JHD\\datasciencecoursera\\R\\",directory,sep = "")
a <- 0
for (i in id) {
    a <- a+1
    path2 <- paste(sprintf("%03d",id[a]),".csv",sep = "")
    path <- paste(path1 ,"\\",path2 ,sep = "")
    data <- read.csv(path,header =T,row.names = 1)
    b[a,]<- nrow(data[complete.cases(data),])
}
return(b)
}