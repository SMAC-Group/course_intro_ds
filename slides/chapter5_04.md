---
type: slides
---

# Visualizing multiple distributions

---

Let's consider the `penguins` dataset avaiable in the `palmerpenguins` package. You can find a detailed description of the dataset [here](https://github.com/allisonhorst/palmerpenguins).

We first load the dataset and have a look at the first few rows.

```R
library(ggplot2)
library(palmerpenguins)
library(tidyverse)  
data("penguins")
head(penguins)
```

```out
  species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g sex     year
  <fct>   <fct>              <dbl>         <dbl>             <int>       <int> <fct>  <int>
1 Adelie  Torgersen           39.1          18.7               181        3750 male    2007
2 Adelie  Torgersen           39.5          17.4               186        3800 female  2007
3 Adelie  Torgersen           40.3          18                 195        3250 female  2007
4 Adelie  Torgersen           NA            NA                  NA          NA NA      2007
5 Adelie  Torgersen           36.7          19.3               193        3450 female  2007
6 Adelie  Torgersen           39.3          20.6               190        3650 male    2007
```

---


<div style="text-align:center"><img src="penguins.gif" alt=" " width="35%"></div>

---

Let's compute a new variable, `bill_ratio`, which represents the bill ratio of penguins based on their species. We will later compare the densities of `bill_ratio`.


```R
df_peng_stats <- 
  penguins %>% 
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) %>% 
  filter(!is.na(bill_ratio)) %>% 
  group_by(species) %>% 
  mutate(
    n = n(),
    median = median(bill_ratio),
    max = max(bill_ratio)
  ) %>% 
  ungroup() %>% 
  mutate(species_num = as.numeric(fct_rev(species)))  %>% 
  select(species, bill_length_mm, bill_depth_mm, bill_ratio, n, median, max, species_num)

head(df_peng_stats)
```


```out
  species bill_length_mm bill_depth_mm bill_ratio     n median   max species_num
  <fct>            <dbl>         <dbl>      <dbl> <int>  <dbl> <dbl>       <dbl>
1 Adelie            39.1          18.7       2.09   151   2.14  2.45           3
2 Adelie            39.5          17.4       2.27   151   2.14  2.45           3
3 Adelie            40.3          18         2.24   151   2.14  2.45           3
4 Adelie            36.7          19.3       1.90   151   2.14  2.45           3
5 Adelie            39.3          20.6       1.91   151   2.14  2.45           3
6 Adelie            38.9          17.8       2.19   151   2.14  2.45           3
```
---

We can easily produce a plot to compare the densities of bill ratio by species as follows:

```R
ggplot(data=df_peng_stats, aes(x=bill_ratio, group=species, fill=species)) +
  geom_density(alpha=0.6) +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89"))  + 
  xlab("Bill ratio") + ylab("Density")

```

---
<div style="text-align:center"><img src="mdens1.png" alt=" " width="35%"></div>
---

Besides visualizing distributions along the horizontal axis as in the previous graph, we can also stagger the distributions in the vertical direction. The resulting visualization is called a ridgeline plot, because these plots look like mountain ridgelines. Ridgeline plots are particularly useful when we want to show trends in distributions over time.

We can easily produce a ridgeline plot to compare the densities of bill ratio by species with a `ggplot2` extension called `ggridges`.

```R
library(ggridges)
ggplot(df_peng_stats, aes(x = bill_ratio, y = species, fill = species)) +
  geom_density_ridges(scale = .9, alpha=.8) +
  theme_ridges() + 
  theme_minimal() +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89")) +
  scale_color_manual(values = c("#3d6721", "#a86826", "#006c89")) +
  xlab("Bill ratio") +
  ylab("Species")
```

---

<div style="text-align:center"><img src="mdens6.png" alt=" " width="35%"></div>

---

We can also consider a slightly more complex code to produce a considerably more attractive graph. Let's construct it gradually.


<div style="text-align:center"><img src="ggplot2_better.png" alt=" " width="35%"></div>


---


```R
g1 = ggplot(df_peng_stats, aes(bill_ratio, species_num, color = species)) +
  geom_point(
    aes(y = species_num - .15), 
    shape = "|",
    size = 5,
    alpha = .33
  ) +
  ggdist::stat_halfeye(
    aes(
      y = species_num,
      color = species,
      fill = after_scale(colorspace::lighten(color, .5))
    ),
    shape = 18, point_size = 3, interval_size = 1.8, adjust = .5,
    .width = c(0, 1)
  ) +
  theme_minimal() +
  scale_color_manual(values = c("#3d6721", "#a86826", "#006c89"), guide = "none") 
g1  
```
---

<div style="text-align:center"><img src="mdens2.png" alt=" " width="35%"></div>

---


```R
g2 = g1 +
  geom_text(
    aes(x = median, label = format(round(median, 2), nsmall = 2)),
    stat = "unique",
    color = "white",
    family = "Open Sans",
    fontface = "bold",
    size = 3.4,
    nudge_y = .15
  ) +
  geom_text(
    aes(x = max, label = glue::glue("n = {n}")),
    stat = "unique",
    family = "Open Sans",
    fontface = "bold",
    size = 3.5,
    hjust = 0,
    nudge_x = .01,
    nudge_y = .02
  ) 

g2
```

---

<div style="text-align:center"><img src="mdens3.png" alt=" " width="35%"></div>

---

```R
g3 = g2 + 
  coord_cartesian(clip = "off", expand = FALSE) +
  scale_x_continuous(
    limits = c(1.6, 3.8),
    breaks = seq(1.6, 3.8, by = .2)
  )+
  scale_y_continuous(
    limits = c(.55, NA),
    breaks = 1:3,
    labels = c("Gentoo", "Chinstrap", "Adélie")
  ) 

g3

```

---

<div style="text-align:center"><img src="mdens4.png" alt=" " width="35%"></div>


---

```R
g4 =  g3 +  labs(
  x = "Bill ratio",
  y = NULL,
  subtitle = "B. Raincloud plot showing the distribution of bill ratios, estimated as bill length divided by bill depth.",
  caption = "Data: Gorman, Williams & Fraser (2014) PLoS ONE Illustration: Allison Horst"
) +
  theme(
    panel.grid.major.x = element_line(size = .35),
    panel.grid.major.y = element_blank(),
    axis.text.y = element_text(size = 13),
    axis.ticks.length = unit(0, "lines"),
    plot.title.position = 'plot',
    plot.subtitle = element_text(margin = margin(t = 5, b = 10)),
    plot.margin = margin(10, 25, 10, 25),
    axis.ticks = element_line(color = "grey92"),
    panel.grid.minor = element_blank(),
    legend.title = element_text(size = 12),
    legend.text = element_text(color = "grey30"),
    plot.title = element_text(size = 18, face = "bold"),
    plot.caption = element_text(size = 9, margin = margin(t = 15))
  )

g4

```

---

<div style="text-align:center"><img src="mdens5.png" alt=" " width="35%"></div>

---

Lastly, we can add drawings of these penguin species to the graph.

```R
adelie = image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/adelie.png")
img_adelie = grid::rasterGrob(adelie, interpolate = TRUE)
chinestrap = image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/chinestrap.png")
img_chinestrap = grid::rasterGrob(chinestrap, interpolate = TRUE)
gentoo = image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/gentoo.png")
img_gentoo = grid::rasterGrob(gentoo, interpolate = TRUE)

g5 = g4 + annotation_custom(img_adelie, ymin = 3.1, ymax = 3.7, xmin = 1.05, xmax = 2) + 
  annotation_custom(img_chinestrap, ymin = 2.1, ymax = 2.7, xmin = 1.05, xmax = 2) + 
  annotation_custom(img_gentoo, ymin = 1.1, ymax = 1.7, xmin = 1.0, xmax = 2)

g5
```

---

<div style="text-align:center"><img src="mdens8.png" alt=" " width="40%"></div>


---

Let us now consider the data `lincoln_weather` which contain weather information from Lincoln, Nebraska, from 2016. The dataset is available in the `ggridges` package.

```R
library(ggridges)
data("lincoln_weather")
lincoln_weather = lincoln_weather %>% select(Month, `Mean Temperature [F]`)
head(lincoln_weather)
```

```out
  Month   `Mean Temperature [F]`
  <fct>                    <int>
1 January                     24
2 January                     23
3 January                     23
4 January                     17
5 January                     29
6 January                     33

```

---

We can start our analysis by comparing temperatures per months using boxplots.

```R
ggplot(lincoln_weather, aes(x = `Month`, y = `Mean Temperature [F]`)) +
  geom_boxplot(fill = 'grey90') + theme_light()
```

---

<div style="text-align:center"><img src="temp1.png" alt=" " width="40%"></div>


---

We can also visualize the observations by directly plotting the points, leading to a strip chart.

```R
ggplot(lincoln_weather, aes(x = `Month`, y = `Mean Temperature [F]`)) +
  geom_point() + theme_light()
```

---

<div style="text-align:center"><img src="temp2.png" alt=" " width="40%"></div>


---

Strip charts generally work well as long as we don't have too many points to plot on top of each other. If too many points overlap in one strip chart, then we will be hardly able to distinguish the observations. In this case, a simple solution is to jitter a bit the observations, in the sense that we can spread out the points along the x-axis by adding some random noise in the horizontal direction.

```R
ggplot(lincoln_weather, aes(x = `Month`, y = `Mean Temperature [F]`)) +
  geom_point(position = position_jitter(width = .2, height = 0)) + theme_light()
```

---

<div style="text-align:center"><img src="temp4.png" alt=" " width="40%"></div>


---

We now add an estimated density to the observations with a viollin plot. A violin plot is equivalent to the density estimates but rotated by 90 degrees and then mirrored. 

```R
ggplot(lincoln_weather, aes(x = `Month`, y = `Mean Temperature [F]`)) +
  geom_violin(color = "transparent", fill = "gray90") + theme_light() +
  geom_point(position = position_jitter(width = .2, height = 0))
```

---

<div style="text-align:center"><img src="temp5.png" alt=" " width="40%"></div>



---

We can also represent it differently with a ridgeline plot.

```R
library(hrbrthemes)
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`)) +
  geom_density_ridges(scale = 3, rel_min_height = 0.01,fill = "#00b3b3", color = "white") +
  theme_ipsum()
```

---

<div style="text-align:center"><img src="temp6.png" alt=" " width="40%"></div>


---

We can improve the ridgeline plot, for example, by adding a title. 

```R
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`)) +
  geom_density_ridges(scale = 3, rel_min_height = 0.01,fill = "#00b3b3", color = "white") +
  theme_ipsum() +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  scale_x_continuous(name = "Mean temperature (°F)", expand = c(0, 0), breaks = c(0, 25, 50, 75)) +
  scale_y_discrete(name = NULL, expand = c(0, .2, 0, 2.6))
```

---

<div style="text-align:center"><img src="temp7.png" alt=" " width="40%"></div>

---

lastly, we can fill the density with a color scale that represents the temperature.

```R
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  theme_ipsum()  +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  scale_x_continuous(name = "Mean temperature (°F)", expand = c(0, 0), breaks = c(0, 25, 50, 75)) +
  scale_y_discrete(name = NULL, expand = c(0, .2, 0, 2.6))
```

---

<div style="text-align:center"><img src="temp8.png" alt=" " width="40%"></div>



---

We can also change the color scale.

```R
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  theme_ipsum() + scale_fill_viridis(name = "Temp. [F]", option = "C")  +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  scale_x_continuous(name = "Mean temperature (°F)", expand = c(0, 0), breaks = c(0, 25, 50, 75)) +
  scale_y_discrete(name = NULL, expand = c(0, .2, 0, 2.6))
```

---

<div style="text-align:center"><img src="temp9.png" alt=" " width="40%"></div>
