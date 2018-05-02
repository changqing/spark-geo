#!/bin/sh
#docker run -it -p 8888:8888 -m 8g -c 4 -v $(pwd)/notebooks/:/home/jovyan/notebooks natbusa/oriole-casspark-notebook:latest start-all.sh jupyter notebook
docker run -it -p 8888:8888 -m 8g -c 4 $(pwd)/notebooks/:/home/jovyan/notebooks ormlanders/anomaly-detection-spark-cassandra:latest start-all.sh jupyter notebook
