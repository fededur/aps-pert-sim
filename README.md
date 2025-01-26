# Effect of the APS perturbation routine on farm land area

<!-- badges: start -->
<!-- badges: end -->

This repository provides tools to simulate the impact of noise addition methods applied to unit record data in Agricultural Production Statistics (APS). The simulation evaluates how this perturbation routine affects the accuracy of APS statistics at different aggregation levels and for various farm sizes, focusing on farmland area.

The repository includes all necessary resources to reproduce the study, including methodology, simulation steps, and results.

---

## Getting started

Follow the steps below to set up and render the document.

## Step 1: Obtain the repository files

Copy the project files to your local machine using one of the following methods:

  - Clone the repository (requires Git)
  
    Open a terminal, create a folder for the project, and run: 
     
```bash
git clone https://github.com/fededur/aps-pert-sim.git
```

  - Download the repository as a ZIP file:
  
   click the green Code button on this page, and select Download ZIP. 
   Extract the contents to a folder on your machine.


## Step 2: Render the document

The recommended method is to use Docker for simplicity and consistency, as it avoids dependency issues. However, you can also render the document directly with R if Docker is not an option.


### Option A: Docker-based rendering

**Docker**

  - Install Docker from [https://www.docker.com/](https://www.docker.com/).
  
  - Create a Docker account if you don’t already have one.
  
  - Open Docker Desktop, sign in to your account, and ensure it is running.
  
**Terminal**

  - Use any Git Bash or RStudio Terminal to run shell commands.

**Render**

  - Open your terminal and navigate to the project directory:
  
```bash
cd /path/to/aps-pert-sim
```
  - Run the shell script to build the Docker image and render the document:
  
```bash
./run_report.sh
```

### R-based rendering

**R Software** 
 
  - Install R from [https://cran.r-project.org/](https://cran.r-project.org/).<br/>
 
  - Preferably, install RStudio from [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)<br/>
   
**R Packages** 
 
  - Install the required R packages:
   
```r
install.packages(c('rmarkdown', 'bookdown', 'knitr', 'kableExtra', 'dplyr', 'tibble'))
```

**Render**

  - Open the `aps-pert-sim` project in RStudio and run the following R command in the console:

```r
rmarkdown::render("aps-pert-simulation.Rmd", output_dir = "output")
```

## Step 3: Locate the output

The rendered document will be saved in the **output** folder within the project directory. To access it:

- Navigate to the **output** folder:

```bash
cd /path/to/output/aps-pert-simulation.html
```

Open the **aps-pert-simulation.html** file in your browser to view the report.


