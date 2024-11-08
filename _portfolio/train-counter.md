---
title: "Train counter"
excerpt: "Using Bayesian classifiers to detect and count trains using a microphone.<br/><img src='/images/train-500x300.jpg'>"
permalink: /portfolio/train-counter
collection: portfolio
---

When living as close as 5 houses from the train track, train horn is part of your daily life. So much so that, after a while you don't notice it. During the pandemic in 2020, we suddenly noted how we didn't hear as many trains passing by. That's when I got the idea to make a system to count trains from my house. The first thing that came to mind was a visual system of sorts, however, I quickly found that it was easier to use a microphone and Bayesian classifiers to get there.
The whole thing runs in Python. Selected audio signals get saves to pentially be added to the library of train sounds.

Future developments:
- counting the train direction
- evaluating the train speed using the doppler effect
- Running a small web UI
