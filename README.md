# Data Workshop Environment


## What?
Basic environment for [Data Workshop](http://dataworkshop.eu)

## Why?
Minimum effort & maximum impact :squirrel:
* [Jupyter Notebook](http://jupyter.org/) and [Jupyter Lab](https://github.com/jupyter/jupyterlab)
* [Anaconda](https://docs.continuum.io/anaconda/) with **Python 3.6.0**
* Additional packages [seaborn](https://stanford.edu/~mwaskom/software/seaborn/), [ggplot](http://ggplot.yhathq.com/), [hyperopt](https://github.com/hyperopt/hyperopt), [hyperas](https://github.com/maxpumperla/hyperas), [ml_metrics](https://github.com/benhamner/Metrics/tree/master/Python/ml_metrics), [xgboost](https://github.com/dmlc/xgboost)

## Prerequisites
Only [Docker](https://docs.docker.com/engine/installation/) (installation Instruction for [Mac](https://docs.docker.com/docker-for-mac/install/) and [Windows](https://docs.docker.com/docker-for-windows/install/)) :bowtie:


## Build
```
docker run --net=host --dns 127.0.0.1 --dns 8.8.8.8 --dns 8.8.4.4 -dit -p 8888-8889:8888-8889 --name dataworkshop-environment dataworkshop/environment
```

## Use
* Notebook - [localhost:8888](http://localhost:8888)
* Lab - [localhost:8889](http://localhost:8889)

*Note: if you're a happy `Docker Toolbox` user to find the ip address use `docker-machine ls`.*

#### Example
The URL column (`docker-machine ls`) contains  `tcp://192.168.99.100:2376`, so you should copy `192.168.99.100` and add notebook port 192.168.99.100**:8888** or lab port 192.168.99.100**:8889**. 

## Re-use (already built container)
```
docker start dataworkshop-environment
```

*Note: that in docker terminology*
* `run`  means build (a new container)
* `start` means start (already exists) container

## Stop
```
docker stop dataworkshop-environment
```

## Update (image)
To get the last changes from [dockerhub](https://hub.docker.com/r/dataworkshop/environment/)
```
docker pull dataworkshop/environment
```

## Remove container/image
container
```
docker rm dataworkshop-environment
```
or image
```
docker rmi dataworkshop/environment
```

## Runtime metrics
```
docker stats dataworkshop-environment
```

## Show Running Processes
```
docker top dataworkshop-environment
```

### For geek :neckbeard:
*Note: run it in Dockerfile directory*
```
docker build -t dataworkshop-environment .
```

### Running container without jupyter server

Jupyter servers are started by running start_script.sh in CMD section. However, you can easily override it, by specifying a command at the end of docker run... (in this case servers won't start)
