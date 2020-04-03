FROM hdsu/bratwurst_example

LABEL maintainer="Andres Quintero a.quintero@dkfz-heidelberg.de"



RUN apt-get update && apt-get install -y \
    libudunits2-dev


RUN R -e "devtools::install_github('hdsu-bioquant/bratwurst', ref='dev_hdsu_lite') "
    
RUN R -e "BiocManager::install('DESeq2', update = FALSE)"
RUN R -e "BiocManager::install('gage', update = FALSE)"
RUN R -e "install.packages('DT')"

RUN R -e "BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats', 'limma', 'S4Vectors', 'SingleCellExperiment', 'batchelor'))"

#Now, install monocle3 through the cole-trapnell-lab GitHub, execute:
RUN R -e "devtools::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "devtools::install_github('cole-trapnell-lab/monocle3')"