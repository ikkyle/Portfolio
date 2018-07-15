---
output: 
  html_document:
    lib_dir: libs
    self_contained: no
    toc: yes
    toc_depth: 2
    toc_float:
      collapsed: no
      smooth_scroll: yes
---

# About Me

**Roz King**/Ian Kyle

Pronouns: they, them, theirs

### Background

I am a graduate of UC Davis with a B.S. degree in psychology and statistics. I've worked conducting data analysis and building data systems in fields as diverse as Healthcare, Agriculture, Education, and Genomics. In the past I've been a Data Scientist, a DBA, a DevOps Engineer, a Researcher, a Software Developer, and a Linux Systems Admin, but I find I operate best when I blur the lines  between all those roles. I'm deeply devoted to utilizing data for social good, and strive to work with like minded people.

I'm passionate about social and economic justice, open access to information, and using technological advancements in data collection, management, and analysis, to create measurable positive change. 

My <a href="www/src/resume.pdf" download>resume</a> offers more information on my educational and vocational history. My (rarely updated) [personal website](http://ikkyle.com) offers a look into some topics that were of interest to me years ago, but was mostly created as a tool to learn about managing remote servers and to have access to my development environments (Rstudio server, Jupyter) from any computer, and my embarrassingly candid blog [fauxktrends](http://fauxktrends.tumblr.com/archive) offers a view into a web scraping and analysis project I found engaging several years ago. I link to it not because it is terribly impressive or engaging, but to remind myself that the past informs the future, and forgetting about the past (purposefully or not), means we will be doomed to repeat it*. 

\*An issue that comes up often in building models, mathematical or otherwise, as it is so easy and can be so damaging to encode historical biases in our models. 

### Bragging Rights

I play drums in an instrumental jazz/rock/funk band called The Splodeyheads, one of my life goals is to get a private pilot license, and I'm always looking to grow my collection of strange taxidermy. 


# Past Work

Regrettably, many of the projects I've worked on that I am most proud of live behind closed doors, due to the sensitivity of the data I work with and employer policies. What follows are some projects I've worked on that I *can* show off. Many are hobbies entirely unrelated to my substantive interests, but a few gems offer some real value. 

## Agroft

I designed Agroft with support and funding from USAID and the UC Davis International Programs Office. Agroft is a graphical interface to R that is designed to help lower the R learning curve for agricultural researchers and make sound statistical analysis of field trial experimental designs accessible to anyone who needs it. 

The GUI offers the user a logical workflow that progresses through loading data, specifying experimental design, checking the assumptions of the model(s) required for that design, data transformations, running a model and posthoc tests, graphing the data, and exporting results into a useful report, with helpful tool tips and guidance on terms and statistical procedures along the way. The user doesn't need to know about the complexity of the models behind the scenes, but they are shown the code that is run along the way and encouraged to build on that code on their own. 

* [github repo](https://github.com/ucd-ipo/agroft)
* [live app](http://ikkyle.com/playground/aip-analysis/)

## Errorizer

Errorizer is a R package I wrote and submitted to CRAN to help me debug code that executes in large iterations and fails due to unhandled errors. It's only function, `errorize`, takes a function as one of it's arguments and returns that same function with expanded error handling abilities, including the ability to write debugging info and data structures to disk on error. It was particularly useful when processing the hundreds of thousands of web pages I scraped for my social media analysis--an unhandled error 2 hours into my script can be difficult to debug post hoc with just the stack trace, so "errorizing" my processing function allowed me to go back and interactively debug the error after my script had finished. 

* [errorizer github repo](https://github.com/ikkyle/errorizer)
* [errorizer on CRAN](https://cran.r-project.org/package=errorizer)

## Webscraping Analysis

I spent some time scraping a popular dating site (I'll call it "OKStupid") in an attempt to practice extracting info from diverse samples and increase my skills in interactive data visualization, text mining and web-scraping. Below are links to notebooks that show my scraping and munging process, as well as some of the more interesting analyses I've done. 

* [Web Scraping](www/OKC/scrape.html)
* [Data Munging](www/OKC/munge.html)
* Mapping Match Percent
* Predictive Power of Age/The Importance of R-squared


## Other Projects/Achivements:

* **Translated genetic network traversal algorithms** from R to Julia
* **Built high performance databases** serving analytics dashboards for California
 CORE Districts
* **Built neural-network classifiers to determine the contents of data submission files** based on byte distributions in first few rows. Ensured a faster and more accurate classification than prior business-rule based systems. 
* **Discovered issues with a large public school system's teacher attrition rate** by analyzing the data in a novel way. Led the district to investigate more and look for solutions. 
* **Wrote models to predict students that were likely to succede in AP classes** and in the process, found that some schools were placing students that had no hope of passing or who were expected to drop out into AP classes to boost enrollment. Positive student-focused policy changes were implemented. 
* **Modernized technical infrastructure of several past workplaces**, making version control, code packages , and infrastructure as code standard practice, and streamlining workflow by improving computational infrastructure, replacing versioned flat files with relational databases, and spreading awareness about best practices for tools like R, Python, Linux, git, SQL, and more. 
* **Built a dashboard for easier data access** allowing researchers to query data on their own with a point and click interface rather than having to request data from a data manager and wait for it to be constructed. 
* **Wrote an algorithm for creating matched samples** based on bagging and unsupervised learning that is more flexible and reduces bias in small datasets. This method was used in the landmark Autism early intervention paper: *Rogers, S. J., Vismara, L., Wagner, A. L., McCormick, C., Young, G., & Ozonoff, S. (2014). Autism Treatment in the First Year of Life: A Pilot Study of Infant Start, a Parent-Implemented Intervention for Symptomatic Infants. Journal of Autism and Developmental Disorders, 44(12), 2981–2995. http://doi.org/10.1007/s10803-014-2202-y*




