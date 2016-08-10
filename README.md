# environment
Environment for Data Workshop

## What it Gives You
* Jupyter Notebook and Jupyter Lab
* Anaconda with Python 2.7.x
* Additional packages seaborn, ggplot, hyperopt, ml_metrics, xgboost

## Build command (in Dockerfile directory):
```
docker build -t enviornment:v0.1 .
```

## Basic Use

The following command starts a container with the Jupyter Notebook server listening for HTTP connections on port 8888 and Jupyter Lab server listening on port 8889. Windows volume is mounted to /opt/notebooks directory:

```
docker run -dt -p 8888-8889:8888-8889 -v //c/Users/windows_folder/:/opt/notebooks --name jupyter enviornment:v0.1
```

## Accessing jupyter servers

Servers are available in your browser under localhost:8888 (Notebook) and localhost:8889 (Lab).

Depending on docker app you're using, localhost:8888 is docker-machine ip:8888 (when usin Docker Toolbox), or localhost:8888 (when using Docker for Windows).  

## Running container without jupyter server

Jupyter servers are started by running start_script.sh in CMD section. However, you can easily override it, by specifying a command at the end of docker run... (in this case servers won't start)