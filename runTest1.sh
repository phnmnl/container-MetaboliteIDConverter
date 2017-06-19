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
wget https://github.com/bmerlet90/MetaboliteIDConverter/raw/develop/test-data/input.tsv 
wget https://github.com/bmerlet90/MetaboliteIDConverter/raw/develop/test-data/expectedOut.tsv 

# chmod 777 input.tsv

# echo "$(cat input.tsv)"

# Run the actual app on the test data
java -jar /phnmnl-enrichment.jar -inDB KEGG -headers -inFile ./input.tsv -outFile /tmp/study-dir/out.tsv

# Check that the output file is created/correctness
if ! [ -e "/tmp/study-dir/out.tsv" ]; then
    echo "Output file doesn't exist"
    $Code=$Code+1
fi



echo "Test suit finished"
exit $Code