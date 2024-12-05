.PHONY: clean
.PHONY: report

clean:
	rm -rf derived_data
	rm -rf figures
	rm -rf final

report.pdf: report.Rmd \
figures/fake_data_origin.png figures/flights_per_airline.png\
figures/percent_delays_airline.png figures/flights_per_month.png\
figures/percent_delays_month.png figures/delay_by_airport.png\
figures/percent_delays_origin.png
	R -e "rmarkdown::render(input='report.Rmd', output_file='report.pdf', output_format='html_document')"


derived_data/delays.csv: \
source_data/airlines.csv source_data/flights.csv\
Scripts/delays_data.R
	Rscript Scripts/delays_data.R

derived_data/joined_status.csv: \
source_data/airlines.csv\
source_data/flights.csv\
Scripts/joined_data.R
	Rscript Scripts/joined_data.R

figures/fake_data_origin.png:\
source_data/flight_delays.csv\
Scripts/create_fake_plot.R
	Rscript Scripts/create_fake_plot.R

figures/flights_per_airline.png:\
source_data/airlines.csv\
derived_data/delays.csv\
Scripts/flights_per_airline.R
	Rscript Scripts/flights_per_airline.R

figures/percent_delays_airline.png:\
derived_data/joined_status.csv\
Scripts/percent_delays_airline.R
	Rscript Scripts/percent_delays_airline.R

figures/flights_per_month.png:\
derived_data/joined_status.csv\
Scripts/flights_per_month.R
	Rscript Scripts/flights_per_month.R

figures/percent_delays_month.png:\
derived_data/joined_status.csv\
Scripts/percent_delays_month.R
	Rscript Scripts/percent_delays_month.R

figures/delay_by_airport.png:\
derived_data/delays.csv\
Scripts/delay_by_airport.R
	Rscript Scripts/delay_by_airport.R

figures/percent_delays_origin.png:\
derived_data/joined_status.csv\
Scripts/percent_delays_origin.R
	Rscript Scripts/percent_delays_origin.R
