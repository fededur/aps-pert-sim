# Use the Rocker Verse base image
FROM rocker/verse:latest

# Install Git
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repository
ARG REPO_URL=https://github.com/fededur/aps-pert-sim.git
ARG BRANCH=simplify-workflow
RUN git clone --branch ${BRANCH} ${REPO_URL} /repo

# Set the working directory to the cloned repository
WORKDIR /repo

# Install any additional R packages
RUN R -e "install.packages(c('knitr', 'kableExtra'), repos='https://cran.rstudio.com/')"

# Command to render the R Markdown file
CMD ["sh", "-c", "Rscript -e \"rmarkdown::render('aps-pert-simulation.Rmd')\""]