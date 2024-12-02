FROM alectries/univr

RUN R -e "install.packages(c('glmnet','tidyverse'), repos='https://cloud.r-project.org/', dependencies=TRUE)"