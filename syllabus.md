ESM 296-4F: Advanced Special Topics in GIS

## instructors

* Ben Best

* James Frew

* Lisa Wedding

## venue

Fall 2014 (03..31 October only) on Fridays at 08:30..11:30 in Bren Hall 3035 ("the GIS lab")

FYI, 15 enrolled as of 2014-09-12. 15 people now.

## course description

A series of intensive lab sessions focused on specific computational languages (e.g., Python, R, shell) and tools (e.g., GDAL/OGR, InVEST, MGET, ModelBuilder) applied to the spatial analysis of environmental problems. ESM 263 (or consent of instructor) is an absolute prerequisite.

## project

Frew sez: We need to discuss this. It’s a 2 unit course that only meets 5 times; the project(s) can’t be too onerous. If we want the students to propose their own, then we have to get them on this first thing, and have defaults waiting for students that can’t come up with something suitable.

BB: Yeah, tough to squeeze in. Would like to see them present these and share with class, but that would mean nixing a week of material. Perhaps offer as extra credit to students with specific issues they’re eager to tackle?

Could pick:

1. species distribution. Search GBIF for critter of interest. WorldClim.

2. ecosystem service. Pick a model from the INVeST manual, use example data. Ambitious ones could prep own data.

3. other interest… 1 page proposal due 2nd week for feasibility / relevance with identified data available. Specify resolution of data (temporal, spatial) and # of observations.

## materials

BB: Can we use **Github** to organize materials and turn in assignments? This is THE collaboratorive development environment. We could setup an organization `BrenGIS` and post materials in a sub repository `advgis`. Would like to make this public, if you all are comfortable doing so. Private repos are free for *.edu: 5 per account, 20 per org. So we could ask students to post assignments by creating their own private repository, creating an issue per assignment, inviting us to participate and closing it by referencing the homework markdown doc.

Frew sez: I like this idea, and a 296 is the perfect venue for debugging it. Let’s talk about the naming and master/sub structure. Having the students set up private repos for their assts is a great idea.

For Your Eyes Only: [https://dl.dropboxusercontent.com/u/1250538/263/_index.html](https://dl.dropboxusercontent.com/u/1250538/263/_index.html)

(this is a "secret" link to the ESM 263 (GIS) Spring 2014 web)

## schedule

Frew sez:

* Except for week 1, I’ve tried to lay this out such that the weeks are reasonably independent modules.

* I’ve tried to be parsimonious in what we propose to cover, to minimize time spent lecturing, and maximize hands-on time with the instructors present.

* week 1, 03 Oct: programming ArcGIS

    * lead by: Frew, Ben

    * goals

        * command line: always LCD (least common denominator); often best

        * version control: backup, collaborate, publish

        * Python: swiss army duct tape ("batteries included")

        * transitioning from Arc to ArcPy: snippets, saved models, Python window

        * looping example

            * sensitivity analysis (varying parameters) on wind analysis[https://dl.dropboxusercontent.com/u/1250538/263/assignment/3/HW3.html](https://dl.dropboxusercontent.com/u/1250538/263/assignment/3/HW3.html)

    * overview of course content

    * tools & techniques

        * command line

        * s/w carpentry [on git](https://github.com/NCEAS/training/blob/master/2014-oss/day-04/git.md) from nceas training

            * clone class site for demo materials

            * request edu discount for private repo to turn in assignments

        * Github

            * issues

            * markdown

        * ModelBuilder (refresher)

            * Frew sez: I suggest we not spend too long on this; rather use it as a motivator for ArcPy

            * BB: has mater

        * ArcPy

        * Data munging

            * R: dplyr, tidyr

            * Python: PANDAs

            * Others mentioned: Matlab, Julia

        * Advanced Model Builder

            * [ENV359_2009_Lec01_AdvModelBuilding.pdf](https://docs.google.com/a/nceas.ucsb.edu/file/d/0BzLReAQzT2SVVWRnU0VRZjRxMVk/edit)

            * see Python in [intro to marine GIS](http://www.nceas.ucsb.edu/~bbest/margis/MarineGIS_presentation.pdf): introduce by degrees, such as r-click on Geoprocessing Results to get Python snippet, Save Model Builder workflow as Python script, edit from there, set variables, add looping (for, while, etc).

            * introduce: iteration tools, variable substitution

            * segue with Save as… Python script

            * Python command line in ArcMap

                * previously used Field Calculator for running sum

            * show environment:`# show workspacearcpy.env.workspace`

        * Python programming with ArcGIS (Ben)

            * concepts: reproducible research, scientific workflows, programming (variables and data types, for loops; see [env_prog](https://docs.google.com/a/nceas.ucsb.edu/document/d/1m96M-O-IhvOVDuqsf9e197GsmU1t7NVEYhl0EJiJjoI/edit))

            * loop through features in feature class.

    * science motivator: (canned examples)

* week 2, 10 Oct: open-source GIS

    * lead by: Frew, Ben

    * tools & techniques

        * GDAL/OGR

        * QGIS (w/ GRASS)

            * [BB: GRASS is a beastly install w/ Cygwin, but OK if already on GIS lab machines]

            * Frew sez: QGIS is (should be) installed native on the lab machines, includes GRASS operators. (I’m not suggesting we use the GRASS UI.)

        * PostgreSQL / PostGIS, using Heroku.com free web service?

        * R ?

            * BB can easily spin up materials on using packages: rgdal (read/write raster/vector), raster (map algebra), rgeos (vector operations).

            * perhaps prep data for species distribution model a la this SDM tutorial from dismo R package: [http://cran.r-project.org/web/packages/dismo/vignettes/sdm.pdf](http://cran.r-project.org/web/packages/dismo/vignettes/sdm.pdf)  

    * science motivator: (canned examples ior student projects)

* week 3, 17 Oct: extending ArcGIS with MGET

    * lead by: Ben, Lisa

    * tools & techniques

        * background on R, Matlab, Python

        * MGET

        * ArcPy

    * science motivator: species distribution modeling

* week 4, 24 Oct: extending ArcGIS with InVEST

    * lead by: Lisa, Ben

    * tools & techniques

        * InVEST. Coastal vulnerability results just out. A few county data examples to share too.

        * ArcPy

        * R ?

    * science motivator: ecosystem service valuation

    * Larry Crowder (15-20 min talk) avail 10/24 on spp dist modeling OR ecosystem services

* week 5, 31 Oct: online GIS

    * lead by: Frew, Ben

    * tools & techniques

        * ArcGIS Online

        * MapServer? (http://trac.osgeo.org/osgeo4w/)

        * WorldMap

        * more ?

    * science motivator: (canned examples ior student projects)

