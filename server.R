
server <- function(input, output, session) {
  
  
  output$caption1 <- renderText({ paste0("ident ",Sys.getenv("SHINYPROXY_USERNAME")) })
  
  
  
}