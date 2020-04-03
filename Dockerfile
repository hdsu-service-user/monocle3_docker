FROM rocker/tidyverse
#FROM hdsu/bratwurst_example

LABEL maintainer="Andres Quintero a.quintero@dkfz-heidelberg.de"



RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libgdal-dev


RUN R -e  "BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats', 'limma', 'S4Vectors', 'SingleCellExperiment', 'SummarizedExperiment', 'batchelor'))"
#RUN R -e "BiocManager::install(c('DelayedMatrixStats', 'limma', 'SingleCellExperiment', 'batchelor'))"

#Now, install monocle3 through the cole-trapnell-lab GitHub, execute:
RUN R -e "devtools::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "devtools::install_github('cole-trapnell-lab/monocle3')"