# Use the Rocker Verse base image
FROM rocker/verse:latest

# Install Git for cloning the repository
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install required R packages
RUN R -e "install.packages(c('knitr', 'kableExtra', 'rmarkdown'), repos='https://cran.rstudio.com/')"

# Set working directory
WORKDIR /project

# Copy project files
COPY . /project

# Command to render the R Markdown file
CMD ["Rscript", "-e", "rmarkdown::render('aps-pert-simulation.Rmd', output_dir = 'output')"]
