getMean <- function(tst) {
  tst2=tst[3]
  if (!is.nan(as.numeric(tst2))) 
    tst[1] <- (stepsByInterval$x[as.numeric(tst2)==stepsByInterval$Group.1]);
}