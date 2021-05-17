library(leaflet)

# Create an empty map
m <- leaflet()       

# Add the background data
m <- addTiles(m)

# Centers the view
m <- setView(m, lng = 7.4353049, lat = 46.952606, zoom = 20) 

# Display the map
m