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

## Model training report:

### Label Distribution
The label distribution tells us how many examples we have for each class in the dataset:
- **Class 0 ("BG" - Background Noise):** 105 samples
- **Class 1 ("Train"):** 130 samples

This distribution is reasonably balanced, which is a good sign as it reduces the likelihood of the model being biased toward one class.

### Classification Report
The classification report gives performance metrics for each class:
- **Precision**: The proportion of positive predictions that are correct. A high precision for each class (0.91 for "BG" and 0.94 for "Train") means the model is generally making accurate predictions.
- **Recall**: The proportion of actual positives that are correctly predicted. Here, recall is also high (0.91 for "BG" and 0.94 for "Train"), indicating that the model successfully identifies most of the actual samples in each class.
- **F1-Score**: The harmonic mean of precision and recall. This score balances precision and recall, so an F1-score around 0.91–0.94 for each class means the model has a good balance of correctly identifying true positives and avoiding false positives.

- **Accuracy**: 0.93 (or 93%), showing that the model correctly classified 93% of the samples in the test set.

- **Macro Average**: The unweighted average across classes. This indicates the model is performing consistently across both classes, without heavily favoring one class over the other.
  
- **Weighted Average**: The average that accounts for the class distribution. With high weighted average scores, the model performs well even considering the slightly larger number of "Train" samples.

### Overall Interpretation
These metrics suggest that the model is quite effective at distinguishing between "BG" and "Train" sounds in the test set. The high precision, recall, and F1-scores indicate that it is correctly identifying both classes with minimal errors.


