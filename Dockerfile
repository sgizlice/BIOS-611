FROM alectries/univr

RUN R -e "install.packages(c('ggplot2','tidyverse','lubridate','knitr','rmarkdown'), repos='https://cloud.r-project.org/', dependencies=TRUE)"