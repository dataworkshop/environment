FROM continuumio/anaconda

    # install jupyter & jupyter lab
RUN cd /opt/conda/bin && \
    conda install jupyter -y --quiet && \
    pip install jupyterlab && \  
    jupyter serverextension enable --py jupyterlab && \
    mkdir /opt/notebooks
    
RUN pip install seaborn && \
    pip install ggplot && \
    pip install git+https://github.com/hyperopt/hyperopt.git && \
    pip install ml_metrics && \

    ## build xgboost from git
    apt-get --assume-yes install build-essential && \
    cd /usr/local/src && \
    git clone --recursive https://github.com/dmlc/xgboost.git && cd xgboost && ./build.sh && cd python-package && python setup.py install

    # Create script to launch jupyter notebook and jupyter lab in the background
RUN echo '#!/bin/bash\n\
    jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser &> /dev/null &\n\
    jupyter lab --notebook-dir=/opt/notebooks --ip='*' --port=8889 --no-browser &> /dev/null &\n\
    bash' > /usr/local/bin/start_script.sh && \
    chmod +x /usr/local/bin/start_script.sh

ENTRYPOINT ["tini", "--"]

CMD ["/usr/local/bin/start_script.sh"]