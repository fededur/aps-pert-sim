# Effect of the APS perturbation routine on farm land area

This repository helps you produce a document that runs a simulation to quantify the effect of noise in Agricultural Production Statistics (APS) farm land area unit record data. The simulation evaluates how the perturbation routine impacts data accuracy at varying levels of aggregation and farm sizes.

The rendered document contains all the details of the study, including methodology, simulations, and results.

---

## Rendering the document

The recommended method is to use Docker for simplicity and consistency, as it avoids dependency issues. However, you can also render the document directly with R if Docker is not an option.



## 1 Project Files

Obtain the repository files by either:

  - Cloning the repository (requires Git):
     
```bash
git clone https://github.com/fededur/aps-pert-sim.git
```

  - Or downloading the repository as a ZIP file from GitHub and extracting it.


## 2 Render


### 2.1 Docker-based rendering

**Docker**

  - Install Docker from [https://www.docker.com/](https://www.docker.com/).
  
  - Create a Docker account if you don’t already have one.
  
  - Open Docker Desktop, sign in to your account, and ensure it is running.
  
  - Verify installation:
  
```bash
docker --version
```

**Terminal**

  - Use any terminal (e.g., Git Bash, Command Prompt, RStudio Terminal) to run Docker commands.
 
  - Navigate to the project directory:
  
    ```bash
    cd /path/to/aps-pert-sim
    ```
  - Build the Docker image:
  
    ```bash
    docker build -t rmarkdown-renderer .
    ```
  - Render the document:
  
```bash
./run.sh
```

### 2.2 R-based rendering

**R Software** 
 
  - Install R from [https://cran.r-project.org/](https://cran.r-project.org/).<br/>
 
  - Preferably, install RStudio from [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)<br/>
   
**R Packages** 
 
  - Install the required R packages:
   
```r
install.packages(c('rmarkdown', 'bookdown', 'knitr', 'kableExtra', 'dplyr', 'tibble'))
```

**Render the document**

  - Open the aps-pert-sim R project in RStudio and run the following R command:

```r
rmarkdown::render("aps-pert-simulation.Rmd", output_dir = "output")
```

## 3 Output

The rendered html document will be found in `output/aps-pert-simulation.html` 
