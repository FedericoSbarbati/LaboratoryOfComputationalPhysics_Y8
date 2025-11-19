#!/bin/bash
cd $HOME
cd Desktop/Laboratory/LaboratoryOfComputationalPhysics_Y8/Ex\ 3\ bash/

echo "Starting execution in ($PWD)"

if [-e data.csv];
then
    cp data.csv/data.txt
    set -i "" "/#/d" data.txt
else
    echo "File not found, retry"