#!/bin/bash
cd $HOME
cd Desktop/Laboratory/LaboratoryOfComputationalPhysics_Y8/Ex\ 3\ bash/

echo "Starting execution in ($pwd)"

if [-e data.csv];
then
    echo "File found, copying..."
    cp data.csv/data.txt
    echo "File copied succesfully"
else
    echo "File not found, retry"