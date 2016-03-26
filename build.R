## install packagedocs if not installed:
options(repos = c(tessera = "http://packages.tessera.io", getOption("repos")))
if(!require("packagedocs")) {
  install.packages("packagedocs")
}

knitr::opts_knit$set(root.dir = normalizePath("."))

# Render the documents
packagedocs::render_docs(
  code_path = "~/Work/github/rsed",
  docs_path = ".",             # location of docs directory
  package_name = "rsed",       # name of the package
  main_toc_collapse = TRUE,    # use collapsing toc on main page
  rd_toc_collapse = TRUE,      # use collapsing toc on rd page
  lib_dir = "assets",          # put assets in "assets" directory
  render_main = TRUE,          # render main page
  render_rd = TRUE,            # render rd page
  view_output = FALSE,         # look at the output after render
  rd_index = "./rd_index.yaml" # optional path to rd layout yaml
)

# Ensure the 'rsed' package is loaded
if(!require("rsed")) {
  devtools::install_github("pnnl/rsed")
}

# Make some manual edits to rd.html that didn't render correctly
rsed::streamEdit(list(s = list(pattern = "printstream(",
                               replacement = "print(",
                               fixed = TRUE),
                      r = list(at = "<strong>Authors:</strong> (none)",
                               replacement = "<strong>Author:</strong> Landon Sego",
                               fixed = TRUE)),
                 inFile = "rd.html", outFile = "rd.html")
