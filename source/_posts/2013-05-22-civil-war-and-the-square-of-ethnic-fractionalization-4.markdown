---
author: justinmurphy
comments: false
date: 2013-05-22 16:06:22+00:00
layout: post
slug: civil-war-and-the-square-of-ethnic-fractionalization-4
title: Civil war and the square of ethnic fractionalization
wordpress\_id: 633
categories:
- social science
---

Steve Saideman wonders if the relationship between ethnic fractionalization and civil war is curvilinear, where increasing fractionalization increases the probability of civil war up to a certain point but then increasing fractionalization decreases the probability of civil war. Since I have my nose in this data right now, I've given this conjecture a quick probe. I find no evidence _prima facie_.

Below is a replication of Sambanis 2004 where I simply add the square of ethnic fractionalization. If Steve's conjecture were true, we'd expect _ef1_ to be positive, _ef1sq_ to be negative, and both of them to be significant. They are signed as expected but not significant given the controls recommended by Sambanis. I then try alternative codings of civil war and a simple equation with no controls. If Steve's conjecture is true, it's not obvious.

Everything below is reproducible in R-just download the replication data, easy to find with a quick search, and set your working directory to where the data is.

### Get data and create the squared variable
\`\`\`
library(foreign)
sambanis \<- read.dta("SambanisJCR2004\_replicationdataset.dta")
sambanis$ef1sq \<- sambanis$ef1 \* sambanis$ef1
\`\`\`

### Replicate Sambanis 2004 (Table 6 in paper, column 8, pp.845)
\`\`\`
model \<- glm(warstnsb  gdpl1 + grol1 + inst3l1 + anoc2l1 + oil2l1 + ef1 + lpopnsl1 + mtnl1 + warnsl1, data = sambanis, family = binomial(link = "probit"))  

summary(model)
\`\`\`

	## Call:
	## glm(formula = warstnsb ~ gdpl1 + grol1 + inst3l1 + anoc2l1 + 
	##     oil2l1 + ef1 + lpopnsl1 + mtnl1 + warnsl1, family = binomial(link = "probit"), 
	##     data = sambanis)
	## 
	## Deviance Residuals: 
	##    Min      1Q  Median      3Q     Max  
	## -0.604  -0.231  -0.173  -0.106   3.560  
	## 
	## Coefficients:
	##             Estimate Std. Error z value Pr(>|z|)    
	## (Intercept) -3.90226    0.46234   -8.44  < 2e-16 ***
	## gdpl1       -0.09271    0.02295   -4.04  5.3e-05 ***
	## grol1       -0.51380    0.49750   -1.03  0.30172    
	## inst3l1      0.23713    0.09634    2.46  0.01384 *  
	## anoc2l1      0.23792    0.08807    2.70  0.00690 ** 
	## oil2l1       0.29680    0.11541    2.57  0.01012 *  
	## ef1          0.35605    0.16455    2.16  0.03049 *  
	## lpopnsl1     0.10503    0.02743    3.83  0.00013 ***
	## mtnl1        0.00199    0.00182    1.09  0.27466    
	## warnsl1     -0.06609    0.10492   -0.63  0.52873    
	## ---
	## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
	## 
	## (Dispersion parameter for binomial family taken to be 1)
	## 
	##     Null deviance: 1133.2  on 5892  degrees of freedom
	## Residual deviance: 1038.8  on 5883  degrees of freedom
	##   (3567 observations deleted due to missingness)
	## AIC: 1059
	## 
	## Number of Fisher Scoring iterations: 8

### Adding the square of ethnic fractionalization
\`\`\`
model \<- glm(warstnsb  gdpl1 + grol1 + inst3l1 + anoc2l1 + oil2l1 + ef1 + ef1sq + lpopnsl1 + mtnl1 + muslim + warnsl1, data = sambanis, family = binomial(link = "probit"))  
summary(model)
\`\`\`

	## Call:
	## glm(formula = warstnsb ~ gdpl1 + grol1 + inst3l1 + anoc2l1 + 
	##     oil2l1 + ef1 + ef1sq + lpopnsl1 + mtnl1 + muslim + warnsl1, 
	##     family = binomial(link = "probit"), data = sambanis)
	## 
	## Deviance Residuals: 
	##    Min      1Q  Median      3Q     Max  
	## -0.595  -0.230  -0.172  -0.103   3.547  
	## 
	## Coefficients:
	##             Estimate Std. Error z value Pr(>|z|)    
	## (Intercept) -3.94606    0.48647   -8.11    5e-16 ***
	## gdpl1       -0.09092    0.02370   -3.84  0.00012 ***
	## grol1       -0.50874    0.49343   -1.03  0.30253    
	## inst3l1      0.23723    0.09641    2.46  0.01386 *  
	## anoc2l1      0.24253    0.08838    2.74  0.00607 ** 
	## oil2l1       0.26000    0.12119    2.15  0.03192 *  
	## ef1          0.51893    0.72622    0.71  0.47488    
	## ef1sq       -0.17995    0.71442   -0.25  0.80113    
	## lpopnsl1     0.10452    0.02775    3.77  0.00017 ***
	## mtnl1        0.00184    0.00188    0.98  0.32529    
	## muslim       0.00104    0.00111    0.93  0.35169    
	## warnsl1     -0.06888    0.10501   -0.66  0.51185    
	## ---
	## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
	## 
	## (Dispersion parameter for binomial family taken to be 1)
	## 
	##     Null deviance: 1133.2  on 5892  degrees of freedom
	## Residual deviance: 1037.8  on 5881  degrees of freedom
	##   (3567 observations deleted due to missingness)
	## AIC: 1062
	## 
	## Number of Fisher Scoring iterations: 8

### Using Sambanis alternative coding of civil war
\`\`\`
model \<- glm(warstns  gdpl1 + grol1 + inst3l1 + anoc2l1 + oil2l1 + ef1 + ef1sq + lpopnsl1 + mtnl1 + muslim + warnsl1, data = sambanis, family = binomial(link = "probit"))  
summary(model)
\`\`\`

	## Call:
	## glm(formula = warstns ~ gdpl1 + grol1 + inst3l1 + anoc2l1 + oil2l1 + 
	##     ef1 + ef1sq + lpopnsl1 + mtnl1 + muslim + warnsl1, family = binomial(link = "probit"), 
	##     data = sambanis)
	## 
	## Deviance Residuals: 
	##    Min      1Q  Median      3Q     Max  
	## -0.532  -0.217  -0.165  -0.102   3.499  
	## 
	## Coefficients:
	##             Estimate Std. Error z value Pr(>|z|)    
	## (Intercept) -3.73245    0.52338   -7.13  9.9e-13 ***
	## gdpl1       -0.08649    0.02469   -3.50  0.00046 ***
	## grol1       -0.09783    0.48861   -0.20  0.84131    
	## inst3l1      0.23635    0.10911    2.17  0.03030 *  
	## anoc2l1      0.28191    0.09773    2.88  0.00392 ** 
	## oil2l1       0.16875    0.14066    1.20  0.23027    
	## ef1          0.65104    0.77115    0.84  0.39853    
	## ef1sq       -0.38362    0.77341   -0.50  0.61989    
	## lpopnsl1     0.08969    0.03039    2.95  0.00316 ** 
	## mtnl1        0.00209    0.00205    1.02  0.30854    
	## muslim       0.00118    0.00124    0.95  0.34246    
	## warnsl1     -0.21649    0.31589   -0.69  0.49313    
	## ---
	## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
	## 
	## (Dispersion parameter for binomial family taken to be 1)
	## 
	##     Null deviance: 915.34  on 5161  degrees of freedom
	## Residual deviance: 842.13  on 5150  degrees of freedom
	##   (4298 observations deleted due to missingness)
	## AIC: 866.1
	## 
	## Number of Fisher Scoring iterations: 8

### Using Fearon and Laitin 2003 coding of civil war
\`\`\`
model \<- glm(warst7b  gdpl1 + grol1 + inst3l1 + anoc2l1 + oil2l1 + ef1 + ef1sq + 
lpopnsl1 + mtnl1 + muslim + warnsl1, data = sambanis, family = binomial(link = "probit"))
summary(model)
\`\`\`

	## Call:
	## glm(formula = warst7b ~ gdpl1 + grol1 + inst3l1 + anoc2l1 + oil2l1 + 
	##     ef1 + ef1sq + lpopnsl1 + mtnl1 + muslim + warnsl1, family = binomial(link = "probit"), 
	##     data = sambanis)
	## 
	## Deviance Residuals: 
	##    Min      1Q  Median      3Q     Max  
	## -0.501  -0.200  -0.145  -0.086   3.590  
	## 
	## Coefficients:
	##             Estimate Std. Error z value Pr(>|z|)    
	## (Intercept) -4.28989    0.54194   -7.92  2.5e-15 ***
	## gdpl1       -0.08807    0.02665   -3.30  0.00095 ***
	## grol1       -0.27141    0.52732   -0.51  0.60677    
	## inst3l1      0.19536    0.10692    1.83  0.06768 .  
	## anoc2l1      0.25845    0.09748    2.65  0.00802 ** 
	## oil2l1       0.13327    0.14174    0.94  0.34707    
	## ef1          0.44027    0.80427    0.55  0.58409    
	## ef1sq       -0.22642    0.79784   -0.28  0.77657    
	## lpopnsl1     0.11930    0.03065    3.89  9.9e-05 ***
	## mtnl1        0.00255    0.00204    1.25  0.21124    
	## muslim       0.00155    0.00122    1.26  0.20659    
	## warnsl1      0.01688    0.11169    0.15  0.87987    
	## ---
	## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
	## 
	## (Dispersion parameter for binomial family taken to be 1)
	## 
	##     Null deviance: 897.81  on 5892  degrees of freedom
	## Residual deviance: 822.48  on 5881  degrees of freedom
	##   (3567 observations deleted due to missingness)
	## AIC: 846.5
	## 
	## Number of Fisher Scoring iterations: 9

### Only ethnic fractionalization
\`\`\`
model \<- glm(warstnsb  ef1 + ef1sq, data = sambanis, family = binomial(link = "probit"))

summary(model)
\`\`\`

	## Call:
	## glm(formula = warstnsb ~ ef1 + ef1sq, family = binomial(link = "probit"), 
	##     data = sambanis)
	## 
	## Deviance Residuals: 
	##    Min      1Q  Median      3Q     Max  
	## -0.303  -0.227  -0.196  -0.161   2.990  
	## 
	## Coefficients:
	##             Estimate Std. Error z value Pr(>|z|)    
	## (Intercept)   -2.302      0.131  -17.63   <2e-16 ***
	## ef1            0.323      0.589    0.55     0.58    
	## ef1sq          0.283      0.580    0.49     0.63    
	## ---
	## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
	## 
	## (Dispersion parameter for binomial family taken to be 1)
	## 
	##     Null deviance: 1249.6  on 6268  degrees of freedom
	## Residual deviance: 1230.5  on 6266  degrees of freedom
	##   (3191 observations deleted due to missingness)
	## AIC: 1237
	## 
	## Number of Fisher Scoring iterations: 7