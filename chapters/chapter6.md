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

In this chapter we will discuss the fundamentals of Machine Learning.

In the context of this course, we will overview the fundamentals of machine learning in order to use machine learning examples and context to teach programming. Thus, we will prefer an example-based approach rather than a formal mathematical approach to the subject. The mathematical notation will therefore be kept to a strict minimum in order to privilege a code-based and "hands-on"" approach.

`R` provides a considerable amount of implemented algorithms for prediction and  tools for machine-learning based tasks. The [`caret`]() (short for Classification And REgression Training)  package, written by Max Kuhn, provides a set of functions that attempt to streamline the process for creating predictive models. The package contains tools for:

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


<exercise id="2" title="What is Machine Learning?" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>


<exercise id="3" title="Measuring predictive performance" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>

<exercise id="4" title="Linear and Logistic regression" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>

<exercise id="5" title="Penalized regression" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>

<exercise id="6" title="Trees based methods" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>