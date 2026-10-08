# Builds a downloadable, runnable .qmd for each demo page.
#
# Runs automatically before every render (pre-render in _quarto.yml), so the
# downloads always match the demo pages. For each demos/stage-N.qmd it keeps the
# headings, the bold step lines and every ```{r} chunk, and drops the prose,
# the "Get the files" box and any ````markdown example blocks. The result goes
# to downloads/stage-N-demo.qmd, which _quarto.yml copies to the site as-is.

demo_files <- sort(list.files("demos", pattern = "^stage-[0-9]+\\.qmd$", full.names = TRUE))
dir.create("downloads", showWarnings = FALSE)

for (path in demo_files) {
  src   <- readLines(path, warn = FALSE)
  stage <- sub("^stage-([0-9]+)\\.qmd$", "\\1", basename(path))
  title <- sub('^title: *"?(.*?)"?$', "\\1", grep("^title:", src, value = TRUE)[1])

  out <- c(
    "---",
    sprintf('title: "%s"', title),
    "---",
    "",
    "<!-- The code from the demo page, ready to run. Put any CSV files it reads",
    "     in a data/ folder next to this file, then render or run it chunk by chunk. -->",
    ""
  )

  in_yaml  <- src[1] == "---"
  in_chunk <- FALSE
  in_md    <- FALSE   # inside a ````markdown example block: skip it

  for (i in seq_along(src)) {
    line <- src[i]

    if (in_yaml) {
      if (i > 1 && line == "---") in_yaml <- FALSE
      next
    }
    if (in_md) {
      if (grepl("^````\\s*$", line)) in_md <- FALSE
      next
    }
    if (grepl("^````", line)) { in_md <- TRUE; next }

    if (in_chunk) {
      out <- c(out, line)
      if (grepl("^```\\s*$", line)) { in_chunk <- FALSE; out <- c(out, "") }
      next
    }
    if (grepl("^```\\{r", line)) { in_chunk <- TRUE; out <- c(out, line); next }

    if (grepl("^## ", line) || grepl("^\\*\\*Step", line)) out <- c(out, line, "")
  }

  writeLines(out, file.path("downloads", sprintf("stage-%s-demo.qmd", stage)))
}
