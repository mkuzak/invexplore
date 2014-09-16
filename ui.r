library(shiny)
library(ggvis)
library(leaflet)

shinyUI(fluidPage(
        tags$head(tags$link(rel='stylesheet', type='text/css', href='styles.css')),
        leafletMap(
          "map", "100%", 400,
          initialTileLayer = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
          initialTileLayerAttribution = HTML('Maps by <a href="http://www.mapbox.com/">Mapbox</a>'),
          options=list(
            center = c(37.45, -93.85),
            zoom = 4
          )
        ),
        ggvisOutput("scatter")
))
