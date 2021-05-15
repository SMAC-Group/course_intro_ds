---
type: slides
---

# Where does the background map come from?

---

## Map providers

Many organizations provide map data over the internet. Examples are:

<div style="text-align:center; display: flex; flex-direction: row; width:100%">
  <div style="text-align:center; width: 33%">
    OpenStreetMap<br>
    <iframe src="providers_1.html" height="320" width="90%" title="Iframe Example"></iframe>
  </div>
  <div style="text-align:center; width: 33%">
    Google Earth<br>
    <iframe src="providers_2.html" height="320" width="90%" title="Iframe Example"></iframe>
  </div>
  <div style="text-align:center; width: 33%">
    Esri<br>
    <iframe src="providers_3.html" height="320" width="90%" title="Iframe Example"></iframe>
  </div>
</div>

---

## Web Map Tile Services

Map data comes over the internet in **tiles**. Each tile is uniquely identified with three numbers: `z` (zoom), `x`, and `y`.

<div style="text-align:center"><img src="web_tiles.png" alt=" " width="60%"></div>

---

## Example: Google Earth tile server

Google publishes tiles at the following address: 

```
https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}
```

So that if you visit this address: [http://mt1.google.com/vt/lyrs=s&x=**8**&y=**5**&z=**4**](http://mt1.google.com/vt/lyrs=s&x=8&y=5&z=4)  you get this image:

<div style="text-align:center"><img src="tile.jpeg" alt=" " ></div>

If you want to know more, read about [Web Map Tile Services](https://en.wikipedia.org/wiki/Web_Map_Tile_Service).

---

## Google Earth in leaflet

Let's add the data from Google Earth to our `Leaflet` map:


```r
library(leaflet)

# Create an empty map
m <- leaflet()

# Add the tiles from Google Earth
m <- addTiles(
  m, 
  attribution = "Google Earth",
  urlTemplate = "//mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}"
)

# Center the map on in Milano, Italy
m <- setView(m, lng = 9.190439, lat = 45.464129, zoom = 15) 

# Display the map
m
```

---

Here is the result:

<div style="text-align:center">
  <iframe src="example_2.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>

---

## Multiple map layers

We can add multiple tile layers to the same map, using the `opacity` option:

```r
# Create an empty map
m <- leaflet()

# Add the tiles from Google Earth
m <- addTiles(
  m, 
  attribution = "Google Earth",
  urlTemplate = "//mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}"
)

# Add default tiles from OpenStreetMaps with opacity 0.5
m <- addTiles(
  m, 
  options = list(
    opacity = 0.5)
  )

m
```

The last tile layer will be the topmost.

---

Here is the result:

<div style="text-align:center">
  <iframe src="example_3.html" height="480" width="60%" title="Iframe Example"></iframe>
</div>
