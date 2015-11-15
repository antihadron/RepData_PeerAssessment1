# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data

```r
data = read.csv('activity.csv')
summary(data)
```

```
##      steps                date          interval     
##  Min.   :  0.00   2012-10-01:  288   Min.   :   0.0  
##  1st Qu.:  0.00   2012-10-02:  288   1st Qu.: 588.8  
##  Median :  0.00   2012-10-03:  288   Median :1177.5  
##  Mean   : 37.38   2012-10-04:  288   Mean   :1177.5  
##  3rd Qu.: 12.00   2012-10-05:  288   3rd Qu.:1766.2  
##  Max.   :806.00   2012-10-06:  288   Max.   :2355.0  
##  NA's   :2304     (Other)   :15840
```

## What is mean total number of steps taken per day?

```r
stepsByDay <-  na.omit(aggregate(data$steps, by=list(data$date),FUN=sum,na.rm=TRUE))
hist(stepsByDay$x)
```

![](PA1_template_files/figure-html/mean_values-1.png) 

```r
mean(stepsByDay$x)
```

```
## [1] 9354.23
```

```r
median(stepsByDay$x)
```

```
## [1] 10395
```


## What is the average daily activity pattern?

```r
stepsByInterval <-  na.omit(aggregate(data$steps, by=list(data$interval),FUN=sum,na.rm=TRUE))
times<-strptime(formatC(stepsByInterval$Group.1,width=4,format="d", flag="0"),'%H%M')
plot(times,stepsByInterval$x, type='l')
```

![](PA1_template_files/figure-html/average_daily-1.png) 

```r
maxTime <- subset(stepsByInterval, stepsByInterval$x==max(stepsByInterval$x))
format(strptime(formatC(maxTime$Group.1,width=4,format="d", flag="0"),'%H%M'),'%H:%M')
```

```
## [1] "08:35"
```
## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
