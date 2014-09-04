pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
total_sum <- 0
total_length <- 0
path1 <- paste("C:\\Users\\JHD\\datasciencecoursera\\R\\",directory,sep = "")
a <- 0
for (i in id) {
    a <- a+1
    path2 <- paste(sprintf("%03d",id[a]),".csv",sep = "")
    path <- paste(path1 ,"\\",path2 ,sep = "")
    data <- read.csv(path)
    datac <- subset(data[, pollutant],data[, pollutant]!="NA")
    total_length <- total_length + length(datac)
    total_sum <- total_sum + sum(datac)
}
return(total_sum/total_length)
}