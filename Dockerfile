FROM rocker/tidyverse:4.5.1

RUN mkdir /FinalProject
WORKDIR /FinalProject

RUN mkdir Code
RUN mkdir Output
RUN mkdir Data
COPY Code Code
COPY Data Data
COPY Makefile .
COPY Report.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir Report

CMD make && mv Report.html Report