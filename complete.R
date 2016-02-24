
ro

d#Week2 Quiz Part1
complete <- function(directory,id = 1:332) {
        
        path <- file.path(directory) # Path to the directory "SPECDATA"
        num_files<-list.files(path)  # List of files in the "SPECDATA" 
        #Create zero data frame
        cdata_m0<-data.frame(0,0)
        colnames(cdata_m0) <- c("id","nobs")
        
             for(i in 1:length(id)){
                #Read 1 file from specdata       
                onefile <- id[i]
                onefile_path <- file.path(path,num_files[onefile])
                rdata1 <- read.csv(onefile_path, header = TRUE)
                cdata1<-na.omit(rdata1)
                cdata1_nobs<-nrow(cdata1)
                cdata_id<-id[i]
                cdata_all<-c(cdata_id,cdata1_nobs)
                cdata_all
                cdata_m0<- rbind(cdata_m0,cdata_all)
             }
        
                cdata_sh<-cdata_m0[-c(1),]
                row.names(cdata_sh)<-1:nrow(cdata_sh)
                cdata_sh
}
