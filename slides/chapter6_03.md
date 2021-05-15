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