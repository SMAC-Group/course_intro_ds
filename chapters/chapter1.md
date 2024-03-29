---
title: 'Chapter 1: Data Structures'
description:
  'Learn to organize data in order to use it more efficiently.'
prev: null
next: /chapter2
type: chapter
id: 1
---


<exercise id="1" title="General information">

In this chapter we will consider an introduction to data structure with `R`.

</exercise>


<exercise id="2" title="Introduction to vectors" type = "slides">

<slides source="chapter1_01">
</slides>

</exercise>

<exercise id="3" title="Introduction to vectors: Exercises">

### 1) Guess the value of `d`:

```r
a = c(1,2,3)
b = c(4,5)
d = c(a,b,a)
```


<choice id="1">
<opt text="<code>[1] 1 2 3 4 5</code>" >
</opt>
<opt text="<code>[1] 4 5 1 2 3 4 5</code>" >
</opt>
<opt text="<code>[1] 1 2 3 4 5 1 2 3</code>" correct="true">
</opt>
</choice>


### 2) Subset the 1st, 2nd, 4th and 5th elements of the vector `x`:

<codeblock id="01_01">
To select with positive indices, you can simply use: <code>x[c(1, 2, 4, 5)]</code>
</codeblock>

### 3) Find an easier way to subset `x`:

<codeblock id="01_02">
Try to decompose the problem... First, try to understand what is <code>x[c(1, 2, 4, 6)]</code>, then, <code>x[c(1, 2, 4, 6)][-2]</code> and so on.
</codeblock>


</exercise>

<exercise id="4" title="Attributes, simple functions applied to vectors, dates and sequences" type = "slides">

<slides source="chapter1_02">
</slides>

</exercise>


<exercise id="5" title="Attributes, simple functions applied to vectors, dates and sequences: Exercises">

### 1) Guess what the code below is doing:

```r
x = c(1,2,4,7,15)
n = length(x)
x[n:1]
```

<choice id="1">
<opt text="<code>[1] 15  7  4  2  1</code>" correct="true">
</opt>
<opt text="<code>[1]  1  2  4  7 15</code>" >
</opt>
<opt text="<code>[1]  2  1 15  4  7</code>" >
</opt>
<opt text="<code>[1]  1  4 15  7  2</code>">
</opt>
</choice>

### 2) Try to obtain the same results of the command `x[n:1]` but using the function `sort()`.

<codeblock id="01_04">
Read about the argument <code>decreasing</code> in the documentation of the function <code>sort()</code> available at https://stat.ethz.ch/R-manual/R-devel/library/base/html/sort.html
</codeblock>


### 3) Extract all the odd numbers from 1 to 1000. 
<codeblock id="01_08">
Read the documentation of the function <code>seq</code> to understand its arguments.
</codeblock>

### 4) Extract all the multiples of 4 from 1 to 444.
<codeblock id="01_09">
Use the function <code>seq</code>.
</codeblock>


### 5) Plot the Sigmoïd function from \\(x \in [-20, 20]\\). Recall that the sigmoïd function is \\(f(x) = 1/(1+e^{-x})\\).


<codeblock id="01_03">
Use the function <code>seq</code> or the <code>:</code> operator to generate a sequence from -20 to 20.
</codeblock>


### 6) Load the dataset `mtcars` and calculate the mean, median and variance of the variable <code>mpg</code> ("Miles/(US) gallon"). Convert the variable to KM/Liter. Note that the conversion scale is 1 mpg (US) = 0.425144 km/L.

<codeblock id="01_05">
Revisit the slides if you don't remember these functions.
</codeblock>

</exercise>


<exercise id="6" title="Matrices, lists and dataframes" type = "slides">
<slides source="chapter1_03">
</slides>

</exercise>

<exercise id="7" title="Matrices, lists and dataframes: Exercises">

### 1) Guess the value of the following commands:

```r
a = matrix(c(1:4), ncol = 2)
b = matrix(c(5:8), ncol = 2)
c = a %*% b
c[1,]
```

<choice id="1">
<opt text="<code>[1] 23 31</code>" correct="true">
</opt>
<opt text="<code>[1] 1  3</code>" >
</opt>
<opt text="<code>[1] 5  7</code>" >
</opt>
<opt text="<code>[1] 5  21</code>">
</opt>
</choice>

### 2) Extract the mean of the variable <code>mpg</code> of the dataset <code>mtcars</code>, the element [12,15] from <code>mymat</code> and the first element of the time serie <code>AirPassenger</code> from the object <code>mylist</code> :


<codeblock id="01_06">
Recall the difference between <code>[[]]</code> and <code>[]</code> when indexing lists.
</codeblock>

### 3) Load the dataset <code>iris</code>. Plot boxplots of the distribution of <code>Sepal Length</code> by <code>Species</code> and <code>Sepal Width</code> by <code>Species</code>. Plot a scatterplot of these two variables for all observations and color-code observations by <code>Species</code>.

<codeblock id="01_07">
Recall that you can load a dataset from <code>R</code> using the function <code>data()</code>
</codeblock>


</exercise>
