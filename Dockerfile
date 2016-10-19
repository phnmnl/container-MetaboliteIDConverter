################################
# DockerFile to build  the Parsebionet.enricment app block
# Based on Ubuntu
###############################

# Set the base image of this container
FROM java:7

# File Author / Maintainer 
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )


ENV TOOL_VERSION v0.3


# Image Metadata
LABEL Description="ParseBioNet Enrichment: open source software to cross referencing metabolites data with well known database identifiers."
LABEL Version=$TOOL_VERSION


# Update the repository sources list
RUN apt-get update

# Install required package
RUN apt-get install -y --no-install-recommends ant && \
apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*
	


###############
# Install Tool
###############

WORKDIR /files/

RUN cd /files && git clone http://vm-metexplore-dev.toulouse.inra.fr:3000/bmerlet/parsebionet-Enrichment.git git_App

RUN cd /files/git_App && git checkout -b tag0.3 v0.3

RUN cd /files/git_App && ant jar

# CMD ["-jar","/files/git_App/dist/parsebionet-enrichment-$TOOL_VERSION-Snapshot/parsebionet-enrichment-$TOOL_VERSION-Snapshot.jar"]



ENTRYPOINT ["java", "-jar", "git_App/dist/parsebionet-enrichment/parsebionet-enrichment.jar"]
