# =============================================================================
# notes/_setup.R
# Shared setup for every notes page. Source it from a hidden first chunk:
#
#   ```{r}
#   #| label: setup
#   #| include: false
#   source("notes/_setup.R")
#   ```
#
# execute-dir is the project root, so the path is always "notes/_setup.R".
#
# It loads readr only. Pages load dplyr, tidyr or ggplot2 themselves, in the
# week those packages are taught, so the library() call is visible to students.
# =============================================================================

library(readr)

# -----------------------------------------------------------------------------
# Data: every Tidebreak file a notes page may need
# -----------------------------------------------------------------------------

read_tb <- function(name) {
  read_csv(file.path("data", paste0("tidebreak_", name, ".csv")),
           show_col_types = FALSE)
}

sessions     <- read_tb("sessions")
sessions_raw <- read_tb("sessions_raw")
survey       <- read_tb("survey")
paired       <- read_tb("paired")
frames       <- read_tb("frame_times")

# -----------------------------------------------------------------------------
# Palette: one colour per meaning, used by base R and ggplot2 figures alike
# -----------------------------------------------------------------------------

pal <- list(
  fill      = "grey85",     # default bar / box fill
  line      = "grey40",     # default points and lines
  build_a   = "grey40",     # Build A, wherever builds are compared
  build_b   = "firebrick",  # Build B
  highlight = "firebrick",  # the one thing the figure is about
  guide     = "grey60"      # reference lines: budgets, means, thresholds
)

# -----------------------------------------------------------------------------
# Formatting helpers for inline `r ...` prose
# -----------------------------------------------------------------------------

# "p < 0.001" or "p = 0.034"
p_fmt <- function(p) if (p < 0.001) "p < 0.001" else paste("p =", round(p, 3))

# "2.1 to 4.7"
ci_fmt <- function(ci, d = 1) paste(round(ci[1], d), "to", round(ci[2], d))

# 0.3333 -> "33%"
pct_fmt <- function(x, d = 0) paste0(round(100 * x, d), "%")

# -----------------------------------------------------------------------------
# Figure helpers
# -----------------------------------------------------------------------------

# Base R: stamp a figure built from simulated data so it is never mistaken for
# Tidebreak data. Call immediately after the plot.
label_illustration <- function(text = "Illustration: simulated data") {
  mtext(text, side = 3, line = 0.2, adj = 1, cex = 0.75, col = pal$guide)
}
