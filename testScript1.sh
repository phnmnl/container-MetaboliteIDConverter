#!/bin/bash

# Get any dependencies needed for the testing part
apt-get update && apt-get install -y --no-install-recommends wget

# Check that the JUnit test classes pass on the built container

# Run test class and return exit status of JUnit
# This tests all methods implemented in the application

# JunitCmmd="java -jar /Javafiles/dist/phnmnl-enrichment/phnmnl-enrichment.jar -tests"
#
# if ! [ ]; then
#
# fi

# Make the output directory
mkdir /tmp/study-dir

# Download Test data 

# Run the actual app on the test data


# Check that the output file is created/correctness
if ! [ -e "/tmp/study-dir/index.html" ]; then
    echo "Output file doesn't exist"
    exit 1
fi