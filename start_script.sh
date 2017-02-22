#!/bin/bash
jupyter notebook --notebook-dir=/opt/notebooks --ip=* --port=8888 --no-browser  --NotebookApp.token='dataworkshop' &> /dev/null &
jupyter lab --notebook-dir=/opt/notebooks --ip=* --port=8889 --no-browser  --NotebookApp.token='dataworkshop' &> /dev/null &
python /opt/prerequisite/run.py &
/bin/bash


