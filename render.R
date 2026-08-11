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

render_targets <- list(
  c("biostatistics_foundations.Rmd", "biostatistics_foundations.html"),
  c("biostatistics_foundations_zh.Rmd", "biostatistics_foundations_zh.html"),
  c("biostatistics_bilingual.Rmd", "biostatistics_bilingual.html")
)

for (target in render_targets) {
  message("\nRendering ", target[[1]], " ...")
  rmarkdown::render(
    input = target[[1]],
    output_file = target[[2]],
    envir = new.env(parent = globalenv()),
    quiet = FALSE
  )
}
