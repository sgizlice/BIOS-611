FROM rocker/verse:latest
RUN R -e "install.packages('glmnet','tidyverse')";