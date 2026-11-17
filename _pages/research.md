---
layout: single
title: Research
permalink: /research/
author_profile: true
description: "Research by Alexis Castel in nonlinear structural dynamics, computational mechanics, composite materials, adaptive machine learning, and aerospace simulation and validation."
---

My work connects computational mechanics with experiments: understanding where a model captures a structure's behavior, where it falls short, and what evidence is needed to improve it. My background in industrial simulation and testing informs both the methods I develop and the questions I investigate.

## Nonlinear shock and structural dynamics

I study how shock loads propagate through structures and how nonlinear behavior changes the response. Explicit finite element analysis provides a way to examine composite failure, contact, friction, preload, and the energy dissipated at mechanical interfaces. Damping identification and experimental correlation are essential to judging the resulting predictions.

The [AIAA SciTech 2025 composite shock paper]({{ '/publication/2025-01-10-Scitech-Shock' | relative_url }}) investigates shock propagation and composite fracture in a pressure-vessel shell and its test apparatus. It examines frictional losses with material damping deliberately removed to isolate the contribution of interfaces. The [ECSSMET 2026 ShockSat paper]({{ '/publication/2026-10-ECSSMET-ShockSat' | relative_url }}) extends the discussion to model conversion, damping identification, and test correlation on the NASA ShockSat benchmark. I contributed to that research and mentored Arun Prakash Ganapathy during manuscript preparation; the publication retains its actual author order.

## Machine learning for computational mechanics

I am interested in using physical understanding to guide data-driven simulation. Gaussian process surrogate models provide predictions with uncertainty estimates; Bayesian optimization and adaptive sampling can then select informative evaluations instead of relying only on a fixed grid.

The [ECSSMET 2024 paper on Bayesian optimization]({{ '/publication/2024-09-27-ECSSMET2024' | relative_url }}) applies this approach to frequency response curves and probabilistic estimation of overall response levels. A Matérn kernel and an adaptive frequency selection strategy concentrate evaluations where they improve the estimate. The examples used approximately five times fewer frequency evaluations. That result concerns the sampled response curves and their convergence criteria; it does not establish a universal reduction in total computation time.

An [earlier workshop presentation]({{ '/publication/2024-06-04-SCLV-Bayesian-Optimization' | relative_url }}) provides a complementary introduction.

## Mechanics of materials and composite structures

My doctoral research developed multilayer plate formulations for structures combining stiff composite layers with soft, dissipative materials. Transverse shear warping functions describe the variation of shear through the thickness, allowing efficient models to address configurations for which classical plate assumptions can be inadequate.

The work includes [a reformulation of Woodcock's multilayer model]({{ '/publication/2012-2-20-multilayer-anisotropic-plate-model' | relative_url }}), [warping functions derived from three-dimensional elasticity]({{ '/publication/2014-11-01-Two-multilayered-plate-models' | relative_url }}), and [complex power analysis of constrained-layer damping patches]({{ '/publication/2012-02-15-Complex-power-distribution-analysis' | relative_url }}). These studies connect strain energy, mechanical power, and energy dissipation with the behavior of individual layers.

My [doctoral dissertation]({{ '/publication/2013-11-21-Comportement-vibratoire-de-structures-composites' | relative_url }}) also investigated inverse identification of viscoelastic material properties using a genetic algorithm coupled to the mechanical model.

## Aerospace simulation and experimental validation

My professional work has included NASA Space Launch System payload environments, hybrid finite element–statistical energy analysis (FE-SEA), coupled structural-acoustic simulations, and correlation with acoustic tests. Public contributions include a [hybrid FE-SEA reduction method for launch vehicles]({{ '/publication/2017-06-30-hybrid-FE-SEA-model-reduction' | relative_url }}), [virtual reproduction of a reverberant test environment]({{ '/publication/2019-Virtual-Reproduction-Reverberant-Test-Environment' | relative_url }}), and [prediction-to-test correlation for the SWOT payload]({{ '/publication/2023-01-19-Correlation-Study-SWOT-Payload' | relative_url }}).

Direct-field acoustic testing raises questions about field diffuseness, microphone placement, and the structural response achieved by a particular source arrangement. My publications explore [virtual field characterization]({{ '/publication/2018-DFAT-Diffusivity' | relative_url }}), [simulation and test correlation]({{ '/publication/2019-Enhanced-DFAT-Simulation' | relative_url }}), [microphone placement]({{ '/publication/2026-02-11-Scitech-DFAT' | relative_url }}), and [the influence of field diffuseness]({{ '/publication/2026-10-ECSSMET-DFA-Diffuseness' | relative_url }}).

The [ECSSMET 2026 ascent-loading paper]({{ '/publication/2026-10-ECSSMET-Ascent-Loading' | relative_url }}) compares traditional boundary layer models with CFD-informed pressure loading and wavenumber-frequency representations for structural analysis.

## Future research interests

I would like to bring nonlinear explicit finite element simulation, adaptive machine learning, and experimental measurements together to improve predictions of shock transmission through mechanical interfaces. Questions of interest include how contact, friction, and preload affect energy transfer, and how targeted measurements and simulations can reduce uncertainty. These are future research interests.

See my [publications and presentations]({{ '/publications-talks/' | relative_url }}) for individual contributions and my [CV]({{ '/cv/' | relative_url }}) for education, appointments, teaching, and technical experience.
