# Compendia

![Vercel](http://therealsujitk-vercel-badge.vercel.app/?app=compendia)

## Compendia Has Been Taken Offline. 😥
Unfortunately, the source of data was trash and even though the process of obtaining the comic releases was automatic, the data wasn't good enough to throw in the DB without a manual review. For a while, I had enough motivation to keep it up but life comes at ya fast and I found myself no longer having the time and energy to stay on top of it. I'm so glad I made this because I learned a ton and it was a necessary selling point to get me a job in web development. Compendia will live on forever in my heart. ❤️❤️‍🔥💥📚📖


## About

Compendia is a full-stack open-source comic book collecting web application where you can explore the world of new comic book releases, track your pull list, and organize your collection. If you're a comic reader, check it out [here](https://mycompendia.com)!

## Technologies Used

-   NextJS
-   React
-   Node.js
-   Tailwind CSS
-   React-Query
-   Magic Link Auth
-   PostgreSQL, Pg, Pg-Bouncer
-   Cover images hosted on AWS S3
-   Database hosted on DigitalOcean
-   App hosted on Vercel

## Problem

Film fans have IMDb, book fans have Goodreads, but what do comic fans have? As a comic book reader and collector myself, I wanted an app that I could use as a digital companion to my collection as well as a tool to find new comics to read. There are a few websites / apps out there that try to address this gap, but they all have a not-so-great user experience, do not place value on [creator-owned](https://en.wikipedia.org/wiki/Creator_ownership_in_comics) / independent comic stories and are not friendly to new comic book readers or people looking to get into comics for the first time.

## Action

First, I began doing an in-depth research of the comic industry and then began drafting requirements, feature sets, and designs. After consolidating the list of features and requirements down to a reasonable MVP, I started work building a web scraper that would retrieve and parse all of the new comic releases as they come out each week. Once I had a working method of retrieving data via the web scraper I wrote (which you can find [here](https://github.com/gchartier/compendia-scraper)), I began development of a Compendia Android app until finally pivoting to a web app using NextJS instead.

## Result

Now, Compendia is a fully-functioning MVP of the vision I had of a Comic Collector's companion. While it does have a great initial set of features, I plan on maintaining and improving it with even more functionality as time goes on. My ultimate vision for Compendia was for it to be a tool to make the comic industry and the wealth of incredible stories easily navigable, and a place comic creators can go to promote their works and connect with their fans.

## Potential Future Developments

-   Dark mode
-   Publishers filter on releases page
-   Improve search
-   Make it a PWA
-   Review and rating functionality
-   Comic terms glossary
-   Add new lists and edit existing lists
-   Reccommendation system
