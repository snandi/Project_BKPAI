######################### Convert NAs to Zero ##########################
na.is.zero <- function(X)
{
  X1 <- X
  X1[is.na(X)] <- 0.0
  return(X1)
}
########################################################################

########################################################################
"%notin%" <- function(x, y){
  if(x %in% y){
    return(FALSE)
  } else{
    return(TRUE)
  }
}
########################################################################

########################################################################
"%w/o%" <- function(x, y){
  return(x[!x %in% y])
}
########################################################################

########################################################################
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
########################################################################

fn_printFactorTables <- function(Col, Data1, PlotPath=PlotPath){
  Colname <- gsub(pattern = "_", replacement = " ", x = colnames(Data1)[Col])
  Caption.1 <- paste('Frequency table between', Colname, 'and Living Arrangement')
  Caption.2 <- paste('Test of independence between', Colname, 'and Living Arrangement')
  
  Table.pct <- prop.table(table(Data1[,Col],Data1$live_arrange_max),1)
  print(xtable(Table.pct*100, caption=Caption.1), table.placement='H')
  Table.pct.r <- melt(Table.pct, id=rownames(Table.pct))
  #table(Data1$poor_health,Data1$live_arrange_max)
  Test <- chisq.test(table(Data1[,Col],Data1$live_arrange_max))
  print(xtable(as.data.frame(cbind(X_Sq=Test$statistic, 
                                   DF=Test$parameter, 
                                   pvalue=Test$p.value)),
               caption=Caption.2,
               digits=c(0, 2, 0, 4)), 
        table.placement='H', include.rownames=FALSE)  

  names(Table.pct.r)[2] <- 'Living'

  Plot <- qplot(x=Var.1, y=value, data=Table.pct.r, geom="bar", 
                fill=Living, stat='identity') + 
    xlab(label = Colname) + ylab('Percentage') + 
    ggtitle(paste(Colname, 'and Living Arrangement'))
  
  Filename.pdf <- paste(PlotPath, 'Plot_', Col, '.pdf', sep='')
  pdf(file=Filename.pdf, pointsize=6)
  trellis.par.set(fontsize=list(text=8,points=8))
  plot(Plot)
  Filename.jpg <- paste(PlotPath, 'Plot_', Col, '.jpg', sep='')
  jpeg(file=Filename.jpg)
  plot(Plot)
  dev.off()
}

