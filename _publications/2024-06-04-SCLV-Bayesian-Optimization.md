---
title: Bayesian Optimization for Rapid Probabilistic Estimations of Overall Level on Frequency Response Models
collection: publications
last_modified_at: 2026-11-16
category: presentations
permalink: /publication/2024-06-04-SCLV-Bayesian-Optimization
date: '2024-01-01'
venue: SCLV Dynamics Workshop 2024
authors:
- Alexis Castel
- Rabah Hadjit
- Bryce Gardner
publication_type: Workshop presentation
publication_date: '2024'
metadata_sources:
- /files/SCLV_2024_Bayesian_optimization.pdf
topics:
- Machine Learning
- Bayesian Optimization
description: Traditionally, frequency response models are solved using either a constant bandwidth or an n-th octave
  band. For both vibration and acoustic analyses, it is commonly known that one is expected to solve a model with
  a…
slidesurl: /files/SCLV_2024_Bayesian_optimization.pdf
---
Traditionally, frequency response models are solved using either a constant bandwidth or an n-th octave band. For both vibration and acoustic analyses, it is commonly known that one is expected to solve a model with a sufficiently narrow band to ensure the overall response of the mechanical system is accurately captured. However, when specifically capturing the overall level, one needs to ensure the highest values of the response curve are correctly captured while a controlled amount of uncertainty can be accepted when estimating the lowest response point of the curve.

We propose a Bayesian optimization technique designed to capture the overall level using a Matern kernel. The proposed method enables estimations of the overall levels of a response curve using approximately five times fewer frequency points while providing a given uncertainty on the overall level.
