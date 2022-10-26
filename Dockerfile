FROM rocker/r-ver:4.1.3

# Install system dependencies for the tidyverse R packages

RUN apt-get update

RUN apt-get install -y libnetcdf-dev

RUN R -e "install.packages('ncdf4')"

RUN R -e "install.packages('devtools')"

RUN R -e "devtools::install_github('metno/esd')"

RUN addgroup --system esd \
    && adduser --system --ingroup esd esd

WORKDIR /home/esd

RUN chown esd:esd -R /home/esd

USER esd


