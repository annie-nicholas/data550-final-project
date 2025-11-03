Output/Table1.rds: Code/Descriptive_Stats.R
	Rscript Code/Descriptive_Stats.R
	
Output/Table_reg.rds Output/Reg_plot.png&: Code/Regression.R
	Rscript Code/Regression.R
	
Report.html: Code/Make_Report.R Report.Rmd
	Rscript Code/Make_Report.R

clean:
	rm Output/*.rds Output/*.png