#!/bin/bash
  
# Loop over folder numbers from 1 to 5
for i in {1..5}; do
    folder="replicate${i}"
    bash "${folder}/concat_${i}.sh" &
done

# Wait for all background processes to finish

