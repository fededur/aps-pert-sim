# Use the Rocker Verse base image
FROM rocker/verse:latest

# Install Git and clean up
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Default workspace environment variable
ENV WORKSPACE=/workspace
ENV RMD_FILE=aps-pert-simulation.Rmd

# Create the default workspace directory
RUN mkdir -p ${WORKSPACE}

# Set the working directory
WORKDIR ${WORKSPACE}


# Install additional R packages
RUN R -e "install.packages(c('knitr', 'kableExtra'), repos='https://cran.rstudio.com/')"

# Command to render the RMarkdown file
CMD ["sh", "-c", "Rscript -e \"rmarkdown::render('${RMD_FILE}')\""]