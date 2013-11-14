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

\` r 
\`
x\<-read.csv("tweets\_\#gazaunderattack.csv", header=FALSE, stringsAsFactors=FALSE)
x$username\<-x$V2
x$text\<-x$V5

###### \#\################################\#\#
#### Nice Time-Series Plot
###### \#\################################\#\#
library(ggplot2)
x$date \<- strptime(x$V4, "%a, %d %b %Y %H:%M:%S %z", tz = "EST")
x$date \<- as.POSIXct(x$date, tz = "EST")
timeseries\<-ggplot(data=x, aes(x=date)) + geom\_bar(aes(fill=..count..), binwidth=60\*30) + theme\_bw() + ylab("# of Tweets") + xlab("Time")
timeseries
ggsave(file="timeseries.png")

###### \#\################################\#\#
#### Nice Plot of Frequent Tweeters
###### \#\################################\#\#
library(ggplot2)
x$username[x$username==""]()\<-NA
length(unique(x$username)) # see how many unique tweeter accounts in the sample
counts=table(x$username)
counts.sort\<-sort(counts)
counts.sort.subset=subset(counts.sort, counts.sort\>350) # create a subset of those who tweeted at least 350 times or more
counts.sort.subset.df\<-data.frame(people=unlist(dimnames(counts.sort.subset)),count=unlist(counts.sort.subset)) # makes a funny sort of data frame...
counts.sort.subset.df\<-data.frame(people=as.factor(counts.sort.subset.df$people),counts=as.numeric(counts.sort.subset.df$count)) # makes a better data frame for ggplot to work with
ggplot(counts.sort.subset.df, aes(reorder(people,counts),counts)) + xlab("Author") + ylab("Number of messages")+ geom\_bar() + coord\_flip() + theme\_bw() + opts(axis.title.x = theme\_text(vjust = -0.5, size = 14)) + opts(axis.title.y=theme\_text(size = 14, angle=90)) # plot nicely ordered counts of tweets by person for people \> 5 tggsave(file = "tweet\_counts.pdf") # export the plot to a PDF file
ggsave(file = "tweet\_counts.png")

###### \#\##################################\#\#
#### Nice Plot of Frequent Re-Tweeters
###### \#\##################################\#\#
library(stringr)
x$text=sapply(x$text,function(row) iconv(row,to='UTF-8')) #remove odd characters
trim \<- function (x) sub('@','',x) # remove @ symbol from user names
x$rt=sapply(x$text,function(tweet) trim(str\_match(tweet,"^RT (@\[\[:alnum:]\_]()\*)")[2]())) #extract who has been RT’d
sum(!is.na(x$rt)) # see how many tweets are retweets
sum(!is.na(x$rt))/length(x$rt) # the ratio of retweets to tweets
countRT\<-table(x$rt)
countRT\<-sort(countRT)
countRT.subset=subset(countRT,countRT\>1000) # subset those RT’d more than 1000 times
countRT.subset.df\<-data.frame(people=as.factor(unlist(dimnames(countRT.subset))),RT\_count=as.numeric(unlist(countRT.subset)))
ggplot(countRT.subset.df, aes(reorder(people,RT\_count),RT\_count)) +
 xlab("Author") + ylab("Number of messages retweeted by others") +
 geom\_bar() + coord\_flip() + theme\_bw() +
 opts(axis.title.x = theme\_text(vjust = -0.5, size = 14)) +
 opts(axis.title.y=theme\_text(size = 14, angle=90))
# plot nicely ordered counts of tweets by person for people \> 1000 retweets
ggsave(file = "retweet\_counts.png")

###### \#\##################################\#\#
#### Nice Plot of RT-Tweet Ratios
###### \#\##################################\#\#
t\<-as.data.frame(table(x$username)) # make table with counts of tweets per person
rt\<-as.data.frame(table(x$rt)) # make table with counts of retweets per person
t.rt\<-merge(t,rt,by="Var1") # combine tweet count and retweet count per person
t.rt["ratio"]()\<-t.rt$Freq.y / t.rt$Freq.x # creates new col and adds ratio tweet/retweet
sort.t.rt\<-t.rt[order(t.rt$ratio),]() # sort it to put names in order by ratio
sort.t.rt.subset\<-subset(sort.t.rt,sort.t.rt$Freq.y\>1000) # exclude those with 1000 tweets or less
sort.t.rt.subset.drop\<-droplevels(sort.t.rt.subset) # drop unused levels that got in there somehow... note that this is already a data frame
ggplot(sort.t.rt.subset, aes(reorder(Var1,ratio),ratio)) +
 xlab("Author") + ylab("Retweets as a ratio of total tweets") +
 geom\_bar() + coord\_flip() + theme\_bw() +
 opts(axis.title.x = theme\_text(vjust = -0.5, size = 14)) +
 opts(axis.title.y=theme\_text(size = 14, angle=90))
ggsave(file = "retweet\_ratios.png")

###### \#\##################################\#\#
#### Nice Plot of Most Popular Links
###### \#\##################################\#\#
x$link=sapply(x$text,function(tweet) str\_extract(tweet,("http\[\[:print:]]()+"))) # creates new field and extracts the links contained in the tweet
x$link=sapply(x$text,function(tweet) str\_extract(tweet,"http\[\[:print:]](){16}")) # limits to just 16 characters after http so I just get the shortened link. They are all shortened, so this is fine, but there might be a better way using regex.
countlink\<-table(x$link) # get frequencies of each link
countlink\<-sort(countlink) # sort them
barplot(countlink) # plot freqs
# or to use ggplot2, read on...
countlink\<-data.frame(table(na.omit((x$link))))
countlink\<-subset(countlink,countlink$Freq\>300) # exclude those with 300 tweets or less
ggplot(countlink, aes(reorder(Var1, Freq), Freq)) +
 geom\_bar() + coord\_flip() + theme\_bw() +
 xlab("Link") + ylab("Frequency") +
 opts(axis.title.x = theme\_text(vjust = -0.5, size = 14)) +
 opts(axis.title.y=theme\_text(size = 14, angle=90))
ggsave(file = "links.png")

\`\`
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