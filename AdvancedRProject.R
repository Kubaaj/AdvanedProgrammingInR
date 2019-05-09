## Advanced programming in R - project ##

PortfolioOptimization <- function(SymbolVector, NoOfDays) {
  if(!'quantmod' %in% installed.packages()[,1]) install.packages('quantmod')
  require(quantmod)
  if(!'data.table' %in% installed.packages()[,1]) install.packages('data.table')
  require(data.table)
  
  VectorLength <- length(SymbolVector)
  AllSymbols <- data.table(getSymbols(SymbolVector[1],auto.assign = FALSE))
  for (i in 2:VectorLength) {
    tmp = data.table(getSymbols(SymbolVector[i],auto.assign = FALSE))
    AllSymbols <- cbind(AllSymbols, tmp)
  }
  AllSymbols <- tail(AllSymbols, NoOfDays)
  return(AllSymbols)
}

PO <- PortfolioOptimization(c("AAPL", "INTC", "NVDA"), 365)



################### TESTS #####################
SymbolVector<-c("AAPL", "INTC", "NVDA")
dt <- data.table(getSymbols(SymbolVector[1],auto.assign = FALSE))
dt2 <- data.table(getSymbols(SymbolVector[2],auto.assign = FALSE))
aapl<-getSymbols("AAPL", auto.assign = FALSE)
dt <- data.table(matrix(nrow = 3108, ncol = 6))
dtbind <- cbind(dt, dt2)
dtbind <- dtbind[, -c(1:6)]
print(length(dtbind))
