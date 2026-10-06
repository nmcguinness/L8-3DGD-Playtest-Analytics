# Playtest Analytics

Teaching notes and labs for the data-analysis strand of **COMP I8015 — 3D Game
Development**, Stage 4, BSc (Hons) in Computing in Games Development, Dundalk
Institute of Technology.

Built as a [Quarto](https://quarto.org) website. R runs at render time; the
published site is static HTML.

## Requirements

- R 4.6 or later
- Quarto 1.4 or later

```r
install.packages(c("readr", "dplyr", "tidyr", "ggplot2", "knitr", "rmarkdown",
                   "plotly", "DT"))
```

The first six are what the notes and labs use. `plotly` and `DT` are used only by
the showcase page.

## Build

```bash
quarto preview            # live reload while writing
quarto render             # full build into _site/
quarto publish gh-pages   # render and publish to GitHub Pages
```

## Repository layout

| Path | Contents |
| :- | :- |
| `index.qmd` | The showcase — eight worked views, used as the motivator |
| `notes/` | Twelve teaching notes in six parts, numbered in reading order; start with `00-start-here.qmd`. `_setup.R` and `_workflow.qmd` are shared by every page |
| `demos/` | The lecturer's live demo script for each week |
| `labs/` | Exercise sheets worked in class |
| `reference/` | Lookup pages |
| `data/` | Synthetic playtest data, seeded and fixed |
| `_freeze/` | Execution cache — **committed**, do not delete |
| `_site/` | Build output — git-ignored |
| `lecturer/` | Private authoring files — git-ignored and never rendered |

The data in `data/` is synthetic. It describes *Tidebreak*, a fictional
four-player top-down arena, and exists so that every example is self-contained
and reproducible.

