---
layout: post
title: "My EV Gets 96 MPGe—and Costs the Same as a 52-MPG Gas Car"
date: 2026-08-06
categories: [sustainability, electric-vehicles]
tags: [Chevrolet Equinox EV, MPGe, EV charging, electricity, energy efficiency]
---

At the end of April 2025, we bought a Chevrolet Equinox EV. Since then, we have driven it about **15,000 miles**.

We have used public chargers occasionally, but not very much. My best estimate is that approximately **1,200 of those miles** came from public charging. That leaves about **13,800 miles charged at home**.

Fortunately, I have an Emporia energy monitor installed in the house. The garage circuit is almost entirely the EV charger, which gave me a chance to answer a deceptively simple question:

> How much electricity does the car actually use—and what does that cost per mile?

The answer led me to a distinction I had never fully appreciated: **MPGe measures energy efficiency, not fuel cost**.

## Measuring electricity at the wall

From May 2025 through the beginning of August 2026, the garage circuit used approximately **4,842 kWh**.

| Measurement | Estimate |
|---|---:|
| Total distance driven | 15,000 miles |
| Miles attributed to public charging | 1,200 miles |
| Miles charged at home | 13,800 miles |
| Electricity measured on the garage circuit | 4,842 kWh |

Dividing the home-charged miles by the electricity measured at the panel gives:

\[
\frac{13,800\text{ miles}}{4,842\text{ kWh}}
= 2.85\text{ miles/kWh}
\]

Equivalently, the car uses approximately:

- **0.351 kWh per mile**;
- **35.1 kWh per 100 miles**; or
- **2.85 miles per kWh**.

This is a *wall-to-road* measurement. It includes electricity that never appears as motion: losses in the charging cable and onboard charger, heat, battery conditioning, coolant pumps, computers, and other overhead. It may also include a small amount of genuine non-EV garage consumption.

That makes it more useful for calculating my electric bill than the efficiency number displayed by the car.

## The dashboard may be telling a different truth

Chevrolet describes the Equinox EV's Energy App history screen as showing miles per kWh and “how efficiently you've driven.” Its detailed screen separates energy used for driving behavior and accessories, climate control, and battery conditioning.[^chevy-energy]

What Chevrolet's public description does **not** say is that the dashboard number represents all electricity drawn from the house. That distinction matters.

A vehicle can accurately report how efficiently it used energy available inside the car while omitting some energy lost before it reached the battery. The dashboard is useful for comparing trips, seasons, routes, and driving styles. The Emporia monitor is better for answering:

> How much electricity did I actually buy to drive those miles?

For example, if the dashboard reports **3.3 miles/kWh** while the wall measurement is **2.85 miles/kWh**, the difference corresponds to roughly **14% of the electricity drawn from the wall**. That is not necessarily deception; it is a different measurement boundary. But it can make the displayed efficiency look more flattering than the household electric bill.

## Converting the result to MPGe

The EPA defines one gallon of gasoline equivalent as **33.7 kWh of energy**. An EV that travels 100 miles using 33.7 kWh therefore receives a rating of 100 MPGe.[^epa-testing]

Using my measured wall efficiency:

\[
2.85\text{ miles/kWh}\times 33.7\text{ kWh/gallon-equivalent}
\approx 96\text{ MPGe}
\]

That result is reassuring. The 2024 Equinox EV was rated at **108 MPGe combined with front-wheel drive** and **96 MPGe combined with all-wheel drive**.[^fueleconomy-fwd][^awd-rating]

The EPA number is especially relevant here because EPA says its MPGe values include Level 2 charging losses from the charging equipment and onboard charger. In other words, EPA deliberately moves the measurement point to the wall.[^epa-testing]

My Emporia result is therefore much more directly comparable to EPA MPGe than a dashboard number that may be calculated within the vehicle.

## Why 96 MPGe does not mean the cost of a 96-MPG gasoline car

This was the surprising part.

My July 2026 electric bill was **$188.61 for 881 kWh**. Of that, $6.50 was a fixed monthly customer charge that I would pay even without the EV. Excluding that fixed charge gives an incremental electricity price of approximately:

\[
\frac{\$188.61-\$6.50}{881\text{ kWh}}
\approx \$0.207/\text{kWh}
\]

At 0.351 kWh per mile, the Equinox costs approximately:

\[
0.351\text{ kWh/mile}\times \$0.207/\text{kWh}
\approx \$0.0725/\text{mile}
\]

That is about:

- **7.3 cents per mile**;
- **$7.25 per 100 miles**; or
- roughly **$1,000 for 13,800 home-charged miles** at the current rate.

Now compare that with gasoline at **$3.80 per gallon**:

\[
\frac{\$3.80/\text{gallon}}{\$0.0725/\text{mile}}
\approx 52\text{ miles/gallon}
\]

So the same car can simultaneously be:

- **96 MPGe in energy-efficiency terms**; and
- equivalent to approximately a **52-MPG gasoline car in fuel-cost terms**.

Both statements are correct.

## Where the apparent factor of two comes from

MPGe compares equal quantities of **energy**. Cost-equivalent MPG compares equal quantities of **money**.

The EPA's gallon-equivalent contains 33.7 kWh. At my current incremental electricity price, that much electricity costs:

\[
33.7\text{ kWh}\times \$0.207/\text{kWh}
\approx \$6.97
\]

But my assumed gallon of gasoline costs only $3.80.

The electric “gallon-equivalent” therefore costs about **1.8 times as much** as an actual gallon of gasoline at these prices. Applying that price ratio to 96 MPGe produces roughly 52 cost-equivalent MPG.

For the two numbers to be equal, electricity would need to cost approximately:

\[
\frac{\$3.80}{33.7\text{ kWh}}
\approx \$0.113/\text{kWh}
\]

At around **11.3 cents per kWh all-in**, a 96-MPGe EV would also have approximately the fuel cost of a 96-MPG gasoline car. My current marginal household rate is closer to 20.7 cents.

## Does that make the EV uneconomical?

No—but it changes how I describe the savings.

A gasoline vehicle getting 52 MPG would still be exceptionally efficient, especially compared with a similarly sized crossover. The Equinox also avoids oil changes and has fewer routine powertrain maintenance requirements. Conversely, this calculation does not include the purchase price, insurance, tires, depreciation, public fast-charging prices, or the cost of installing home charging equipment.

The comparison also changes whenever electricity or gasoline prices change. Charging from lower-cost overnight electricity, home solar, or a less expensive utility territory would improve the EV's cost advantage. Expensive public fast charging could reduce or eliminate it.

There is also a separate environmental question. MPGe says nothing about the carbon intensity of the electricity supply, just as MPG says nothing about the emissions involved in extracting and refining gasoline. Those require a different analysis.

## What I learned

Three measurements that sound similar answer three different questions:

1. **The car's miles-per-kWh display** tells me how efficiently the vehicle says it drove.
2. **Wall-measured miles per kWh** tells me how much electricity I actually bought.
3. **MPGe** compares the energy consumed with the energy contained in gasoline—but does not compare prices.

For our Equinox EV, my best current estimates are:

| Metric | Result |
|---|---:|
| Wall efficiency | **2.85 miles/kWh** |
| Electricity consumption | **35.1 kWh/100 miles** |
| Energy-equivalent efficiency | **96 MPGe** |
| Electricity cost | **7.3 cents/mile** |
| Cost equivalent at $3.80/gallon | **52 MPG** |

The EV is using energy very efficiently. It is also not saving quite as much money per mile as the 96-MPGe label initially made me imagine.

That is not a flaw in MPGe. It is a reminder to ask what a number is actually measuring.

---

### Notes and limitations

The garage values were digitized from monthly Emporia charts. The April 2025 acquisition month was excluded, while August 2026 was only partially complete. The 1,200 public-charging miles are an estimate. The garage circuit is overwhelmingly EV charging but may contain minor additional loads. The cost calculation applies the rate structure from my latest bill to the full measured period; it is therefore a current-rate estimate rather than a reconstruction of every historical bill.

[^epa-testing]: [U.S. EPA, “Fuel Economy and EV Range Testing”](https://www.epa.gov/greenvehicles/fuel-economy-and-ev-range-testing). EPA explains the 33.7-kWh gallon equivalent and states that MPGe includes Level 2 charging losses.
[^chevy-energy]: [Chevrolet, “In-Vehicle Energy App”](https://www.chevrolet.com/support/vehicle/ev-charging/battery/energy-app).
[^fueleconomy-fwd]: [FuelEconomy.gov, 2024 Chevrolet Equinox EV FWD](https://www.fueleconomy.gov/m/m.do?action=getMenuOptions&id=38524&make=Chevrolet&model=Equinox+EV+FWD&year=2024).
[^awd-rating]: [Car and Driver, 2024 Chevrolet Equinox EV test](https://www.caranddriver.com/reviews/a60926272/2024-chevrolet-equinox-ev-test/), reporting the EPA combined rating for the tested AWD model.
