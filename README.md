Hi, this is my 611 Data Science Project. 

Create a docker container by running 
```{r}
docker build . -t project-env
```

Then create RStudio browser by running:
```{r}
docker run --rm -tidp 8787:8787 -v .:/home/rstudio/working alectries/univr
```

Visit http://localhost:8787 to open RStudio. The username is rstudio and the password is login.

Dowload data from https://www.kaggle.com/datasets/usdot/flight-delays/data because data is too large to upload to github. This link worked as of 11/29/2024. Add the data to a folder called Source Data.

