#Week2 Quiz Part1
pollutantment <- function(directory,pollutant,id = 1:332) {
        
        path <- file.path(directory) # Path to the directory "SPECDATA"
        num_files<-list.files(path)  # List of files in the "SPECDATA" 
#Create 1 big martix with data
        rdata_m0<-0
              for(i in 1:length(id)){
                        #Read 1 file from specdata       
                onefile<-id[i]
                onefile_path <- file.path(path,num_files[onefile])
                rdata1 <- read.csv(onefile_path, header = TRUE)
                rdata1_m<-data.matrix(rdata1)
                #Summ of files
                rdata_m0 <-rbind(rdata_m0,rdata1_m) 
             }                

        rdata_m<-rdata_m0[-c(1), ]
                                #Evaluate MEANS
        m<- colMeans(rdata_m, na.rm = TRUE)
        sh<- m[pollutant]
        names(sh)<-NULL
        sh
}
