Report.html: Code/Make_Report.R Report.Rmd Output/Table1.rds Output/Table_reg.rds Output/Reg_plot.png
	Rscript Code/Make_Report.R

Output/Table1.rds: Code/Descriptive_Stats.R
	Rscript Code/Descriptive_Stats.R
	
Output/Table_reg.rds Output/Reg_plot.png&: Code/Regression.R
	Rscript Code/Regression.R

clean:
	rm Output/*.rds Output/*.png
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
#DOCKER RULES (run on local machine)
PROJECTFILES = Report.Rmd Code/Descriptive_Stats.R Code/Regression.R Code/Make_Report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

#Rule to build
project_image:$(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@
	
#Rule to run (build automatically in container)
Report/Report.html:
	docker run -v "$$(pwd)/Report":"/FinalProject/Report" project_image
	
	