#!/bin/bash

mkdir img_ana

# Loop over folder numbers from 1 to 5
for i in {1..1}; do
    folder="replicate${i}"
    bash "${folder}/ana${i}.sh" &
done

# Wait for all background processes to finish
wait

