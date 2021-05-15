---
type: slides
---

# Vector data

---

## Shapefiles

The shapefile format is a geospatial vector data format for geographic information system (GIS) software.

<div style="text-align:center"><img src="shapefile_example.png" alt=" " ></div>

---

## How do we load shapefiles?

We can load shapefiles in `R` easily with the `rgdal` package.

```r
# loads the rgdal package
library(rgdal)

# loads the cantons.shp shapefile as an R variable 
cantons = readOGR("cantons.shp")
```

---

## Shapefiles in leaflet

Our shapefile contains **polygons**, thus we use the `addPolygons` function:

```r
m <- addPolygons(
  m, 
  data = cantons,      # the variable where the shapefile was loaded 
  color = "red",       # the border color
  weight = 2,          # the border width
  opacity = 1.0,       # the opacity of the border. 0 => transparent, 1 => opaque.
)
```

---

Here is the result:

<div style="text-align:center">
  <iframe src="example_4a.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

---

## Specify a color for each canton

Suppose we have a variable `canton_colors` that specify the color for each canton. We can tell `leaflet` to use this to color each polygon differently.

```r
m <- addPolygons(
  m, 
  data = cantons, 
  color = "grey", 
  weight = 1,
  fillColor = canton_colors,   # canton_colors is a vector of colors
  fillOpacity = 1.0            # controls the opacity of the fill
)
```

---

Here is the result:

<div style="text-align:center">
  <iframe src="example_4b.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

---

## A more interactive example

We can use the `shiny` `R` package, together with `leaflet` to develop interactive maps. Here is an example: [link](https://davideacucci.shinyapps.io/swisstemp/).

