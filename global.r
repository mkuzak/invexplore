df <- read.csv2("data/inversion_accessions.csv", sep="\t")

# left.R, right.R, lat and long are numeric
df$left.R <- as.numeric(as.character(df$left.R))
df$right.R <- as.numeric(as.character(df$right.R))
df$lat <- as.numeric(as.character(df$lat))
df$long <- as.numeric(as.character(df$long))

# remove NA's and zeros
df = na.omit(df)
df <- df[df$left.R != 0,]