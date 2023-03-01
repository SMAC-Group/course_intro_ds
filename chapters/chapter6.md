---
title: 'Chapter 6: Introduction to Machine Learning'
description:
  'Understand the fundamentals of Machine Learning.'
prev: /chapter5
next: null
type: chapter
id: 6
---



<exercise id="1" title="General information">

In the context of this course, we will overview the fundamentals of machine learning in order to use machine learning examples and context to teach programming. Our objective is to provide an introduction to the essential concepts and the most commonly used algorithms as well as the ability to apply these predictive methods in an applied context. Thus, we will prefer an example-based and code-based approach rather than a formal mathematical approach to the subject. The mathematical notation will therefore be kept to a strict minimum in order to privilege a "hands-on"approach.

`R` provides a considerable amount of implemented algorithms for prediction and tools for machine-learning based tasks. However, these predictive algorithms are often implemented using different syntax, which makes the task of estimating and comparing the performance of these algorithms a bit cumbersome. The [`caret`](https://topepo.github.io/caret/) (short for Classification And REgression Training) package, written by [Max Kuhn](https://www.rstudio.com/authors/max-kuhn/), aims at simplifying this process and provides a set of functions that attempt to streamline the process for creating predictive models. The package contains tools for:

- data splitting
- pre-processing
- feature selection
- model tuning using resampling
- variable importance estimation
and other functionalities.

To get started, we recommend you to install the `caret` package with the following commands in `R`:

```R
install.packages("caret")
```

For your reference, we also list some of the interesting resources regarding machine learning as follows:

- [An Introduction to Statistical Learning](https://www.statlearning.com/)

- [The Elements of Statistical Learning](https://hastie.su.domains/ElemStatLearn/)

- [Hands-On Machine Learning with R](https://bradleyboehmke.github.io/HOML/)

- [Kaggle](https://www.kaggle.com/)

</exercise>


<exercise id="2" title="Introduction to Machine Learning" type = "slides">
<slides source="chapter6_01">
</slides>
</exercise>


<exercise id="3" title="Measuring predictive performance" type = "slides">

</exercise>

<exercise id="4" title="Linear and Logistic regression" type = "slides">

</exercise>

<exercise id="5" title="Penalized regression" type = "slides">

</exercise>

<exercise id="6" title="Trees based methods" type = "slides">

</exercise>

<exercise id="7" title="Introduction to Deep learning" type = "slides">

</exercise>