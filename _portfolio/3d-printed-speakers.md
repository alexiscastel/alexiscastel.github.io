---
title: "3D-Printed Speakers: Building, Testing, and Simulating"
excerpt: "I decided to print a nice looking pair of speakers from Thingiverse.com. Following this I thought simulating the speakers with VA One would be appropriate.<br/><img src='/images/Open-Speaker-450x600.jpg'>"
permalink: /portfolio/3d-printed-speakers
collection: portfolio
---



I decided to 3D print a sleek pair of speakers from [Thingiverse.com](https://www.thingiverse.com/), choosing [this model](https://www.thingiverse.com/thing:4750820). My curiosity was piqued—were these designed purely for aesthetics, or did they incorporate thoughtful acoustic engineering? To find out, I built them:

<div>
<a href="/images/Open-Speaker-450x600.jpg" target="_blank">
  <img src="/images/Open-Speaker-450x600.jpg" alt="Open Speaker Design" width="300">
</a>

<a href="/images/Speaker-Pair-600x450.jpg" target="_blank">
  <img src="/images/Speaker-Pair-600x450.jpg" alt="Speaker Pair" width="300">
</a>
</div>

### Experimental Characterization

To begin, I opted for an experimental approach and measured the speakers' frequency response using pink noise and the AudioTool app on my phone. Although these measurements were taken in my office (far from anechoic), they revealed some interesting insights:

<a href="/images/AudioTool.jpg" target="_blank">
  <img src="/images/AudioTool.jpg" alt="AudioTool Measurement Screenshot" width="300">
</a>

Despite the less-than-ideal conditions (including visible room modes), the small 4-inch drivers performed surprisingly well, with no significant roll-off until around 100 Hz. This was impressive! Whether due to careful engineering or sheer luck, it motivated me to delve deeper with a more analytical approach.

### Simulation with VA One

I simulated the speakers using VA One, employing a coupled Finite Element Model (FEM) and Boundary Element Model (BEM). The simulation covered a frequency range from 62.5 Hz to 500 Hz, solved in 1/12th octave bands.

- **Finite Element Model Details:** The speaker was represented as a flat surface with a single rigid body mode. A fixed point provided mechanical impedance, based on the driver’s spec sheet to match the suspended mass and first resonant frequency.

-  **Boundary Element Model Details:** All surfaces besides the speaker are modeled as rigid. The speaker is considered to be floating in an infinite space.

The simulation results highlighted the impact of the horn design, particularly at low frequencies. A notable effect was observed around 125 Hz, showing the horn’s contribution to performance as most of the sound pressure is coming out of it.
<img src='/images/Speaker_125Hz.png' alt='VA One contour plot response at 125 Hz.'>
<img src='/images/Speaker_280Hz.png' alt='VA One contour plot response at 280 Hz.'>

More thorough investigation and measurements may better quantify the speaker's performance. For now, I am now using these as my daily speakers for my workstation.
