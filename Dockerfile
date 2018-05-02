FROM natbusa/casspark-notebook:oreilly_oriole

# launchbot-specific labels
LABEL name.launchbot.io="Cluster and Mine Geo-Located Data"
LABEL workdir.launchbot.io="/home/jovyan/notebooks"
LABEL description.launchbot.io="Cluster and Mine Geo-Located Data"
LABEL 8888.port.launchbot.io="Start Tutorial"

USER root

#download spark packages
ADD http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/0.1.0-spark1.6/graphframes-0.1.0-spark1.6.jar /home/$NB_USER/spark-packages/
ADD https://github.com/natalinobusa/nak/raw/master/nak_2.10-1.3.jar /home/$NB_USER/spark-packages/

RUN chown $NB_USER:users /home/$NB_USER/spark-packages/*

# preload demo data
RUN mkdir /var/lib/cassandra/data
ADD cassandra.datadir.tar.gz /var/lib/cassandra/
RUN chown -R cassandra:cassandra /var/lib/cassandra/data

# notebook!
ADD *.ipynb /home/$NB_USER/notebooks/
RUN chown $NB_USER:users /home/$NB_USER/*

# Switch back to jovyan
USER $NB_USER

# update SPARK_OPTS and reinstall toree
ENV SPARK_JARS ${SPARK_JARS},local:///home/$NB_USER/spark-packages/graphframes-0.1.0-spark1.6.jar,local:///home/$NB_USER/spark-packages/nak_2.10-1.3.jar
ENV SPARK_OPTS ${SPARK_OPTS_BASE} --jars ${SPARK_JARS}

# Apache Toree install the kernel
# (must be done again if you add packages or change SPARK_OPTS)
RUN jupyter toree install --user --spark_home=${SPARK_HOME} --spark_opts="'${SPARK_OPTS}'"

USER root

COPY start-all.sh /usr/local/bin/
# it must run as root or cassandra will not start!
# don't modify the entry point or cassandra will not start

# now you can use any jupyter command such as 'jupyter notebook etc etc etc'
# start_all.sh will start cassandra as "cassandra" user and then will run start.sh

CMD ["start-all.sh", "jupyter", "notebook", "--no-browser", "--port 8888", "--ip=*", "--NotebookApp.token=''", "--NotebookApp.disable_check_xsrf=True"]



