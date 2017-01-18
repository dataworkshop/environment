#!/bin/bash
jupyter notebook --notebook-dir=/opt --ip=* --port=8888 --no-browser &> /dev/null &
jupyter lab --notebook-dir=/opt --ip=* --port=8889 --no-browser &> /dev/null &
python /opt/prerequisite/run.py &
/bin/bash
