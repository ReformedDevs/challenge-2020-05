#!/bin/bash

# put you run command here. putting it in a bash means we can use a script to
# run everybody's file in the docker container.
# example: python3 my_run_file.py

input_path=$1

python3 run.py $input_path
