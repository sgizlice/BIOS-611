Hi, this is my 611 Data Science Project. 

First download the files from this github site. I 

Then create a docker container by running the following command in your terminal. This command should be run after cd-ing into the folder where you put the files downloaded from github.
```{r}
docker build . -t project-env
```

Then create RStudio browser by running:
```{r}
docker run --rm -tidp 8787:8787 -v .:/home/rstudio/working alectries/univr
```

Visit http://localhost:8787 to open RStudio. The username is rstudio and the password is login.

I originally downloaded the data from https://www.kaggle.com/datasets/umeradnaan/flight-delays-dataset, this dataset is too large to upload to Kaggle. The link worked as of 12/3/2024. I quickly realized that the dataset was artificial so I ended up finding another one but this dataset does need to be downloaded and added to a working folder called 'source_data' because one plot is based off this data.

After finding out the original dataset was fake, I found a new dataset. Dowload data from https://www.kaggle.com/datasets/usdot/flight-delays/data because data is too large to upload to github. This link worked as of 11/29/2024. Add the data to a folder called 'source_data'.

Once the data is downloaded, create the final report by running the following command in your terminal in RStudio.

```{r}
make report.html
```

The report should now be generated and ready for review.