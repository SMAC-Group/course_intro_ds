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

# Add the background data
m <- addTiles(m)

# Centers the view
m <- setView(m, lng = 7.4353049, lat = 46.952606, zoom = 20) 

# Add a marker
m <- addMarkers(m, lng = 7.4353049, lat = 46.952606, popup = "Institute of Geography")

# Display the map
m
```

---

## How do I see the result?

You can see the output directly in `RStudio`, in the `Viewer` tab.

<div style="text-align:center"><img src="rstudio_2.png" alt=" " width="40%"></div>

---

## Can I see the map without RStudio?

Yes! You can export a single, self-contained, `html` file with the following code.

```r
# load the htmlwidgets package
library(htmlwidgets)

# save the map m into output.html file
saveWidget(m, file="output.html")
```

&nbsp;

You can open `output.html` with any internet browser and share it with anybody.

---

Or you can integrate it easily in your websites, blog posts, etc.

<div style="text-align:center">
  <iframe src="example_1.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

