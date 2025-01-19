# Use the Rocker Verse base image
FROM rocker/verse:latest

# Install Git for cloning repositories
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repository (you can specify the branch dynamically)
ARG REPO_URL=https://github.com/fededur/aps-pert-sim.git
ARG BRANCH=simplify-workflow
RUN git clone --branch ${BRANCH} ${REPO_URL} 

# Install any additional R packages
RUN R -e "install.packages(c('knitr', 'kableExtra'), repos='https://cran.rstudio.com/')"

# Default command to render the main R Markdown file
CMD ["Rscript", "-e", "rmarkdown::render('/aps-pert-sim/aps-pert-simulation.Rmd')"]