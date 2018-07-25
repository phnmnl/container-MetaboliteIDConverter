![LOGO](Logo_Metexplore.png)
# MetaboliteIDConverter

Version:0.5.1

## Short description
Open source software to enrich metabolomic data sets with well known databases identifiers such as InChIKey or ChEBI identifiers

## Description
This module allows the conversion of Metabolite Identifiers to and from database identifiers. This open source software makes use of the Chemical Translation Service (CTS)[1] for conversion. Any of the following inputs can be used:
- InChIKey
- KEGG ID
- ChEBI
- Chemical Name

The output file will contain the following metabolite identifiers :
- InChiKey
- InChI
- ChEBI
- KEGG ID
- PubChem CID 
- HMDB ID
- ChemSpider
- CAS


## Functionality
- Post-processing

## Tool Authors
- MetExplore Group contact-metexplore@inra.fr

## Container Contributors
- [Benjamin Merlet](https://github.com/bmerlet90) (INRA Toulouse)

## Git Repository
- https://github.com/phnmnl/container-MetaboliteIDConverter.git

## Installation
For local installation of the container:
```
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/metaboliteidconverter
```

## Usage Instructions

For direct usage of the docker image:
```
docker run docker-registry.phenomenal-h2020.eu/phnmnl/metaboliteidconverter -inDB  <inputDB> -inFile <inputfile> -outFile <file_out> 
```

The ```<inputDB>``` parameter can be one of the following: ```InChIKey```, ```KEGG```, ```ChEBI```, ```Chemical Name```
If your tsv file has columns headers on the first line, add the parameter ```-headers```. This will allow the software to find the column where the identifiers to convert from are.

## Future Developments
- Enable users to choose the desired output databases from the list of databases available in the CTS WebService
- Link the metabolites to our Metabolic Network database (available on www.metexplore.fr). And in particular the Human Global Metabolism Reconstruction, Recon2 [2].

## References
[1] Wohlgemuth G, Haldiya PK, Willighagen E, Kind T, Fiehn O. The Chemical Translation Service—a web-based tool to improve standardization of metabolomic reports. Bioinformatics. 2010;26(20):2647-2648. doi:10.1093/bioinformatics/btq476.
[2] Thiele I, Swainston N, Fleming RMT, et al. A community-driven global reconstruction of human metabolism. Nature biotechnology. 2013;31(5):10.1038/nbt.2488. doi:10.1038/nbt.2488. 
