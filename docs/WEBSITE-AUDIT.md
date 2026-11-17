# Website and publication audit

Prepared November 16, 2026. Repository: `alexiscastel/alexiscastel.github.io`; baseline commit `b83e99b`. This report records the changes and validation completed during the local audit. No deployment was performed as part of the audit. The checkout was clean when work began.

The scientific and structural improvements are implemented. **Direct inspection of the three ECSSMET 2026 papers remains incomplete:** DLR's record was readable, but its 87 MB proceedings PDF exceeded the web reader's limit and the cloud environment blocked the direct download. The three records therefore retain the author lists, titles, pages, and summaries supplied in the request, with explicit review notes. Their Google Scholar citation tags and scholarly JSON-LD are withheld until those details can be verified. No paper extracts or full proceedings PDF were added to the repository.

## 1. Changes implemented

- Retained Jekyll, AcademicPages/Minimal Mistakes, the existing visual identity, personal projects, technical notes, outdoors and energy sections, all existing publication permalinks, existing publication PDFs, and the homepage's latest personal posts.
- Audited configuration, collections, all 25 existing publication records, layouts/includes, navigation, assets, source content, local build scripts, legacy generators, and repository workflow files. There was no existing checked-in deployment workflow. No hosting or deployment settings were changed.
- Made `_publications/` the authoritative bibliography. Added structured author lists, publication types, dates with explicit precision, identifiers, evidence references, topic lists, and review notes. Removed manually maintained citation strings from the collection. Shared Liquid includes now generate citations on the Publications page, CV, and individual pages.
- Organized the bibliography into four requested categories, with descending dates within each: 4 peer-reviewed journal articles, 18 conference/technical contributions (including one explicitly labeled conference abstract), 6 workshop presentations, and 1 doctoral dissertation. No general peer-review claim is made for conference contributions.
- Added the Research page, a Research navigation item, featured research on the homepage, and direct access to Research, Publications, CV, Google Scholar, and the already public LinkedIn contact route. No new private email address was published.
- Reorganized the CV into research interests, education, selected contributions, appointments, teaching/mentoring, publications, honors, service, and methods. Preserved all previous industrial roles and their dates. Added the supplied teaching, NASA training, mentorship, ZIN award, former AIAA membership, and former school-president experience without invented dates, metrics, or appointments.
- Added citation metadata and scholarly JSON-LD for sufficiently supported paper/dissertation records; excluded presentations and the conference abstract. Used the formal journal year instead of the preprint year. Kept proceedings DOIs separate from individual article DOIs. Ordinary page titles, canonical URLs, and descriptions remain available for every public record, including records awaiting verification.
- Enabled the already installed `jekyll-redirect-from` plugin: existing configured aliases now generate actual redirects. Added a readable sitemap page to repair the footer link; retained the generated XML sitemap and feed.
- Improved keyboard navigation, skip links, accessible names and expansion state for menus, Escape behavior, heading hierarchy, image descriptions, text/link contrast, reduced-motion behavior, and navigation without JavaScript. Fixed the mobile overflow in the electricity-supplier table with a labeled, keyboard-scrollable region.
- Replaced hardcoded production-host internal assets/navigation with base-path-relative URLs so local previews load the current local CSS, images, and JavaScript. Canonical, social-sharing, and scholarly URLs remain absolute.
- Restored the missing coaching-project thumbnail using a screenshot of the already public example report. Corrected the EV post's FuelEconomy.gov link to the actual Equinox EV record. Normalized theme/footer links to HTTPS and the current theme URL. Removed the obsolete global polyfill request and loaded MathJax only for the post that uses equations.
- Added a metadata validator, generated citation/order checks, an HTML/internal-link/heading validator, and a pull-request/manual validation workflow with read-only permissions and no deployment step. Added a publication maintenance guide and identified the legacy notebooks/TSV files as historical examples rather than a second bibliography.

## 2. Publication metadata corrected or clarified

All existing records gained one structured author list and a contribution type. The companion CSV contains each complete current record, source references, URLs, and review notes.

| Publication | Correction or clarification | Evidence / limits |
|---|---|---|
| Complex power distribution analysis… | Four authors in order: Alexis Castel, Alexandre Loredo, Ali El Hafidi, B. Martin. JSV **331(11), 2485–2498 (2012)**; DOI **10.1016/j.jsv.2012.01.020**. Journal issue month is May. | Original PDF; journal reference in the 2013 manuscript; indexed publisher record. B. Martin's initials were preserved rather than expanded without evidence. |
| A multilayer anisotropic plate model… Woodcock's work | Formal year **2013**, JSV **332(1), 102–125**; DOI **10.1016/j.jsv.2012.07.033**. Preserved the original `/publication/2012-2-20-multilayer-anisotropic-plate-model` URL. | [Author-deposited arXiv record](https://arxiv.org/abs/1212.5430) confirms authors, final journal reference, and DOI; local original PDF. Online/preprint dates are not used as the formal journal year. |
| Vibroacoustic simulation… low Young's modulus viscoelastic materials | Full source-order list of four authors, including **S. Torres Mañueco**; conference paper, DYNACOMP 2012. | Original paper PDF. Full given name of S. Torres Mañueco, exact conference date, and proceedings pagination remain unverified. |
| A comparison between models… heterogeneous multilayer composite plates | Identified the contribution as **ICCS17, abstract 3673**, with Castel, Loredo, El Hafidi in order. Explicitly labeled **Conference abstract**, with the longer HAL manuscript separately described. Preserved the old DYNACOMP permalink. | Exact title, authors, and abstract number appear in the indexed [ICCS17 book of abstracts](https://wolszczak.pollub.pl/artykuly/2013-ICCS17_abstracts.pdf). The local PDF identifies July 31, 2013 as the HAL preprint deposit. A separate DYNACOMP 2013 appearance and a full ICCS17 proceedings paper remain unconfirmed; this discrepancy is explained on the page. |
| Doctoral dissertation | **Doctoral dissertation**, Université de Bourgogne, École Doctorale SPIM, defended **November 21, 2013**. Preserved the French title and existing URL; provided an English research summary and translation of the title. | Original dissertation title/defense pages. Retained the supplied [institutional repository link](https://theses.hal.science/tel-00983378), which could not be read through the available web tool. |
| Two multilayered plate models… | **Composite Structures 117, 382–395 (November 2014)**; Loredo then Castel; DOI **10.1016/j.compstruct.2014.07.001**. Added a verified arXiv author-manuscript PDF route in place of the bot-protected HAL PDF route. | [Author-deposited record](https://arxiv.org/abs/1311.1463) and [PDF](https://arxiv.org/pdf/1311.1463) independently confirm title, authors, journal reference, and DOI. |
| A hybrid FE-SEA model reduction method… | Removed spurious “America, E.N.” and “Masini, V.A.” authors, which came from affiliations. Correct list: **Alexis Castel, Rabah Hadjit, Massimiliano Calloni**. Added DOI **10.13009/EUCASS2017-176** and paper 176. | [Official EUCASS paper](https://www.eucass.eu/doi/EUCASS2017-176.pdf) and existing local PDF. |
| A Novel Approach for High Frequency Interior Noise Prediction | Corrected **Salvekar**, not Sakvekar; four authors in order. SAE technical paper **2018-01-0148**, published **April 3, 2018**; DOI **10.4271/2018-01-0148**. | [Official SAE record](https://saemobilus.sae.org/papers/a-novel-approach-high-frequency-interior-noise-prediction-2018-01-0148) and original PDF. |
| Acoustic Simulation of Multilayered Noise Control Treatment with Porous Material | Moved from journal articles to **SAE technical paper**, **2018-01-0144**, DOI **10.4271/2018-01-0144**. Added all five authors in order, including **Roger Michna**. Removed the malformed trailing quote from the legacy citation by replacing it with generated metadata. | [Official SAE record](https://saemobilus.sae.org/papers/acoustic-simulation-multilayered-noise-control-treatment-porous-material-2018-01-0144) and original PDF. |
| Simulation Methodology for Pass-by Noise Optimization | Four authors in source order. Added JSAE document **20185330**, presentation **330**. | Original JSAE paper. Exact day and any separately registered DOI were not inferred. |
| Investigating Diffusivity of Virtual Diffuse Field Acoustic Test… | Added all five authors: Castel, Gardner, Musser, Medeiros, Alimonti. Labeled conference paper, ECSSMET 2018. | Original paper title page. No unsupported individual DOI or exact publication day added. |
| Enhanced DFAT Simulation: Optimization and Correlation Study | Added all six slide-title-page authors in order; classified as workshop presentation and labeled its download as a presentation PDF. | Original slides, including the June 4–6, 2019 workshop identification. Publication date is represented at month precision because an individual presentation day was not verified. |
| Virtual Reproduction of a Reverberant Test Environment | Added “of a” to match the title page and all four authors: Castel, Godfrey, Paras, Cleary. Classified as workshop presentation; added a concise summary from the slides. | Original slides. Month precision retained for the workshop period. |
| A Pass-By Noise Prediction Method… | Replaced **2012** with **2019**; added all five authors in order, journal **1(1), 120–125**, paper **2019-26-0188**, DOI **10.4271/2019-26-0188**. Official record publication date is **January 9, 2019**. | [Official SAE journal record](https://saemobilus.sae.org/articles/a-pass-noise-prediction-method-based-source-path-receiver-approach-combining-simulation-test-data-2019-26-0188). The local PDF uses a technical-paper citation, while the current publisher record explicitly identifies the journal article; the publisher's final classification is used. |
| Towards Certification by Simulation… eVTOL Application | Corrected year to **2022**, preserved the 78th Forum venue, removed stray punctuation, and used all three authors in order. Added the official VFS DOI **10.4050/F-0078-2022-17586**. | [Official VFS proceedings record](https://proceedings.vtol.org/78/modeling-and-simulation/towards-certification-by-simulation-with-model-based-continuous-engineering-processes-showcased-on-evtol-application) and local paper. A [SAE mirror](https://saemobilus.sae.org/papers/towards-certification-simulation-model-based-continuous-engineering-processes-showcased-evtol-application-f-0078-2022-1242) lists a different DOI ending **1242**; that registration discrepancy is flagged rather than silently merged. |
| Correlation Study of SWOT Payload Acoustic Prediction and Test | Five full names in source order; retained **AIAA 2023-1520**. | Original manuscript. DOI and exact publication day remain unverified and were omitted. |
| Strain Energy Proportional Damping for Modal Frequency Response Models | Structured author order **Castel, B. K. Gardner, Calloni**, consistent title capitalization, and conference-paper classification. | Original paper. No unsupported DOI, pages, or exact day added. |
| H-Matrix BEM application and validation for space habitat | Removed the unrelated JSV citation. Correct **NOISE-CON 2023**, authors **Arindam Ghosh, Alexis Castel, Weimin Thor, Rajesh Arjunan**, identifier **NC_2023_0123**, DOI **10.3397/NC_2023_0123**. Relabeled the Ingenta landing page as a publication record, not a downloadable PDF. | [Official proceedings table of contents](https://www.proceedings.com/content/069/069415webtoc.pdf). Series volume/issue/page range remain unverified. |
| Bayesian Optimization… SCLV 2024 | Preserved the three-author workshop contribution as a separate presentation with a presentation PDF. | Original slides: Castel, Hadjit, Gardner. |
| Advanced Acoustic Simulation… NOISE-CON 2024 | Used the PDF title including **“Aircraft and Spacecraft”** and corrected the source order to **Castel, Weston, Deshpande, Gardner, Hadjit**. Kept the existing misleading `/publication/2018-07-14-acoustic-simulation-aircraft-test-environments` URL to preserve incoming links. | Original paper PDF. Its title/author order differ from the old citation; the final publisher record, DOI, and pages remain unconfirmed. |
| Bayesian Optimization… ECSSMET 2024 | Added the complete four-author list, including **Alexander Schepelmann**. Preserved the distinct SCLV presentation authors. Research/CV descriptions limit the approximately fivefold result to the number of frequency evaluations on example response curves. | Original ECSSMET paper and SCLV slides, independently compared. |
| Simulation of Shock Propagation and Composite Fracture… | Added full author names **Alexis Castel and Alain Trameçon**, DOI **10.2514/6.2025-2665**, and identifier **AIAA 2025-2665**. | DOI, title, and names appear on the original publisher-formatted PDF. No exact individual publication day was inferred from the event range. |
| MIMO Control for DFAT Testing Equivalence… | Labeled as workshop presentation, retained original author order and initials, and avoided attaching the unrelated shock-simulation slide deck. | Existing citation only. Complete author-name formatting and a matching official program/PDF remain unresolved. |
| The Importance of Microphone Placement… DFA Testing – A Case Study | Formal year corrected to **2026**, paper **AIAA 2026-0420**. Kept the supplied title and existing author order pending verification. | Year/paper correction supplied by the user. AIAA returned 403; article DOI, precise date, title punctuation, and complete author-name formatting could not be independently confirmed. Citation tags/JSON-LD are withheld. |
| Launch Vehicle Ascent Phase Loading… SCLV 2026 | Preserved the **single-author Alexis Castel** presentation and its original URL; matched “CFD-Based” to the slide title and cross-linked the later ECSSMET paper without changing the workshop author list. | Original slide deck. |

Exact dates are emitted only to their supported precision. The `date` field sometimes uses the first day of the known year/month solely for Jekyll sorting; it is not exported as a fictional publication day. Formal citations use `publication_date`. Unavailable issue numbers, pagination, identifiers, or DOIs were omitted rather than filled by analogy to other publications.

## 3. New publication pages

Three ECSSMET 2026 records were added, linked to the [DLR proceedings record](https://elib.dlr.de/227675/). The record confirms **October 2026**, proceedings DOI **10.57965/y8xk-fy02**, and publication as a book of papers. That DOI is consistently labeled as a proceedings DOI, never an article DOI. DLR marks the proceedings record “Refereed publication: No,” so the site makes no peer-review claim for these papers.

| New page | Author order retained | Pages | Verification status |
|---|---|---|---|
| `2026-10-ECSSMET-Ascent-Loading.md` — Launch Vehicle Ascent Phase Loading: Comparing Traditional and CFD-Based Approaches | Alexis Castel; Arun Prakash Ganapathy | 906–914 | Individual metadata/summary supplied by user; full-PDF verification pending. Cross-linked with the existing single-author SCLV presentation. |
| `2026-10-ECSSMET-ShockSat.md` — Shock Response Prediction of a Spacecraft Structure Using Explicit Finite Element Analysis: Model Conversion, Damping Identification, and Test Correlation | Arun Prakash Ganapathy; Alexis Castel; Simon Martin | 794–803 | Individual metadata/summary supplied by user; full-PDF verification pending. Author order unchanged. |
| `2026-10-ECSSMET-DFA-Diffuseness.md` — The Importance of the Degree of Diffuseness of the Achieved Acoustic Field on the Vibroacoustic Response of a Test Article from Direct Field Acoustic Testing | Marcos A. Underwood; Alfred W. Mayne III; Alexis Castel | 468–478 | Exact title and name formatting still require full-PDF verification. |

One additional presentation page restores access to an existing, previously unlisted public deck: **Advancing Shock Simulation: Applying the Smallwood Algorithm to Explicit Finite Element Models**, Alexis Castel, SCLV 2025. Its title, single-author attribution, year, and summary come from `files/SCLV_2025_Advanced Shock Simulation.pdf`. It is clearly a workshop presentation, separate from both the MIMO presentation and the later ShockSat paper.

No proceedings extracts were hosted because the PDF could not be inspected and redistribution permission was not established. Existing public PDFs were preserved unchanged.

## 4. Created and modified files

The file list below is generated from the local working tree. All pre-existing publication URLs remain unchanged. No existing source file was deleted. New user-facing images are limited to the coaching-project thumbnail.

- `M` `README.md`
- `M` `_config.yml`
- `M` `_data/navigation.yml`
- `M` `_includes/archive-single-cv.html`
- `M` `_includes/archive-single.html`
- `M` `_includes/author-profile.html`
- `M` `_includes/base_path`
- `M` `_includes/footer.html`
- `M` `_includes/footer/custom.html`
- `M` `_includes/head.html`
- `M` `_includes/head/custom.html`
- `M` `_includes/masthead.html`
- `M` `_includes/seo.html`
- `M` `_includes/social-share.html`
- `M` `_layouts/archive-taxonomy.html`
- `M` `_layouts/archive.html`
- `M` `_layouts/default.html`
- `M` `_layouts/single.html`
- `M` `_layouts/splash.html`
- `M` `_layouts/talk.html`
- `M` `_pages/about.md`
- `M` `_pages/cv.md`
- `M` `_pages/portfolio.html`
- `M` `_pages/publications.html`
- `M` `_portfolio/3d-printed-speakers.md`
- `M` `_portfolio/train-counter.md`
- `M` `_posts/2026-08-01-equinox-ev-mpge-vs-cost-blog-post.md`
- `M` `_posts/2026-08-06-ohio-green-electricity-nopec-blog-post.md`
- `M` `_publications/2012-02-15-Complex-power-distribution-analysis.md`
- `M` `_publications/2012-02-20-multilayer-anisotropic-plate-model.md`
- `M` `_publications/2012-04-22-Dynacomp.md`
- `M` `_publications/2013-07-31-Dynacomp.md`
- `M` `_publications/2013-11-21-Comportement-vibratoire-de-structures-composites.md`
- `M` `_publications/2014-11-01-Two-multilayered-plate-models.md`
- `M` `_publications/2017-06-30-hybrid-FE-SEA-model-reduction.md`
- `M` `_publications/2018-01-01-Novel-Approach-High-Frequency-Interior-Noise-Prediction.md`
- `M` `_publications/2018-04-03-Multilayered-Noise-Control-Treatment.md`
- `M` `_publications/2018-05-01-Pass-by-Noise-Optimization.md`
- `M` `_publications/2018-DFAT-Diffusivity.md`
- `M` `_publications/2019-06-01-Enhanced-DFAT-Simulation.md`
- `M` `_publications/2019-06-01-Virtual-Reproduction-Reverberant-Test-Environment.md`
- `M` `_publications/2019-09-01-Pass-by-Noise-Predictions.md`
- `M` `_publications/2022-05-12-Towards-Certification-MBSE.md`
- `M` `_publications/2023-01-19-Correlation-Study-SWOT-Payload.md`
- `M` `_publications/2023-05-16-Strain-Energy-Proportional-Damping-Modal-Frequency-Response-Models.md`
- `M` `_publications/2023-05-25-H-Matrix-BEM-application-validation-space-habitat.md`
- `M` `_publications/2024-06-04-SCLV-Bayesian-Optimization.md`
- `M` `_publications/2024-07-14-acoustic-simulation-aircraft-test-environments.md`
- `M` `_publications/2024-09-27-ECSSMET2024.md`
- `M` `_publications/2025-01-10-Scitech-Shock.md`
- `M` `_publications/2025-06-03-SCLV-MIMO-Control-DFAT-Testing-Equivalence.md`
- `M` `_publications/2026-02-11-Scitech-DFAT.md`
- `M` `_publications/2026-06-02-SCLV-Launch-Vehicle-Ascent-Phase-Loading.md`
- `M` `_sass/_buttons.scss`
- `M` `_sass/_variables.scss`
- `M` `assets/css/main.scss`
- `M` `assets/js/_main.js`
- `M` `assets/js/main.min.js`
- `M` `assets/js/plugins/jquery.greedy-navigation.js`
- `M` `markdown_generator/readme.md`
- `M` `scripts/jekyll-local.sh`
- `??` `.github/workflows/validate.yml`
- `??` `_includes/publication-authors.html`
- `??` `_includes/publication-citation.html`
- `??` `_includes/publication-entry.html`
- `??` `_includes/publication-head.html`
- `??` `_includes/publication-links.html`
- `??` `_includes/publication-list.html`
- `??` `_layouts/publication.html`
- `??` `_pages/research.md`
- `??` `_pages/sitemap.html`
- `??` `_publications/2025-SCLV-Advancing-Shock-Simulation.md`
- `??` `_publications/2026-10-ECSSMET-Ascent-Loading.md`
- `??` `_publications/2026-10-ECSSMET-DFA-Diffuseness.md`
- `??` `_publications/2026-10-ECSSMET-ShockSat.md`
- `??` `_sass/_research.scss`
- `??` `docs/PUBLICATIONS.md`
- `??` `docs/WEBSITE-AUDIT.md`
- `??` `files/garmin-whoop-ai-coach/thumbnail.png`
- `??` `scripts/validate-publications.rb`
- `??` `scripts/validate-site.py`

## 5. Validation and practical limits

Tested the local working tree based on `b83e99b`, using Ruby 3.2 and the repository's locked Bundler 2.4.19 / GitHub Pages / Jekyll 3.9.3 dependencies.

| Check | Result |
|---|---|
| `PATH=/workspace/shared/ruby-3.2/bin:$PATH ./scripts/jekyll-local.sh validate` | Passed: strict-front-matter Jekyll build; 29 publication records; 67 generated HTML pages; 0 schema/citation/internal-link/heading errors. The validator explicitly reports 11 bibliographic review notes. |
| Generated citation and structured-data comparison | Passed: full author order, supported publication dates, venue/conference/report fields, volume/issue/pages, PDF URLs, individual DOI fields, JSON-LD, canonical URLs, complete listings, and descending category/date order. Withheld records/presentations/abstracts have no scholarly citation tags. |
| `npm run build:js` | Passed; regenerated the existing committed JavaScript bundle. |
| Bash/Ruby syntax and `git diff --check` | Passed. |
| Metadata-validator negative fixtures | Passed: duplicate article DOI, invalid category, inconsistent date, missing PDF, and duplicate author were rejected. Fixtures were isolated from the real collection. |
| Internal links/assets/anchors | 67 HTML documents checked, including 55 themed content pages, redirects, and the two existing standalone example reports. No missing internal targets, fragment IDs, or required image descriptions in themed pages. |
| External links | 41 unique external URLs inventoried. Official-source checks succeeded where readable; restricted/large/bot-protected routes are listed separately as limitations. |
| Broad Chromium rendering sweep | 55 themed content pages at 375 and 1440 pixels: 110 checks; no failed pages, broken images, horizontal page overflow, heading-level skips, or JavaScript errors. |
| Targeted responsive/browser checks | 8 key pages at 320, 375, 768, 1024, and 1440 pixels: 40 checks passed. All 28 existing top-level local PDF downloads returned PDF content. |
| Keyboard interactions | Passed: navigation Enter/Tab/Escape, profile menu Escape, skip-to-main focus, topic links, and keyboard scrolling of the supplier table at 320 pixels. |
| Accessibility scan | axe-core 4.14.1, WCAG 2 A/AA and 2.1 AA rules, 7 key pages at 375 and 1440 pixels: no violations or incomplete checks. Mobile navigation also passed with JavaScript disabled. Automated checks do not replace a human assistive-technology review. |
| Preservation checks | All 25 legacy publication permalinks unchanged; no pre-existing source files deleted; original PDFs unchanged. |
| New validation workflow | Reviewed locally; remote GitHub Actions execution was not triggered. Read-only repository permissions; no publish/deploy step. |

Browser checks used the real local Jekyll server and installed Chromium. The two standalone generated coaching reports were retained and link-checked; they were not restyled or included in the themed-page accessibility sweep. The 87 MB ECSSMET proceedings document was not committed. The source changes do not depend on Playwright or axe; those were used only from scratch storage for validation.

The cloud's enforced HTTP allowlist prevented direct access to DLR, Crossref, and several publisher hosts. The web service provided usable official SAE, VFS, EUCASS, arXiv, DLR landing-page, and proceedings-contents evidence. Other requests encountered 403/bot protection, tool-access failures, or the large-PDF limit. These are recorded as unavailable checks, not proof of broken URLs.

External links were inventoried and checked where the available tools could read them. The wrong FuelEconomy.gov route was replaced with the [official 2024 Equinox EV FWD record](https://www.fueleconomy.gov/feg/noframes/47814.shtml). The REI product link redirects to a product-category page and was retained. LinkedIn, Strava, Flickr, Thingiverse, and some DOI/publisher routes could not be conclusively checked through the available tools. The arXiv PDF replaced the unreadable HAL PDF route for the 2014 paper. No speculative replacement URLs were introduced.

Existing nonfatal toolchain diagnostics remain: Jekyll 3.9.3 emits a Logger initialization warning and a Stevenson superclass-initialization notice under Ruby 3.2; Faraday recommends the optional `faraday-retry` middleware. They also appeared on the baseline build. There were no Liquid, front-matter, missing-layout, generated-link, or publication-schema errors. The dependency lockfile was preserved; these upstream diagnostics were not hidden or treated as site-content failures.

## 6. Questions requiring input

1. Provide access to the full ECSSMET 2026 proceedings PDF, or enable the relevant public-source domains in the environment, so the individual titles, author formatting, pages, summaries, and redistribution notice can be checked. Until then the three new records are explicitly provisional at the individual-paper level.
2. Confirm the official AIAA 2026-0420 record or provide its first page/bibliographic export, particularly the DOI and full author-name formatting.
3. Confirm whether the 2013 composite-plate manuscript was also presented at DYNACOMP, and whether any full ICCS17 proceedings paper exists beyond abstract 3673. The current page describes the primary-source-confirmed abstract and the related HAL manuscript separately.
4. Confirm the final publisher title/author order, DOI, and pagination for the 2024 NOISE-CON paper if the final record differs from the existing manuscript.
5. Clarify the VFS/SAE DOI registration discrepancy (17586 versus 1242) if a preferred final registration is known. The official VFS proceedings DOI is currently used.
6. Supply the official SCLV 2025 MIMO program/deck and any missing full given names, particularly the displayed Mayne/Carrella names and S. Torres Mañueco in the 2012 contribution.
7. Optionally provide an approved public academic CV PDF and preferred public contact email. Neither was invented or published automatically.

## 7. Metadata not independently verified

The individual ECSSMET 2026 metadata and summaries, essential AIAA 2026 author/DOI details, the MIMO contribution's complete names, the 2013 manuscript's full proceedings status, and the final NOISE-CON 2024 publisher metadata remain unresolved as detailed above. Volume/issue/pagination for the H-Matrix proceedings item and the article DOI for the 2023 SWOT paper also remain unconfirmed.

Some older contributions have a verified title/author list and year from the original PDF but no independently confirmed individual publication day, DOI, or proceedings pagination. Those fields are omitted, and the CSV records the evidence used for every entry. An omitted DOI does not imply that no DOI exists. Degrees, professional appointments, training, mentoring, awards, and service use the existing website and the explicit information provided in this request; no private CV or account data was consulted to add claims.

## 8. Recommended improvements not implemented

- Complete the unresolved source verification, then enable citation metadata for the four withheld 2026 paper records. Add paper extracts only after checking redistribution rights; do not commit the full 87 MB proceedings volume.
- Review a future update of the locked GitHub Pages/Jekyll dependency bundle to address its Ruby/Faraday diagnostics. The theme/framework and lockfile were intentionally preserved in this change.
- The pre-existing Dockerfile installs Bundler 2.3.26 while the lockfile specifies 2.4.19. Its image was not rebuilt or changed; if Docker becomes a supported workflow, align it with the lockfile and test it separately.
- Live GitHub Actions execution, GitHub Pages production behavior, indexing by Google Scholar, and cross-browser Safari/Firefox behavior were not exercised because this work stayed local. The new workflow is available for review and has no deployment step.
- The six inherited `paper1/2/3.pdf` and `slides1/2/3.pdf` theme sample assets are unlinked from the bibliography. They were left in place to preserve existing files; removal can be reviewed separately.
- No ORCID, citation metrics, award dates, funding claims, formal supervision claims, public CV PDF, or new contact address was added without an authoritative or explicitly approved source.
