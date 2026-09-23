# Playtest Analytics

Teaching notes and labs for the data-analysis strand of **COMP I8015 — 3D Game
Development**, Stage 4, BSc (Hons) in Computing in Games Development, Dundalk
Institute of Technology.

Built as a [Quarto](https://quarto.org) website. R runs at render time; the
published site is static HTML.

## Requirements

- R 4.3 or later
- Quarto 1.4 or later

```r
install.packages(c("readr", "knitr", "dplyr", "tidyr", "ggplot2", "plotly", "DT"))
```

`readr` and `knitr` are all the notes and labs need. The remainder are used only
by the showcase page.

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
| `notes/` | Principles documents, read before class |
| `labs/` | Exercise sheets worked in class |
| `reference/` | Lookup pages |
| `data/` | Synthetic playtest data, seeded and fixed |
| `_freeze/` | Execution cache — **committed**, do not delete |
| `_site/` | Build output — git-ignored |

The data in `data/` is synthetic. It describes *Tidebreak*, a fictional
four-player top-down arena, and exists so that every example is self-contained
and reproducible.

## A note on private material

Authoring files — the build spec, the data generator, session plans and the
Claude Code instructions — are held in a `lecturer/` folder and a root
`CLAUDE.md`, both git-ignored. They are not part of this repository and are not
published. If you have cloned this repo you have everything needed to render the
site; you will not be able to regenerate the CSVs, which are committed for that
reason.
