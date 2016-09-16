# Data Workshop Environment


## What?
Basic environment for [Data Workshop](http://dataworkshop.com)

## Why?
Minimum effort & maximum impact:
* [Jupyter Notebook](http://jupyter.org/) and [Jupyter Lab](https://github.com/jupyter/jupyterlab)
* Anaconda with Python 2.7.x
* Additional packages [seaborn](https://stanford.edu/~mwaskom/software/seaborn/), [ggplot](http://ggplot.yhathq.com/), [hyperopt](https://github.com/hyperopt/hyperopt), [ml_metrics](https://github.com/benhamner/Metrics/tree/master/Python/ml_metrics), [xgboost](https://github.com/dmlc/xgboost)

## Prerequisites
[Docker](https://docs.docker.com/engine/installation/)

## Build (build only first)
```
docker run -dit -p 8888-8889:8888-8889 --name dataworkshop-environment dataworkshop/environment
```

## Re-use (already built container)
```
docker start dataworkshop-environment
```

*Note: that in docker terminology*
* `run`  means build (a new container)
* `start` means start (already exists) container

## Use
* Notebook - [localhost:8888](http://localhost:8888)
* Lab - [localhost:8889](http://localhost:8889)

*Note: if you're a happy `Docker Toolbox` user to find the ip address use `docker-machine ls`.*

#### Example
The URL column (`docker-machine ls`) contain  `tcp://192.168.99.100:2376`, so you should copy `192.168.99.100` and add notebook port `192.168.99.100:8888` or lab port `192.168.99.100:8889`. 


## Stop
```
docker stop dataworkshop-environment
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


### For geek :)
*Note: run it in Dockerfile directory*
```
docker build -t dataworkshop-environment .
```

### Running container without jupyter server

Jupyter servers are started by running start_script.sh in CMD section. However, you can easily override it, by specifying a command at the end of docker run... (in this case servers won't start)
