#!/usr/bin/env Rscript

# Render the teaching module from any working directory.
file_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
project_dir <- if (length(file_arg)) {
  dirname(normalizePath(sub("^--file=", "", file_arg[[1]])))
} else {
  getwd()
}

setwd(project_dir)

local_library <- file.path(project_dir, ".Rlib")
dir.create(local_library, showWarnings = FALSE, recursive = TRUE)
.libPaths(c(local_library, .libPaths()))

if (!requireNamespace("rmarkdown", quietly = TRUE) ||
    !requireNamespace("knitr", quietly = TRUE)) {
  stop(
    "Missing rmarkdown/knitr. Install them into .Rlib first; see README.md.",
    call. = FALSE
  )
}

pandoc_candidates <- c(
  Sys.getenv("RSTUDIO_PANDOC"),
  "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/aarch64",
  "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools"
)
pandoc_candidates <- pandoc_candidates[nzchar(pandoc_candidates)]
available_pandoc <- pandoc_candidates[file.exists(file.path(pandoc_candidates, "pandoc"))]

if (length(available_pandoc)) {
  Sys.setenv(RSTUDIO_PANDOC = available_pandoc[[1]])
}

render_inputs <- sort(list.files(
  path = project_dir,
  pattern = "[.][Rr][Mm][Dd]$",
  full.names = FALSE
))

if (!length(render_inputs)) {
  stop("No R Markdown files found in the project directory.", call. = FALSE)
}

render_targets <- lapply(
  render_inputs,
  function(input) {
    c(input, sub("[.][Rr][Mm][Dd]$", ".html", input))
  }
)

message("Found ", length(render_targets), " R Markdown files to render.")

for (target in render_targets) {
  message("\nRendering ", target[[1]], " ...")
  rmarkdown::render(
    input = target[[1]],
    output_file = target[[2]],
    envir = new.env(parent = globalenv()),
    quiet = FALSE
  )
}
