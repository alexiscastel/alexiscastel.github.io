---
permalink: /
title: "Engineering, experiments, and the occasional muddy trail"
author_profile: true
description: "Alexis Castel, Ph.D.: mechanical engineer and researcher in computational mechanics, structural dynamics, aerospace engineering, and data-driven simulation."
featured_publications:
  - /publication/2026-10-ECSSMET-ShockSat
  - /publication/2024-09-27-ECSSMET2024
  - /publication/2025-01-10-Scitech-Shock
  - /publication/2012-2-20-multilayer-anisotropic-plate-model
  - /publication/2014-11-01-Two-multilayered-plate-models
redirect_from:
  - /about/
  - /about.html
---

I'm Alexis Castel, a mechanical engineer and researcher working at the intersection of computational mechanics, structural dynamics, aerospace engineering, and data-driven simulation. I combine numerical methods, experimental validation, and machine learning to understand and predict how complex engineering structures behave.

I currently work as a **Technical Expert in Aerospace Vibro-Acoustics at Keysight Technologies**. My research interests range from nonlinear shock propagation and composite structures to physics-guided machine learning and uncertainty quantification.

[Research]({{ '/research/' | relative_url }}) · [Publications]({{ '/publications-talks/' | relative_url }}) · [CV]({{ '/cv/' | relative_url }}) · [Google Scholar]({{ site.author.googlescholar }}) · [Professional contact on LinkedIn](https://www.linkedin.com/in/{{ site.author.linkedin }}/)

This site is part professional page, part project notebook. It has my CV, publications, and presentations, but also the personal projects that keep me curious: RC aircraft, composite repairs, 3D printing, sensors, small tools, outdoor trips, race notes, and other things I wanted to document before I forgot the details.

I spend a lot of time thinking about how things behave in the real world: how they vibrate, make noise, break, get repaired, or differ from the model that was supposed to predict them. Sometimes that turns into a paper or presentation. Sometimes it turns into a broken RC wing, a muddy trail race, or a small weekend experiment.

## Featured research

<ul class="featured-research">{% for publication_url in page.featured_publications %}{% assign publication = site.publications | where: "permalink", publication_url | first %}<li><a href="{{ publication.url | relative_url }}">{{ publication.title | escape }}</a> ({{ publication.publication_date | slice: 0, 4 }})</li>{% endfor %}</ul>

## Start here

- **[Research]({{ "/research/" | relative_url }})** — computational mechanics, nonlinear dynamics, materials, aerospace environments, and adaptive simulation.
- **[Publications & Talks]({{ '/publications-talks/' | relative_url }})** — public papers and presentations on vibro-acoustics, shock, vibration, simulation, test correlation, aerospace environments, composites, and probabilistic methods.
- **[Technical Notes]({{ '/technical-notes/' | relative_url }})** — engineering notes and explainers I want to keep public, general, and useful without getting into confidential work details.
- **[Projects]({{ '/projects/' | relative_url }})** — personal builds and small tools: speakers, train detection, training-data workflows, and RC aircraft scripts.
- **[Energy & Environment]({{ '/energy-environment/' | relative_url }})** — practical notes on household energy, electric vehicles, electricity markets, and environmental choices.
- **[RC / Composites]({{ '/rc-composites/' | relative_url }})** — flying, repairing, testing, and learning with lightweight aircraft and composite structures.
- **[Outdoors / Personal]({{ '/outdoors-personal/' | relative_url }})** — trail running, kayaking, adventure racing, training notes, and other things that keep life interesting.
- **[CV]({{ '/cv/' | relative_url }})** — education, research contributions, professional experience, teaching, publications, and service.

## Latest posts

{% for post in site.posts limit:5 %}
  {% include archive-single.html %}
{% endfor %}
