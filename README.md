Hi, this is my 611 Data Science Project. 

Create a docker container by running 
```{r}
docker build . -t bios-611
```

Then create RStudio browser by running:
```{r}
docker run --rm \
   --platform linux/x86_64 \
   -p 8787:8787 \
   -e PASSWORD=yourpassword \
   -e DISABLE_AUTH=false  \
   -v $(pwd):/home/rstudio/project \
   rocker/verse:latest
```

Visit http://localhost:8787 to open RStudio.

Dowload data from https://www.kaggle.com/datasets/usdot/flight-delays/data because data is too large to upload to github. This link worked as of 11/29/2024. Add the data to a folder called Source Data.

