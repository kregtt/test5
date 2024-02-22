# Image initiale

FROM rocker/shiny



# Installation des packages R necessaires à l'application
# RUN Rscript -e "install.packages(c('shiny','shinyjs','aws.s3','lubridate','dplyr','stringi','stringr','tableHTML','tidyr','writexl','rmarkdown','grid','gridExtra','openxlsx','knitr','png'))"

RUN Rscript -e "install.packages(c('shiny','dplyr'))"



# Copie des fichiers de l'app Shiny
RUN mkdir ~/ShinyApp
WORKDIR ~/ShinyApp
COPY ./ui.R ui.R
COPY ./server.R server.R


# Definition du port d'acces de l'application
ARG SHINY_PORT=3838
EXPOSE $SHINY_PORT
RUN echo "local({options(shiny.port = ${SHINY_PORT}, shiny.host = '0.0.0.0')})" >> /usr/local/lib/R/etc/Rprofile.site

# Mise des variables d'environnement de proxy à vide
ENV https_proxy=
ENV http_proxy=

# Endpoint
CMD ["Rscript", "-e", "shiny::runApp()"]

