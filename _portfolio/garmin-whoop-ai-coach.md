---
title: "Garmin + WHOOP AI coach"
excerpt: "A local AI-powered coaching workflow that combines Garmin training history with WHOOP recovery data to generate analysis and training plans"
permalink: /portfolio/garmin-whoop-ai-coach
collection: portfolio
---

Garmin + WHOOP AI Coach is a personal fork of the original `garmin-ai-coach` project, adapted to combine Garmin Connect training data with WHOOP recovery data for deeper endurance training analysis. The goal of this project is to keep the full workflow local and practical: extract recent activity and performance metrics, overlay recovery signals such as sleep and HRV, and generate AI-assisted analysis and planning reports from the command line.

The repository is located [here](https://github.com/alexiscastel/Garmin-Whoop-AI-Coach).

## Example Generated Reports

The workflow produces self-contained HTML reports that can be reviewed directly in the browser. The example outputs below show both the athlete analysis view and the generated training plan.

<a href="{{ '/files/garmin-whoop-ai-coach/analysis.html' | relative_url }}">
  <img src="{{ '/files/garmin-whoop-ai-coach/thumbnail.png' | relative_url }}" alt="Garmin + WHOOP AI Coach generated report preview" style="max-width: 100%; height: auto; border: 1px solid #ddd; border-radius: 6px;" />
</a>

- [Open analysis report]({{ '/files/garmin-whoop-ai-coach/analysis.html' | relative_url }})
- [Open training plan]({{ '/files/garmin-whoop-ai-coach/planning.html' | relative_url }})

## Features

- Multi-source athlete data: Combines Garmin activities and training metrics with WHOOP recovery, sleep, resting heart rate, HRV, and day strain.
- AI-assisted analysis and planning: Uses a multi-step AI workflow to summarize data, analyze training trends, and generate structured training recommendations.
- Local report generation: Produces HTML, Markdown, and JSON outputs that can be reviewed without relying on a hosted web platform.
- Flexible model support: Works with multiple LLM providers, including OpenAI and Anthropic, with different operating modes for development, cost control, or higher-quality runs.

## Current Limitations

- WHOOP integration is currently focused on recovery-oriented signals and does not replace Garmin as the main source for workouts and long-term training data.
- The project is CLI-first, so it is powerful but less accessible than a dedicated web application.
- Full runs still depend on external APIs, OAuth setup, and model provider keys, which makes the initial configuration more involved than a standalone local tool.
