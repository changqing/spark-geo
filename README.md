This repo contains the jupyter notebook, files and dockerfile for the O'Reilly Oriole "Cluster and mine geo-located data with Scala, Spark, Cassandra" by Natalino Busa.

If you are unfamilar with docker, git or jupyter, please continue reading. If you are familar with docker, git and jupyter, you can clone this repo and get started immediately. The Launchbot commands at the beginning of the Dockerfile will not interefere with regular docker use.

## Launchbot

[Launchbot](launchbot.io) provides a desktop GUI for installing and running applications on top of docker + git. Launchbot currently only works on Mac OS.

### Make Sure Git Is Installed

To check whether you have git installed, type `git` at the command line in a terminal window. If you see output that describes common git commands, it is installed. If you don't, check out these [instructions.](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git)

### Install Docker for Mac

[Follow the instructions here](https://docs.docker.com/docker-for-mac/) to download and install Docker for Mac. If you already have docker installed, please make sure it's updated to the latest version.

### Install LaunchBot

1. Go to [launchbot.io](https://launchbot.io/) and follow the instructions for installing.
2. Start LaunchBot by double clicking the icon. LaunchBot will start in your default browser (should be Chrome or Firefox).

### Cloning the project

1. Start docker. When active, a whale icon will appear in your menu bar. Click on it to check docker’s status.
2. Start launchBot
3. In launchBot, click the **Projects** tab. Under _Your Projects_, paste the HTTPS URL  https://content.oreilly.com/oriole/cluster_mine_geo_data_scala_spark_cassandra into the textbox _Clone a project from a git url_ and click the cloud with an arrow in it. The project will now appear under _Your Projects_ and a project directory will be made in `~/launchbot/<project name>`.
4. Double click the project
5. Click LAUNCH PROJECT
6. Wait for the docker image to download; this may take a while the first time (on the order of tens of minutes).
7. Click START TUTORIAL when the button appears after the image is downloaded.
8. A new browser tab will open. Click on `index.ipynb`

### Using the notebook
Once you have opened index.ipynb, [here are some basic commands](http://nbviewer.jupyter.org/github/jupyter/notebook/blob/master/docs/source/examples/Notebook/Notebook%20Basics.ipynb) to navigate the notebook.
