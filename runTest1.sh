#!/bin/bash

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

chmod +r input.tsv

# Run the actual app on the test data
java -jar /Javafiles/dist/phnmnl-enrichment/phnmnl-enrichment.jar -inDB "KEGG" -inFile input.tsv -outFile "/tmp/study-dir/out.tsv" -headers

# Check that the output file is created/correctness
if ! [ -e "/tmp/study-dir/out.tsv" ]; then
    echo "Output file doesn't exist"
    exit 1
fi


echo "Output file created successfully"