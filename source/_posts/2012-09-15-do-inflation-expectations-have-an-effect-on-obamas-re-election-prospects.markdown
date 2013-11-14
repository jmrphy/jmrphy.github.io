---
author: justinmurphy
comments: false
date: 2012-09-15 21:30:35+00:00
layout: post
slug: do-inflation-expectations-have-an-effect-on-obamas-re-election-prospects
title: Do inflation expectations have an effect on Obama's re-election prospects?
wordpress\_id: 301
categories:
- social science
---

[Redonkulus Blog thinks so][1] based on some time-series data. But I was skeptical about this conclusions because I have just enough experience with time series to know that these sorts of inferences are really tricky. After checking out the data, I don't think there is a systematic relationship between inflation expectations and Obama's re-election prospects. For an overview of the measures, just visit the link above... I only want to share some analyses and review what's methodologically at stake here.

In short, the problem with time-series data is that it's often autocorrelated--for instance, an observation at time T-1 has a very strong effect on that variable at time T. When regressing a time series on another time series, it's easy to identify statistically significant relationships where no such thing exists if one variable is driving itself while another variable is just going along for the ride over time.

In regression analysis, the easiest way to check against spurious relationships is to analyze the residuals of the model. In particular, a plot of the model residuals against fitted values should be random with no identifiable pattern--if there are identifiable patterns than the model probably violated assumptions and is no good.

All of the Redonkulus regressions show residuals that suggest problematic models. I'll focus only on the inflation expectations model because that's what piqued some twitter interest heh.

Here are graphs of the model relating inflation expectations to Obama's Intrade scores. We see a pretty systematic pattern in the residuals by fitted values plot, suggesting violations of the OLS assumptions.

[![][image-1]][2]One simple way to deal with this is to transform the time series in a way that filters out the autoregression. One way to do that is to use first differences instead of simple levels. Intuitively, this is perhaps more attractive, anyway: If we think X causes Y, then really we should think that a change in X will be associated with a change in Y--not just that when one is high the other is high.

Differencing and then re-running the model gives pretty clean, white-noise-ish residuals. But the relationship is not statistically significant.

**                                       Estimate    Std. Error    t value    Pr(\>|t|)**
(Intercept)                    0.313765      0.164460         1.908      0.0593
D.inflex                         -0.986283   2.377463         -0.415      0.6791
obama$Time[-105]()     -0.005026   0.002742        -1.833      0.0698

[![][image-2]][4]And I basically find the same thing for the other models--residuals show violation of OLS assumptions; models using first differences are statistically insignificant but the residuals look pretty clean. I even tried lags on the independent variables, thinking maybe changes in inflation expectations might just take a day to show up in Obama's Intrade chances--but no, nothing. A scatterplot using levels and then a scatterplot using first differences sums this up.

[![][image-3]][5]

[![][image-4]][6]

In summary, I don't think this data offers evidence that monetary expansion would help Obama's chances of re-election. All of my R code follows, email me or Redonkulous if you want the data file.

[sourcecode language="r"]()

obama\<-read.table("obamasp.csv", sep=",", header=TRUE)
obama$inflex\<-ts(obama$inflex)
obama$Obamaclose\<-ts(obama$Obamaclose)
obama$Date\<-ts(obama$Date)
obama$SPAdjClose\<-ts(obama$SPAdjClose)
obama$Time\<-ts(obama$Time)
obama$Obamaclose
plot.ts(obama$Obamaclose)

D.Obamaclose\<-diff(obama$Obamaclose, differences=1)
D.SPAdjClose\<-diff(obama$SPAdjClose, differences=1)
D.inflex\<-diff(obama$inflex, differences=1)

library(car)

sp\<-lm(obama$Obamaclose  obama$SPAdjClose + obama$Time)
summary(sp)
residualPlots(sp)

D.sp\<-lm(D.Obamaclose  lag(D.SPAdjClose) + obama$Time-105)
summary(D.sp)
residualPlots(D.sp)

spLDV\<-lm(obama$Obamaclose  obama$SPAdjClose + obama$Time + lag(obama$Obamaclose))
summary(spLDV)
residualPlots(spLDV)

inf\<-lm(obama$Obamaclose  obama$inflex + obama$Time)
summary(inf)
residualPlots(inf)

D.inf\<-lm(D.Obamaclose  D.inflex + obama$Time-105)
summary(D.inf)
residualPlots(D.inf)

all\<-lm(obama$Obamaclose  obama$inflex + obama$SPAdjClose + obama$Time)
summary(all)
residualPlots(all)

D.all\<-lm(D.Obamaclose  D.inflex + D.SPAdjClose + obama$Time-105)
summary(D.all)
residualPlots(D.all)

scatterplot(obama$Obamaclose  obama$inflex)
scatterplot(D.Obamaclose  D.inflex)

[/sourcecode]()
[1]:	http://redonkulusblog.blogspot.com/2012/06/could-fed-save-obama.html
[2]:	http://justinmurphy.files.wordpress.com/2012/09/inflationresiduals.png
[4]:	http://justinmurphy.files.wordpress.com/2012/09/diffinflationresiduals1.png
[5]:	http://justinmurphy.files.wordpress.com/2012/09/inflscatter.png
[6]:	http://justinmurphy.files.wordpress.com/2012/09/infldiffscatter.png


[image-1]:	http://justinmurphy.files.wordpress.com/2012/09/inflationresiduals.png
[image-2]:	http://justinmurphy.files.wordpress.com/2012/09/diffinflationresiduals1.png
[image-3]:	http://justinmurphy.files.wordpress.com/2012/09/inflscatter.png
[image-4]:	http://justinmurphy.files.wordpress.com/2012/09/infldiffscatter.png