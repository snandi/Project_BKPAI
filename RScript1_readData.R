rm(list=ls(all.names=TRUE))
rm(list=objects(all.names=TRUE))
#dev.off()

########################################################################
## This script reads in and explores the BKPAI dataset                ##
########################################################################

########################################################################
## Run Header files                                                   ##
########################################################################
#Filename.Header <- paste('~/RScripts/HeaderFile_Nandi.R', sep='')
Filename.Header <- paste('S:/RScripts/HeaderFile_Nandi.R', sep='')
source(Filename.Header)
#RScriptPath <- '~/Project_BKPAI/RScripts_BKPAI/'
RScriptPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/RScripts_BKPAI/'
source(paste(RScriptPath, 'fn_Library_BKPAI.R', sep=''))
ProjectPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/'

########################################################################
## Data Input                                                         ##
########################################################################
Filename.Data <- paste('~/Honey/BKPAI/BKPAI.csv')
# Data <- read.csv(file=Filename.Data, header=FALSE, nrows=250,
#                   quote="", 
#                   comment.char="",
#                   stringsAsFactors=F)
# colnames(Data) <- Data[1,]
# str(Data)
# Data <- Data[-1,]

# Filename.dta <- paste('~/Honey/BKPAI/BKPAI_Data_S_J.dta')
# Data <- read.dta(file = Filename.dta)
Filename.dta <- paste(ProjectPath, 'DATA_for_Analysis_12_23_2014.dta', sep='')
Data <- read.dta(file = Filename.dta)

Filename.rdata <- paste(ProjectPath, 'DATA_for_Analysis_12_23_2014.rdata', sep='')
save(Data, file = Filename.rdata)

