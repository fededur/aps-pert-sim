# Rocker Tidyverse base image
FROM rocker/tidyverse:4.3.1

# Install Git
RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone GitHub repository
RUN git clone https://github.com/fededur/aps-pert-sim.git /workspace

# Set working directory
WORKDIR /workspace

# Install required R packages
RUN R -e "install.packages(c('rmarkdown', 'bookdown', 'knitr', 'kableExtra'), repos='https://cran.rstudio.com/')"

# Render the RMarkdown file
CMD ["R", "-e", "rmarkdown::render('/workspace/aps-pert-simulation.Rmd', output_dir = '/workspace/output')"]
