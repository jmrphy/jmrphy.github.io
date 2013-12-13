---
author: justinmurphy
comments: false
date: 2012-10-27 21:58:43+00:00
layout: post
slug: predicting-turnout-from-google-search-data
title: Predicting turnout from Google search data
wordpress_id: 564
categories:
 - social science
---

Political scientists [Jesse Richman][1] and [Erik Voeten][2] wonder if Google Search data can help us predict turnout in next month's Presidential election. To summarize, Richman finds that searches for "vote" in the past two elections predict voter turnout, and that low search volume for "vote" this year suggests a low turnout election. In response, Voeten shows that controlling for who has come online since 2004 and 2008 explains much of why search volume for "vote" appears small this year. There are lots of reasons search data is pretty tricky for making good inferences, but that shouldn't keep us from trying!

My thinking is that we can look at the _composition_ of "vote" searches across elections to see whether this year's vote searches are indicative of greater voter turnout or greater voter demobilization/skepticism.

For instance, "vote" searches containing the terms "where" or "when" are probably more directly predictive of turning out to vote than the whole set of "vote" searches--as they indicate practical planning to turnout. On the other hand, "vote" searches containing the term "why" are probably far less predictive of turnout--and might even predict how many people are thinking "why bother?" and are considering staying home on election day.

So I went back to the data with this in mind. As baseline and as Voeten shows, if we consider voting searches ("vote" and "voting" together) as a proportion of searches for "university", "science", and "law", this election hardly looks very different. So that's just (vote+voting) / ((university+science+law) / 3). As explained in the posts linked above, search volume data is scaled from 0 to 100 where 100 is the peak of that search term in the given time period, relative to all other search activity.

[![][image-1]][3]And when we look at voting searches also containing the word "why" (as a proportion of the university-science-law index), again we find almost no difference.

[![][image-2]][4]But when we look at voting searches also containing the words "where" and "when" (I take the average of vote+where and vote+when as a proportion of the university-science-law index), more people appear to be asking where and when to vote this year than in the past two Presidential elections. The p-value on the difference of means between 2008 and 2012 is .051.

[![][image-3]][5]Finally, I look at the difference between the why-vote searches and the where/when-vote searches. The gap might be taken as an aggregate measure of how much society is using the web to _think about_ the decision to turn out _without planning_ to turnout, so that positive values might capture demobilization within vote searches (why bother?) and negative values reflect relatively resolved mobilization. And what we find is that this whole election year shows greater "when/where" vote searches than "why" vote searches at the present moment in the timeline but also for the year as a whole. In both of the previous elections there were more "thinking" searches than "planning" searches, but this year there have been more planning searches. As in the previous analyses, these are as a proportion of the university-science-law index, and the difference of means for 2008 and 2012 is statistically significant at the 99.9% confidence level.

[![][image-4]][6]Arguably, this difference variable perhaps already controls for education or political information because each term reflects a lack of knowledge, so it shouldn't be inflated by less educated/informed people coming online since 2004 and 2008. But the same pattern is evident and statistically significant if we look at this gap as a proportion of all "politics" search volume or just the raw differences of volume. Obviously, these are back-of-the napkin analyses and these data are plagued by difficulties. But these analyses don't suggest a low-turnout election in 2012. If anything, it looks like the web is registering more vote planning than in previous years.

[Here is the data in .csv form][7]. Here is the [R script][8] to reproduce the analyses found here.
[1]:	http://themonkeycage.org/blog/2012/10/25/will-2012-be-a-low-turnout-election-some-evidence-from-google-search-activity/%23comments
[2]:	http://themonkeycage.org/blog/2012/10/25/google-searches-and-turnout-a-cautionary-tale/
[3]:	http://justinmurphy.files.wordpress.com/2012/10/votingsearches2.png
[4]:	http://justinmurphy.files.wordpress.com/2012/10/whyvotesearches.png
[5]:	http://justinmurphy.files.wordpress.com/2012/10/votingplansearches.png
[6]:	http://justinmurphy.files.wordpress.com/2012/10/thinkplangapusl.png
[7]:	https://dl.dropbox.com/u/20498362/GoogleTrendsVoting.csv
[8]:	https://dl.dropbox.com/u/20498362/GoogleTrendsTurnout.R

[image-1]:	http://justinmurphy.files.wordpress.com/2012/10/votingsearches2.png
[image-2]:	http://justinmurphy.files.wordpress.com/2012/10/whyvotesearches.png
[image-3]:	http://justinmurphy.files.wordpress.com/2012/10/votingplansearches.png
[image-4]:	http://justinmurphy.files.wordpress.com/2012/10/thinkplangapusl.png