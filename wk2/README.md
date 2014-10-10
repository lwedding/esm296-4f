## Agenda

8:30 - 8:50 Introductions

- Pass around sign up sheet: Name, Email, Github username, Auditing (Y/N)

- Introduce selves: Name, Program (MS/PhD/...), Auditing?, How do you hope to use GIS?

- Thanks for the feedback! Here are the [survey results](https://docs.google.com/a/nceas.ucsb.edu/forms/d/1jwZg3MR2BrkDtRZl5QSkRjaXijL0JyUvAGiwkRQvBHc/viewanalytics#start=publishanalytics). We're listening. Pace is generally OK, but need clearer instructions, bigger picture relevance and less material. 

- [Project proposals](../project)

8:50 - 9:10 [Reorganize](https://rawgit.com/ucsb-bren/esm296-4f/master/wk2/reorg.html) files

9:10 - 10:00 [Review](https://rawgit.com/ucsb-bren/esm296-4f/master/wk1/lab1.html#review), [Python](https://rawgit.com/ucsb-bren/esm296-4f/master/wk2/python.html) programming

10:00 - 11:00 [QGIS](QGIS.md)

11:00 - 11:30 [Extra](https://rawgit.com/ucsb-bren/esm296-4f/master/wk2/extra.html) (time permitting)
 
## FAQ

- Q: **Why Github?** A: can collaborate with edits, even through web browser. Use in current projects (eg ohi-science/issues). Could apply to your group project / internships / etc.

- Q: **Why use "in_memory"?** Just so don't clog disk. But doesn't behave well in ArcMap if have Add to Display in Model Builder. Not there when close and reopen (get red exclamation). Get similar effect if output of a model is input to another and it is marked as Intermediate in model.

- Q: **Why not just select available layers for inputs to tools?** A: Best if you browse to find inputs on disk, especially for multiple input tools like Calculate Statistics, since then ensure works regardless of in memory layers that happen to be loaded in your ArcMap document and allows exported scripts to work (because don't have access to in memory layers not explicitly already part of the script).

## Resources

- [Resources](resources.Rmd)

### Cheat sheets

- [git](cheatsheets/git_cheatsheet.pdf?raw=true)
- [Python](cheatsheets/python_cheat_sheet.pdf)
- [Rmarkdown](https://github.com/ucsb-bren/esm296-4f/blob/master/wk1/rmarkdown_cheatsheet.pdf?raw=true)
- [R](cheatsheets/r_cheatsheet.pdf)
- [R Spatial](http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html)
