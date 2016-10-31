FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
    apt-get install -y wget bzip2 ca-certificates \
	libglib2.0-0 libxext6 libsm6 libxrender1 git 
	
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
	/bin/bash ~/anaconda.sh -b -p /opt/conda && \
	rm ~/anaconda.sh

#   Add Tini - tini 'init' for containers
#RUN apt-get install -y curl grep sed dpkg && \
##   ENV TINI_VERSION v0.10.0 && \ 
#    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
#    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
#   dpkg -i tini.deb && \
#    rm tini.deb && \
#    apt-get clean
	
ENV PATH /opt/conda/bin:$PATH

RUN cd /opt/conda/bin && \
    conda install -c conda-forge jupyterlab=0.7.0 -y --quiet && \
	jupyter serverextension enable --py jupyterlab && \
    conda install -c conda-forge jupyter_contrib_nbextensions -y && \
	mkdir /opt/notebooks

RUN pip install seaborn && \
    pip install ggplot && \
    pip install git+https://github.com/hyperopt/hyperopt.git && \
    pip install ml_metrics && \
#    pip install gmplot && \
#    pip install folium && \
#	 pip install geoplotlib && \
#    apt-get -y install libgdal-dev && \
#    pip install vincent && \
#    conda install -c anaconda basemap -y --quiet && \
#    conda install -c conda-forge geopandas -y --quiet && \
	
    ## build xgboost from git
    cd /usr/local/src && \
    git clone --recursive https://github.com/dmlc/xgboost.git && cd xgboost && ./build.sh && cd python-package && python setup.py install

	## get script with prerequisites
RUN pip install clint && \
    git clone https://github.com/dataworkshop/prerequisite /opt/prerequisite
	
    # Create script to launch jupyter notebook and jupyter lab in the background
RUN echo '#!/bin/bash\n\
    jupyter notebook --notebook-dir=/opt --ip='*' --port=8888 --no-browser &> /dev/null &\n\
    jupyter lab --notebook-dir=/opt --ip='*' --port=8889 --no-browser &> /dev/null &\n\
    bash' > /usr/local/bin/start_script.sh && \
    chmod +x /usr/local/bin/start_script.sh

#ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["/usr/local/bin/start_script.sh"]