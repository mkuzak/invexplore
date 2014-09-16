library(shiny)
library(ggvis)
library(leaflet)
library(maps)

data(uspop2000)

shinyServer(function(input, output, session) {

  df$id <- c(1:nrow(df))

  map <- createLeafletMap(session, 'map')
  pop <- uspop2000[sample(nrow(uspop2000), 500),]
  observe({
    map$clearShapes()
    opts=list(color='#4A9', fill=TRUE, weight=1)
    map$addCircle(
      df$lat,
      df$long,
      radius=rep(100000/max(5, input$map_zoom)^2, nrow(df)),
      layerId=df$id,
      options=opts)
  })

  focus_map <- function(data, location, session, ...) {
    lat <- df$lat[df$id == data$id]
    long <- df$long[df$id == data$id]
    print(lat, long)
    map$setView(lat, long, 8)
  }

  ttip <- function(x) {
    if (is.null(x)) return(null)
    if (is.null(x$id)) return(null)
    accession <- df$name[df$id == x$id]
  }
  df %>% ggvis(~left.R, ~right.R, key := ~id) %>%
    layer_points(x=~left.R, y=~right.R, fill=~country, fillOpacity:=0.6,
                 size := 50, size.hover := 150) %>%
    add_tooltip(ttip, "hover") %>%
    handle_click(on_click=focus_map) %>%
    bind_shiny("scatter")

})

