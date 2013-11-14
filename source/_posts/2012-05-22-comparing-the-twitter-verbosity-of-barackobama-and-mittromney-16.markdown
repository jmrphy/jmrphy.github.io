---
author: justinmurphy
comments: false
date: 2012-05-22 09:45:18+00:00
layout: post
slug: comparing-the-twitter-verbosity-of-barackobama-and-mittromney-16
title: Comparing the twitter verbosity of @BarackObama and @MittRomney
wordpress\_id: 58
categories:
- social science
---

I've decided to start learning how to scrape/analyze data from the Twitter API. Starting with pretty simple stuff, I used the TwitteR package in R to scrape almost all of the tweets by both U.S.presidential nominees. It's only possible to download 3200 tweets at a time, but this accounts for most of Obama's tweets (4,016 at the time of writing this) and all of Romney's (953).

One question we can ask is whether either nominee tweets lengthier tweets than the other. We know that G.W. Bush cultivated a populist sort of anti-intellectual style of speaking, we think of McCain's "Straight Talk Express" bus tour, and of course Obama is often characterized as an academic elite.

[![Image][image-1]][1]

Interestingly, although the modal length of tweets for both candidates is around the maximum of 140, @MittRomney spikes a little bit around 50 characters. It's impossible to say from this little graphic whether this difference reveals something systematic, but maybe the spike of roughly 50-character tweets from @MittRomney reflects a more "straight talking" tweeter than @BarackObama?
[1]:	http://justinmurphy.files.wordpress.com/2012/05/rplot3.jpg

[image-1]:	http://justinmurphy.files.wordpress.com/2012/05/rplot3.jpg?w=470