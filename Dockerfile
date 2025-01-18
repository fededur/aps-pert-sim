# Rocker Tidyverse base image
FROM rocker/tidyverse:4.3.1

# Install Git
RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone GitHub repository
RUN git clone https://github.com/fededur/aps-pert-sim.git /workspace

# Set WD 
WORKDIR /workspace

# Ensure RMarkdown is installed
RUN R -e "if (!requireNamespace('rmarkdown', quietly = TRUE)) install.packages('rmarkdown', repos='https://cran.rstudio.com/')"

# Render rmarkdown file
CMD ["R", "-e", "rmarkdown::render('/workspace/aps-sim-report.Rmd', output_dir = '/workspace/report')"]
