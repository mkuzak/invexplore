library(shiny)
library(ggvis)
shinyUI(fluidPage(
        titlePanel("Inversion accessions"),
        ggvisOutput("scatter")


))
