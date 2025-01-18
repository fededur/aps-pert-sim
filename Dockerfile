# Use the Rocker R base image
FROM rocker/r-ver:4.3.1

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies for R packages
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('knitr', 'kableExtra', 'tidyverse', 'ggplot2'), repos='https://cran.rstudio.com/')"

# Clone the GitHub repository
RUN apt-get update && apt-get install -y git && apt-get clean
RUN git clone https://github.com/fededur/aps-pert-sim.git/workspace

# Set working directory
WORKDIR /workspace

# Install RMarkdown
RUN R -e "install.packages('rmarkdown', repos='https://cran.rstudio.com/')"

# Command to render the R Markdown file
CMD ["R", "-e", "rmarkdown::render('/workspace/report/aps-sim-report.Rmd')"]
