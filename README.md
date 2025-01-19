# Effect of the APS perturbation routine on farm land area

This repository allows you to produce a document that simulates the impact of the noise addition method applied to unit record data in Agricultural Production Statistics (APS). The simulation explores how this perturbation routine affects the accuracy of APS statistics at different levels of aggregation and for various farm sizes, with a focus on farmland area.

The document produced contains all the details of the study, including methodology, simulations, and results.

---




## 1 Obtain the repository files

Copy the project files to your local machine using one of the following methods:

  - Clone the repository (requires Git)
  
    Open a terminal, create a folder for the project, and run: 
     
```bash
git clone https://github.com/fededur/aps-pert-sim.git
```

  - Download the repository as a ZIP file:
  
   click the green Code button on this page, and select Download ZIP. 
   Extract the contents to a folder on your machine.


## 2 Render the document

The recommended method is to use Docker for simplicity and consistency, as it avoids dependency issues. However, you can also render the document directly with R if Docker is not an option.


### Docker-based rendering

**Docker**

  - Install Docker from [https://www.docker.com/](https://www.docker.com/).
  
  - Create a Docker account if you don’t already have one.
  
  - Open Docker Desktop, sign in to your account, and ensure it is running.
  
**Terminal**

  - Use any terminal (e.g., Git Bash, Command Prompt, RStudio Terminal) to run Docker commands.

**Render**

  - Open your terminal and navigate to the project directory:
  
```bash
cd /path/to/aps-pert-sim
```
  - Run the script to build the Docker image and render the document:
  
```bash
./run.sh
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

  - Open the aps-pert-sim R project in RStudio and run the following R command:

```r
rmarkdown::render("aps-pert-simulation.Rmd", output_dir = "output")
```

## 3 Locate the output

The rendered HTML document will be saved in the `output` folder within your local project directory. You can find it at:

```bash
cd /path/to/output/aps-pert-simulation.html
```

Open the file in a web browser to view the results.


