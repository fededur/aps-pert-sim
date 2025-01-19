# Use the Rocker Verse base image
FROM rocker/verse:latest

# Install Git for cloning the repository
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repository during build
ARG REPO_URL=https://github.com/fededur/aps-pert-sim.git
RUN git clone ${REPO_URL} /repo

# Set the working directory
WORKDIR /repo

# Create the output directory
RUN mkdir -p /repo/output

# Install required R packages
RUN R -e "install.packages(c('knitr', 'kableExtra'), repos='https://cran.rstudio.com/')"

# Default command to render the R Markdown file
CMD ["Rscript", "-e", "rmarkdown::render('aps-pert-simulation.Rmd', output_dir = '/repo/output')"]
