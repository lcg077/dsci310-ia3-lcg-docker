# Use Rocker RStudio base image
FROM rocker/rstudio:4.4.2

# Switch to root to install system dependencies
USER root

# Install remotes package
RUN Rscript -e 'install.packages("remotes", repos="https://cloud.r-project.org")'

# Install specific version of cowsay
RUN Rscript -e 'remotes::install_version("cowsay", version = "0.8.0", repos="https://cloud.r-project.org")'

# Switch back to RStudio user
USER rstudio

# Copy the R script
COPY script.R /home/rstudio/script.R

# Expose RStudio Server port
EXPOSE 7777

# Ensure RStudio Server starts properly
CMD ["/init"]