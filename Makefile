.PHONY: clean
.PHONY: init

init: 
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p final
	mkdir -p logs

clean:
	rm -rf derived_data
	rm -rf figures
	rm -rf logs
	rm -rf final
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p logs
	mkdir -p final

final/report.pdf : report.Rmd \ 
	R -e "rmarkdown::render(input='report.Rmd', output_file='report.pdf', output_format='html_document', "