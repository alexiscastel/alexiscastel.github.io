---
title: "Train counter"
excerpt: "Using Bayesian classifiers to detect and count trains using a microphone.<br/><img src='/images/train-500x300.jpg'>"
permalink: /portfolio/train-counter
collection: portfolio
---

Living just five houses away from a train track, the sound of train horns became so ingrained in daily life that it faded into the background. However, during the quieter days of the 2020 pandemic, I noticed a sudden reduction in the usual symphony of passing trains. This observation inspired me to build a system that could count the number of trains passing by without needing to actively listen for them.

<img src='/images/train-500x300.jpg'>"

Initially, I considered using a visual system to detect trains, but I soon realized that a sound-based approach would be more efficient. I developed a solution that uses a microphone, Python, and Bayesian classifiers to identify and count train sounds accurately. This setup identifies specific audio signals associated with train horns, recording them for potential future use in building a larger library of train sounds.
Future Developments:
- Train Direction Detection: Enhancing the system to determine the direction trains are traveling.
- Speed Estimation: Using the Doppler effect to estimate the speed of each passing train.
- Web Interface: Creating a small web UI to make real-time train data accessible remotely.
