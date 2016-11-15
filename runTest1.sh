#!/bin/bash

# initialize exit code to 0
Code=0

# Get any dependencies needed for the testing part
# apt-get update && apt-get install -y --no-install-recommends wget

# Check that the JUnit test classes pass on the built container

# Run test class and return exit status of JUnit
# This tests all methods implemented in the application

# JunitCmmd="java -jar /Javafiles/dist/phnmnl-enrichment/phnmnl-enrichment.jar -tests"
#
# if ! [ ]; then
#
# fi

# Create the study directory
mkdir /tmp/study-dir 

# Download Test data 
wget http://vm-metexplore-dev.toulouse.inra.fr:3000/bmerlet/parsebionet-Enrichment/src/master/test-data/input.tsv

chmod 777 input.tsv

echo "$(cat input.tsv)"

# Run the actual app on the test data
cmd="java -jar /Javafiles/dist/phnmnl-enrichment/phnmnl-enrichment.jar -inDB \"KEGG\" -headers -inFile ./input.tsv -outFile /tmp/study-dir/out.tsv"

echo $cmd

eval $cmd

# Check that the output file is created/correctness
if ! [ -e "/tmp/study-dir/out.tsv" ]; then
    echo "Output file doesn't exist"
    $Code=$Code+1
fi


exit $Code