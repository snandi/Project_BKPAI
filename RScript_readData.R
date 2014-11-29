rm(list=ls(all.names=TRUE))
rm(list=objects(all.names=TRUE))
#dev.off()

########################################################################
## This script reads in and explores the BKPAI dataset                ##
########################################################################

########################################################################
## Run Header files                                                   ##
########################################################################
Filename.Header <- paste('~/RScripts/HeaderFile_Nandi.R', sep='')
source(Filename.Header)


########################################################################
## Data 1                                                          ##
########################################################################
Filename.Data1 <- paste('~/Honey/BKPAI/BKPAI.csv')
Data <- read.csv(file=Filename.Data1, header=FALSE, nrows=1000,
                  quote="", 
                  comment.char="",
                  stringsAsFactors=F)
colnames(Data) <- Data[1,]
str(Data)
Data <- Data[-1,]
