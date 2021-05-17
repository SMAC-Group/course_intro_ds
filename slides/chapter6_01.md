---
type: slides
---

# Drawing a basic, interactive map

---

## A basic map in R

You can visualize a basic map with the following `R` code

```r
library(leaflet)

# Create an empty map
m <- leaflet()       

# Add the default content, from OpenStreetMaps.org
m <- addTiles(m)

# Display the map
m
```

---

You find the complete example [here](example_1s.R). Here is the result:

<div style="text-align:center">
  <iframe src="example_1.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

---

## Where is the map displayed?

You can see the output directly in `RStudio`, in the `Viewer` tab.

<div style="text-align:center"><img src="rstudio_2.png" alt=" " width="40%"></div>

---

## Let's center the map at a specific location

You can specify the map **center** and **zoom** with the `setView` function.

```r
# Centers the view
m <- setView(m, 
    lng = 7.4353049, 
    lat = 46.952606, 
    zoom = 20
  ) 
```

---

You find the complete example [here](example_1bs.R). Here is the result:

<div style="text-align:center">
  <iframe src="example_1b.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

---

## Map markers

You can place **popups** with labels at specific places.

```r
m_latitude = 46.952606
m_longitude = 7.4353049
m_popup_text = "Institute of Geography"

# Add a marker
m <- addMarkers(m, 
  lng = m_longitude, 
  lat = m_latitude, 
  popup = m_popup_text
)
```

---

You find the complete example [here](example_1cs.R). Here is the result:

<div style="text-align:center">
  <iframe src="example_1c.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

---

## Can I see the map without RStudio?

Yes! You can export a web page in `html` format with the following code.

```r
# load the htmlwidgets package
library(htmlwidgets)

# save the map m into output.html file
saveWidget(m, file="output.html")
```

&nbsp;

You can open `output.html` with any internet browser and share it with anybody.

You find the complete example [here](example_1ds.R).
