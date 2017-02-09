################################
# DockerFile to build  the PhenoMeNal.enricment app block
# Based on Ubuntu
###############################

# Set the base image of this container
FROM java:8

# File Author / Maintainer 
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )


ENV TOOL_VERSION v0.4


# Image Metadata
LABEL Description="PhenoMeNal Enrichment: open source software to cross reference metabolite data with well known database identifiers."

LABEL software.version="0.4.12"

LABEL version="0.4"

LABEL software="MetaboliteIDConverter"


# Update the repository sources list
RUN apt-get update && apt-get install -y --no-install-recommends ant && \
	apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*
	

################
# Install Tool
################

RUN git clone --depth 1 --single-branch --branch $TOOL_VERSION http://vm-metexplore-dev.toulouse.inra.fr:3000/bmerlet/parsebionet-Enrichment.git Javafiles
WORKDIR Javafiles
RUN git checkout $TOOL_VERSION && ant jar


################
# Test Scripts
################

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh


###############
# Define EntryPoint
################
ENTRYPOINT ["java", "-jar", "dist/phnmnl-enrichment/phnmnl-enrichment.jar"]
