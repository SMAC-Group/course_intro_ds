---
type: slides
---

# Introduction to vectors

Notes: In this section, we will discuss the basic features of vectors. For more information have a look at this [link](https://smac-group.github.io/ds/data.html#vectors).

---

First, let's consider vectors of numbers:

```r
(grand_slam_win = c(9, 15, 5, 12, 18))
```

```out
[1]  9 15  5 12 18
```

```r
c(1, c(1, 3), c(3))
```

```out
[1] 1 1 3 3
```

We can also define vectors of characters:

```r
(players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka",
             "Novak Djokovic", "Roger Federer"))
```

```out
[1] "Andy Murray"    "Rafael Nadal"   "Stan Wawrinka"  "Novak Djokovic"
[5] "Roger Federer"
```

Notes: With `x = 2`, it simply assigns the value `2` to `x`. By adding `()` around, it prints out the value. 

---


We can evaluate the kind or type of elements that are stored in a vector using the function `typeof()`.

```r
typeof(players)
```

```out
[1] "character"
```

```r
typeof(grand_slam_win)
```

```out
[1] "double"
```

```r
a = c(1,2,3)
b = c(1L,2L,3L)
typeof(a)
```

```out
[1] "double"
```

```r
typeof(b)
```

```out
[1] "integer"
```

Notes: In R, `1L` and `1` are actually different. This is because `R` considers any number as a double by default, except when adding the suffix `L` after an integer.

---

As indicated earlier, a vector has a homogeneous data structure meaning that it can only contain a single type among all the data types. Therefore, when more than one data type is provided, `R` will coerce the data into a "shared" type. To identify this "shared" type we can use this simple rule:

logical < integer < numeric < character,

which simply means that if a vector has more than one data type, the "shared" type will be that of the "largest" type according to the progression shown above. Here are some examples of "coercion" (i.e. mixing different kinds of elements in a vector):

```r
a = c("a", 2)
typeof(a)
```
```out
[1] "character"
```

```r
b = c(FALSE, TRUE, 1, 2, "a")
typeof(b)
```
```out
[1] "character"
```

---

**Subsetting** is very important when working with vector. This can be done in various ways. We can, for example, use **positive** indices:

```r
(x = c(1,2,4,5,1))
```

```out
[1] 1 2 4 5 1
```

```r
x[3]
```

```out
[1] 4
```

```r
n = length(x)
x[c(1,3,n-1)]
```

```out
[1] 1 4 5
```

```r
x[(n+1)]
```

```out
[1] NA
```

⚠️ Note what happens to `x[(n+1)]`! This is one of the oddities of `R` and is likely to create some bugs, so be aware of this!

Notes: Essentially, there are four main ways to subset a vector. Here we'll only discuss the first three, which are

- Positive Index,
- Negative Index,
- Logical Indices.

Also, the function `length()` returns the number of elements stored in a vector. In this case, we have

```r
(n = length(x))
```

```out
[1] 5
```

---

We can also use **negative** indices which are used to remove elements in a vector. Here are some examples:

```r
x[-4]
```

```out
[1] 1 2 4 1
```

```r
x[c(-1,-3)]
```

```out
[1] 2 5 1
```

```r
x[c(-1,-3,-6)]
```

```out
[1] 2 5 1
```

⚠️ Note what happens to `x[c(-1,-3,-6)]`, `x` has only 5 elements so the 6-th elements can't be removed. Neverthless, `R` does not give you an error! This can easily create bugs.

Notes: Remember that

```r
(x = c(1,2,4,5,1))
```

```out
[1] 1 2 4 5 1
```

Negative indices are often used to remove the first element of a vector, for example,

```r
x[-1]
```

```out
[1] 2 4 5 1
```

or its last element:

```r
x[-length(x)]
```

```out
[1] 1 2 4 5
```

---

It is possible to combine the positive and negative indices, for example:

```r
x[-1][c(2,3)]
```

```out
[1] 4 5
```

which is equivalent to

```r
y = x[-1]
y[c(2,3)]
```

```out
[1] 4 5
```


Notes: Remember that

```r
(x = c(1,2,4,5,1))
```

```out
[1] 1 2 4 5 1
```

Here are some stranger examples 😟:

```r
x[-1][-1][-1]
```

```out
[1] 5 1
```

```r
x[-1][c(3,4,1)][-2]
```

```out
[1] 5 2
```

---

Finally, it is also possible to use boolean value to extract the elements of a vector. This is another useful approach. Here are a few examples:

```r
x[c(T, T, T, F, T)]
```

```out
[1] 1 2 4 1
```
```r
x[c(T, F)]
```

```out
[1] 1 4 1
```

😳 The last example is quite surprising! Indeed, `x` has 5 elements but we are using a vector dimension 2 inside of it..,nd `R` returns no error. This is because `R` recycles, or repeats, elements of the shorter vector until it matches the longer one. In this case `x[c(T, F)]` is equivalent to:

```r
x[c(T, F, T, F, T)]
```

```out
[1] 1 4 1
```

This phenomeon is called **recycling** and can easily create bugs if you are not careful.

Notes: Remember that

```r
(x = c(1,2,4,5,1))
```

```out
[1] 1 2 4 5 1
```

Here is another example t
```r
y = c(1,2,3,4,5,6,7,8,9,10)
y[c(F,T)]
```

```out
[1]  2  4  6  8 10
```

Also, it is intersting to mention that recycling also happens when adding two vectors (but usually a warning is returned in this case). Here is an example:

```r
c(1,2,4) + c(6,0,9,10,13)
```

```out
[1]  7  2 13 11 15
Warning message:
In c(1, 2, 4) + c(6, 0, 9, 10, 13) :  longer object length is not a multiple of shorter object length
```

---

However, it is **NOT** possible to mix indices. For example, this code won't work:

```r
x[c(1,2,3,-4)]
```

```out
Error in x[c(1, 2, 3, -4)] :
  only 0's may be mixed with negative subscripts
```

but this code will work (but may not do what you want!):

```r
x[c(1,2,3,T)]
```

```out
[1] 1 2 4 1
```

```r
x[c(1,2,3,F)]
```

```out
[1] 1 2 4
```

Once again, the last example is surprising.., soake sure you understand what is going on here!

Notes: Remember that

```r
(x = c(1,2,4,5,1))
```

```out
[1] 1 2 4 5 1
```
