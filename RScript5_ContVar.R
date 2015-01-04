rm(list=ls(all.names=TRUE))
rm(list=objects(all.names=TRUE))
#dev.off()

########################################################################
## This script reads in and explores the BKPAI dataset                ##
########################################################################

########################################################################
## Run Header files                                                   ##
########################################################################
Filename.Header <- paste('S:/RScripts/HeaderFile_Nandi.R', sep='')
source(Filename.Header)
RScriptPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/RScripts_BKPAI/'
source(paste(RScriptPath, 'fn_Library_BKPAI.R', sep=''))
ProjectPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/'
PlotPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/Plots/'
  
########################################################################
## Data Input                                                         ##
########################################################################
Filename.rdata <- paste(ProjectPath, 'DATA_for_Analysis_12_23_2014.rdata', sep='')
load(Filename.rdata)

########################################################################
## Basic understanding of the dataset                                 ##
########################################################################
Data <- as.data.frame(Data)
Data <- Data[, c('uid', colnames(Data) %w/o% 'uid')]

length(unique(Data$iuid))
length(unique(Data$vhhno))
length(unique(Data$uid))

Varlist <- c('live_arrange_max',
             'wealth_quintile',
             'state',
             'htype',
             'hhpers',
             'poor_health',
             'row_total_income',
             'contribute_max',
             'depend_child_mx',
             'dependence_other_mx',
             'own_asset',
             'transfer_child_mx',
             'asset_nominate_mx',
             'disability_mx',
             'disability_F_mx',
             'disability_M_mx',
             'avg_ADL',
             'ADL_mx',
             'IADL_mx',
             'avg_IADL',
             'either_disb',
             'work_adult',
             'education',
             'edu_avg_r',
             'adult_hh_mx',
             'total_edu',
             'avg_edu_adult',
             'total_work_adultR',
             'HH_head60',
             'HH_headM_max',
             'caste',
             'religion',
             'v302'
)

VarNames <- c('Living Arrangement',
              'Wealth Quintile',
              'State',
              'Household type',
              'hhpers',
              'Poor Health',
              'Total Income',
              'contribute_max',
              'At least one dependent on children',
              'Other elderly financialy dependent',
              'Owns Asset',
              'Asset Transferred to Child',
              'asset_nominate_mx',
              'At least one elderly with disability',
              'Female elderly with disability',
              'Male elderly with disability',
              'Avg ADL needs of elderly',
              'At least one elderly with ADL needs',
              'Max IADL needed by elderly',
              'Avg IADL needs of elderly',
              'either_disb',
              'HH with working elderly',
              'Highest education of elderly',
              'Avg education of elderly',
              'Total adults between 17 and 60',
              'Total education of all adults',
              'Avg education of all adults',
              'Total number of working adults',
              'HH headed by adults above 60',
              'HH headed by male above 60',
              'Caste',
              'Religion',
              'Total Annual Income'
)

lapply(X=Varlist, FUN=function(var){if(!(var %in% colnames(Data))) print(var)})
VarMap <- VarNames
names(VarMap) <- Varlist

####################################################################
## relationships ##
####################################################################
Data1 <- Data[,Varlist]
levels(Data1$live_arrange_max)[4] <- 'with children'

Data1 <- within(data=Data1,{
  state <- as.factor(state)
  dependence_other_mx <- as.factor(dependence_other_mx)
  own_asset <- as.factor(own_asset)
})
levels(Data1$state) <- c('Himachal', 'Punjab', 'Bengal', 'Odisha', 
                         'Maharashtra', 'Kerala', 'Tamil Nadu')

str(Data1)


## row_total_income
table(Data1$live_arrange_max)

GrpMeans_row_total_income <- as.data.frame(
rbind(summary(subset(Data1, live_arrange_max=='others')$row_total_income),
      summary(subset(Data1, live_arrange_max=='alone')$row_total_income),
      summary(subset(Data1, live_arrange_max=='spouse only')$row_total_income),
      summary(subset(Data1, live_arrange_max=='with children')$row_total_income)))
rownames(GrpMeans_row_total_income) <- levels(Data1$live_arrange_max)
xtable(GrpMeans_row_total_income, digits=c(0, 0, 0, 0, 3, 0, 0))
 

## wealth_quintile
#summary(Data1$wealth_quintile)
Col <- 2
Table <- prop.table(table(Data1[,Col],Data1$live_arrange_max),1)
Table.r <- melt(Table, id=rownames(Table))
names(Table.r)[2] <- 'Living'
Plot1 <- qplot(x=Var.1, y=value, data=Table.r, color=Living) + 
  geom_line(size=1.2) + 
  xlab(label = 'Wealth Quintile') + ylab('Percentage') + 
  ggtitle('Living arrangement and Wealth quintile')
#legend.title = element_text(label='Living', size=14)
# jpeg("Wealth_Quintile.jpg")
# Filename.jpg <- paste(PlotPath, 'Plot_wealth_quintile', '.jpg', sep='')
# jpeg(file=Filename.jpg)
# plot(Plot1)
# dev.off()

## edu_avg_r
Data1$edu_avg_r[Data1$edu_avg_r >= 90] <- NA
summary(Data1$edu_avg_r)

GrpMeans_edu_avg_r <- as.data.frame(
rbind(summary(subset(Data1, live_arrange_max=='others')$edu_avg_r),
      summary(subset(Data1, live_arrange_max=='alone')$edu_avg_r),
      summary(subset(Data1, live_arrange_max=='spouse only')$edu_avg_r),
      summary(subset(Data1, live_arrange_max=='with children')$edu_avg_r)))
rownames(GrpMeans_edu_avg_r) <- levels(Data1$live_arrange_max)
xtable(GrpMeans_edu_avg_r, digits=c(0, 0, 0, 0, 3, 0, 0, 0))

## total_work_adultR
summary(Data1$total_work_adultR)

GrpMeans_total_work_adultR <- as.data.frame(
  rbind(summary(subset(Data1, live_arrange_max=='others')$total_work_adultR),
        summary(subset(Data1, live_arrange_max=='alone')$total_work_adultR),
        summary(subset(Data1, live_arrange_max=='spouse only')$total_work_adultR),
        summary(subset(Data1, live_arrange_max=='with children')$total_work_adultR)))
rownames(GrpMeans_total_work_adultR) <- levels(Data1$live_arrange_max)
xtable(GrpMeans_total_work_adultR, digits=c(0, 0, 0, 0, 3, 0, 0))
