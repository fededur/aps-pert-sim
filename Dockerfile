# Rocker Tidyverse base image
FROM rocker/tidyverse:4.3.1

# Install Git
RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install required R packages
RUN R -e "install.packages(c('rmarkdown', 'bookdown', 'knitr', 'kableExtra', 'dplyr', 'tibble', 'purrr'), repos='https://cran.rstudio.com/')"

# Dynamically pull the repository and ensure output folder exists
CMD bash -c "\
  if [ ! -d .git ]; then \
    git clone https://github.com/fededur/aps-pert-sim.git /workspace; \
  else \
    git -C /workspace pull origin main; \
  fi && \
  mkdir -p /workspace/output && \
  R -e 'rmarkdown::render(\"/workspace/aps-pert-simulation.Rmd\", output_dir = \"/workspace/output\")'"
