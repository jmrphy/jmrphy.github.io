---
author: justinmurphy
comments: false
date: 2012-12-29 19:12:32+00:00
layout: post
slug: analysis-of-gazaunderattack-tweets
title: 'Analysis of #GazaUnderAttack tweets'
wordpress\_id: 574
categories:
- social science
---

During the Israeli-Palestinian attacks of last month, I scraped from the Twitter API about 270,000 tweets containing the hashtag #gazaunderattack. Given the unprecedented degree to which this war was fought online, tweets of this sort could and should become really important data for political scientists. I'm too busy right now to say very much here, but I want to share some basic descriptive analyses for anyone who might be interested. The dataset can be downloaded [here][1] and the R script that produced these analyses is available at the very bottom.

Almost everything in this post I learned how to do directly and solely from the amazingly smart, open and generous #Rstats community. The scraping and time-series plot follow a script by [Michael Bommarito][2], and the rest follows scripts by [Ben Marwick][3].


## Analysis


There are 269,158 tweets. These tweets are authored by 79,923 unique users. Of all the tweets, .62 are retweets.

This first graph plots the frequency of #gazaunderattack tweets in 30-minute intervals between November 17th and November 21st. I \_believe\_\_ \_this is _all_ of the tweets containing that hashtag within this period. I know the Twitter Search API is subject to weird filters and restrictions, but I believe the technique I used here pages through each and every tweet available within the available time period.

[![timeseries][image-1]][4]

Most frequent #gazaunderattack tweeters.

[![tweet\_counts][image-2]][5]

The most retweeted tweeters. Interestingly, Anonymous seems to have had more reach, at least during this period, than the twitter account of Hamas (@AlqassamBrigade).

_[![retweet\_counts][image-3]][6]_The most retweeted tweeters as a ratio of total quantity of tweets sent.   Anonymous still seems to have had the most reach on the #gazaunderattack hashtag.

[![retweet\_ratios][image-4]][7]

Most frequently tweeted links.[![links][image-5]][8]

[This is the image][9] in the most popular link, capturing an explosion from an Israeli airstrike in Gaza.

Again, the Python code I used to obtain the tweets and the R code I used to analyze them were lifted directly from scripts by the authors linked above.

```
x<-read.csv("tweets_#gazaunderattack.csv", header=FALSE, stringsAsFactors=FALSE)
x$username<-x$V2
x$text<-x$V5

#####################################
#### Nice Time-Series Plot ##########
#####################################
library(ggplot2)
x$date<-strptime(x$V4, "%a, %d %b %Y %H:%M:%S %z", tz = "EST")
x$date<-as.POSIXct(x$date, tz = "EST")
timeseries<-ggplot(data=x, aes(x=date)) + geom\_bar(aes(fill=..count..), binwidth=60*30) + theme_bw() + ylab("# of Tweets") + xlab("Time")
timeseries
ggsave(file="timeseries.png")

```


[1]:	https://dl.dropbox.com/u/20498362/tweets_%23gazaunderattack.csv
[2]:	http://bommaritollc.com/2011/02/26/archiving-tweets-with-python/
[3]:	https://github.com/benmarwick/AAA2011-Tweets/blob/master/AAA2011.R
[4]:	http://justinmurphy.files.wordpress.com/2012/12/timeseries.png
[5]:	http://justinmurphy.files.wordpress.com/2012/12/tweet_counts.png
[6]:	http://justinmurphy.files.wordpress.com/2012/12/retweet_counts.png
[7]:	http://justinmurphy.files.wordpress.com/2012/12/retweet_ratios.png
[8]:	http://justinmurphy.files.wordpress.com/2012/12/links.png
[9]:	http://d3j5vwomefv46c.cloudfront.net/photos/large/688740234.jpg?key=964633&Expires=1356766099&Key-Pair-Id=APKAIYVGSUJFNRFZBBTA&Signature=05VhXXvHpkOc2wqjLXrGMgNasVet~TM9zp9UELk3vd0aCJcGb6uJI4Uv4FEk5LNEQQSGWrUrV9mNKpp5STIrUEwFufBGCwcboTeLJfg55DA75JoXHkMdmedD5P6M2~EOYUbtqSOBFGY7VQgzfN-~UhU6lLSwV3grA4~ZrZDTIlI_


[image-1]:	http://justinmurphy.files.wordpress.com/2012/12/timeseries.png
[image-2]:	http://justinmurphy.files.wordpress.com/2012/12/tweet_counts.png
[image-3]:	http://justinmurphy.files.wordpress.com/2012/12/retweet_counts.png
[image-4]:	http://justinmurphy.files.wordpress.com/2012/12/retweet_ratios.png
[image-5]:	http://justinmurphy.files.wordpress.com/2012/12/links.png