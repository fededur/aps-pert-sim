# Use the Rocker Verse base image
FROM rocker/verse:latest

# Install Git for cloning the repository
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/fededur/aps-pert-sim.git /repo

# Set the working directory
WORKDIR /repo

# Install required R packages
RUN R -e "install.packages(c('knitr', 'kableExtra', 'rmarkdown'), repos='https://cran.rstudio.com/')"

# Default command to render the R Markdown file using a dynamic output directory
CMD ["sh", "-c", "Rscript -e \"rmarkdown::render('aps-pert-simulation.Rmd', output_file = '${OUTPUT_DIR}/aps-pert-simulation.html')\""]
