# Project Rubric

Your audience is the user, members of the general public who may want to use your data and/or code. To be useful, your code and documentation must be clear to naive users (people familiar with R, but not with this project). 

Elements:
1. Your github repo, organized following the project template.
2. Your modified code, quarto, and README files, organized in the repo.
2. Your output files (any requested output, i.e., `.csv`, `.html`, `.docx`, `.pdf` files) in their proper places in the repo.

|Criteria| Evaluation| Scoring | Comments |
|:---------|:-|:-|:-|
|Right| Code runs without Error - Must be YES | 0/10 | 10 |
|	  | Code produces correct output | 1-5 | 5 |
|Readable| Code is readable (good use of white space, etc.) |1-5| 5 |
|        | Code is understandable (good naming conventions, concise informative comments) || |
|Reproducible| READMEs document project organization | 1-5| 1 |
|        | READMEs list contents of each directory | | |
|        | READMEs explain the order to run the code/quarto in order to reproduce analysis| | |
|Aesthetics| Files are free of unnecessary clutter (assignment instructions, etc.) | 1-5 | 5 |
|        | Code is elegant (not required, but a bonus) |  | |

Talk 15/15
Project 3  26/30


Very nice job developing interesting and informative visualizations! You really did a wonderful job exploring and mastering many new packages. Way to go!

The code is clean and beautiful, well done!  I donʻt exactly see why you had a make a separate script for each plot type, however. They could have imply all been in one script, and had the bonus of reduced repetition in loading packages and in some cases input data. The idea behind modularization is to break up things that are conceptually independent to allow them to be reused.  Making them all separate with no clear benefit makes the project harder to maintain, although it is very clean. For example, if you decide to make an edit to the input dataframe, how much of a pain would it be to fix all the downstream scripts? How will you know you got them all? 

To follow on that point, you donʻt have a master script. With 9 subscripts, you should have one master script that calls each of the nine to make it easier to reproduce. 

You also donʻt have a qmd. You have a nice draft manuscript, which is fabulous! But you donʻt have a document that explains the code and your scripts have very few comments. This is a big issue, that you should work on in your future efforts. Be sure to include enough explanatory comments that you will understand your code a year from now or 5 years from now. I know you worked super hard on this, and feel like youʻll never forget, but after youʻve written a 100 scripts, these memories will be long gone :). Also they have to be understandable to naive users who know less than you. Just saying run all the scripts is not enough. 

There are a couple of ways you could have done this. Iʻll try to quickly put some in your repo. 

Marguerite



