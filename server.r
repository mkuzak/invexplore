library(shiny)
library(ggvis)

shinyServer(function(input, output, session) {

  df$id <- c(1:nrow(df))

  ttip <- function(x) {
    if (is.null(x)) return(null)
    if (is.null(x$id)) return(null)
    accession <- df$name[df$id == x$id]
  }
  df %>% ggvis(~left.R, ~right.R, key := ~id) %>%
    layer_points(x=~left.R, y=~right.R, fill=~country, fillOpacity:=0.3,
                 size := 50, size.hover := 150) %>%
    add_tooltip(ttip, "hover") %>%
    bind_shiny("scatter")

})

