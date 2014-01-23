---
layout: post
title: "System for managing student course submissions using free web services (proof of concept)"
date: 2014-01-23 21:26
comments: true
categories:
---

In order to bypass the criminally profligate corporate education contractors who charge universities extortionate prices for almost useless products such as Blackboard and Turnitin, I've devised a system for managing student course submissions and record keeping throughout the semester, using all free web services. Not as if these free web services live on moral high-ground, but at least they let us dodge these stationary bandits charging rents at the revolving door between universities and the corporate sector.

With this system, students can blog publicly as much as they'd like, all of their work is collected and organized automatically, and the instructor can grade submissions quickly, easily, *and* anonymously, all in one place (in the cloud). Here's how it works.

![](http://tardis1.tinygrab.com/grabs/3db0911c71468d4f7b8927bd141baeacf08bc2dde1.png)

All students have a personal blog using one of the major blogging platforms. The RSS feed associated with each blog is channeled into one master RSS feed using Feed.Informer.com. This master feed is then run through IFTTT to distribute every student blog post into two different formats in my private Google Drive. First, every single student blog post is logged into a Google Spreadsheet capturing everything about the post (the content, the url, the student's name, and the time of the post). This is the master spreadsheet. But the critical course submissions are also distributed into individual text files which do *not* include the student's name. This is achieved by simply having students tag their critical submissions with some specific tag, and telling IFTTT to create the anonymized text file only for posts with that tag.

**Proof of concept.** To show that this works, scales reasonably, and is consistent with anonymous grading, I set up a pilot "course" using about 15 popular political blogs as my "student" blogs. Then I let the system run for about 6 days. Below, I demonstrate how I set it up and how this system can reliably deliver more than 2,000 blog posts from various blogs for quick, easy, and secure grading.

First, use Feed.Informer.com to turn all of your students' blogs into one master RSS feed. This is basically just merging all of the blogs into one data stream.

![](http://tardis1.tinygrab.com/grabs/3db0911c7194daed018d11923956d4e50188172fe1.png)    

You give it many RSS feeds, and then it gives you one RSS feed merging them all.

![](http://tardis1.tinygrab.com/grabs/3db0911c71a70226a46f3f3b081f724dd3b619d319.png)

Next, use IFTTT to make two "recipes." The first one sends every new entry on a specified RSS feed (you give it your master feed) to a new row in some specified spreadsheet in your Google Drive. Then a second recipe sends *only* items in the RSS master feed matching some specified tag into their own anonymous Google docs in your Google Drive. You can put them in their own folder to keep things tidy. In this example, only blog posts tagged "politics" are filed into their own anonymous docs. In practice, you would just tell students to tag their critical assignments (mid-term or final-term essays, for instance) with any specified tag of your choosing, and enter that into IFTTT instead of "politics."

![](http://tardis1.tinygrab.com/grabs/3db0911c71ea24157ead5402a2ef83fffaa7b38c28.png)

Then, after six days, I have more than 2,000 student blog posts. And a few hundred "mid-term essays" ready for anonymous grading. After reading the anonymous documents, you can just find the associated title in the spreadsheet and enter a grade. Or just visit the anonymous link from the text document, to see who wrote it and then enter your grades wherever else you might be keeping them. Regardless, the entire written output of your entire class is all collected in one place. 

![](http://tardis1.tinygrab.com/grabs/3db0911c716062ab1087ff050c05017876eee8502c.png)

Here's a spreadsheet. It will automatically make an additional spreadsheet after any spreadsheet reaches 2000 rows.

![](http://tardis1.tinygrab.com/grabs/3db0911c716bc8d95d8e915f87cc70c05380b3d070.png)

Example of an anonymous Google doc.

![](http://tardis1.tinygrab.com/grabs/3db0911c713d93fd329f14cdd9ebdf136012686b47.png)
