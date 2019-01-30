install.packages(c("ggplot2", "devtools", "dplyr", "stringr"))
install.packages(c("maps", "mapdata"))


library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(dplyr)
library(stringr)


usa <- map_data("usa")

dim(usa)

head(usa)

tail(usa)

states <- map_data("state")
dim(states)

head(states)

tail(states)

ggplot(data = states) +
  geom_polygon(aes(
    x = long,
    y = lat,
    fill = region,
    group = group
  ), color = "white") +
  coord_fixed(1.3) +
  guides(fill = FALSE)

ca_df <- subset(states, region == "california")

head(ca_df)

counties <- map_data("county")
ca_county <- subset(counties, region == "california")

head(ca_county)

ca_data <-
  inner_join(ca_county, CDC.by.County, by = "subregion", copy = FALSE)

ca_base <-
  ggplot(data = ca_df,
         mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "gray")
ca_base + theme_bw() +
  geom_polygon(data = ca_data, aes(fill = Crude.Rate), color = "black") +
  scale_fill_gradient(low = "seagreen3", high = "red2", trans = "log10") +
  geom_polygon(color = "black", fill = NA)


nm_df <- subset(states, region == "new mexico")

head(nm_df)

counties <- map_data("county")
nm_county <- subset(counties, region == "new mexico")

head(nm_county)

nm_data <-
  inner_join(nm_county, CDC.by.County, by = "subregion", copy = FALSE)

nm_base <-
  ggplot(data = nm_df,
         mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "gray")
nm_base + theme_bw() +
  geom_polygon(data = nm_data, aes(fill = Crude.Rate), color = "black") +
  scale_fill_gradient(low = "seagreen3", high = "red2", trans = "log10") +
  geom_polygon(color = "black", fill = NA)

ky_df <- subset(states, region == "kentucky")

head(ky_df)

counties <- map_data("county")
ky_county <- subset(counties, region == "kentucky")

head(ky_county)

ky_data <-
  inner_join(ky_county, CDC.by.County, by = "subregion", copy = FALSE)

ky_base <-
  ggplot(data = ky_df,
         mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "gray")
ky_base + theme_bw() +
  geom_polygon(data = ky_data, aes(fill = Crude.Rate), color = "black") +
  scale_fill_gradient(low = "seagreen3", high = "red2", trans = "log10") +
  geom_polygon(color = "black", fill = NA)

wv_df <- subset(states, region == "west virginia")

head(wv_df)

counties <- map_data("county")
wv_county <- subset(counties, region == "west virginia")

head(wv_county)

wv_data <-
  inner_join(wv_county, CDC.by.County, by = "subregion", copy = FALSE)

wv_base <-
  ggplot(data = wv_df,
         mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "gray")
wv_base + theme_bw() +
  geom_polygon(data = wv_data, aes(fill = Crude.Rate), color = "black") +
  scale_fill_gradient(low = "seagreen3", high = "red2", trans = "log10") +
  geom_polygon(color = "black", fill = NA)


