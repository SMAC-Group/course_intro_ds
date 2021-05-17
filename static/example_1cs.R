library(leaflet)

# Create an empty map
m <- leaflet()       

# Add the background data
m <- addTiles(m)

# Centers the view
m <- setView(m, lng = 7.4353049, lat = 46.952606, zoom = 20) 

# Add a marker
m_latitude = 46.952606
m_longitude = 7.4353049
m_popup_text = "Institute of Geography"

# Add a marker
m <- addMarkers(m, lng = m_longitude, lat = m_latitude, popup = m_popup_text
)

# Display the map
m
