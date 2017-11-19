## install packagedocs if not installed:
if(!require("packagedocs")) {
  devtools::install_github("lhsego/packagedocs")
}

knitr::opts_knit$set(root.dir = normalizePath("."))

# Render the documents
packagedocs::render_docs(
  code_path = "~/R/rsed",
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


# Manual edits of index.html
rsed::streamEdit(list(# Copyright on page
                      s = list(pattern = paste("Battelle Memorial Institute,", substr(Sys.Date(), 1, 4)),
                               replace = "Battelle Memorial Institute, 2016",
                               fixed = TRUE)),
                 
                 inFile = "index.html", outFile = "index.html")


# Make some manual edits to rd.html that didn't render correctly

rsed::streamEdit(list(# Links for LICENSE
                      s = list(pattern = "BSD_3_clause + file LICENSE",
                               replacement = paste("<a href=https://cran.r-project.org/web/licenses/BSD_3_clause>BSD_3_clause</a> +",
                                                   "<a href='LICENSE.txt'>LICENSE</a>"),
                               fixed = TRUE),
          
                      # Add links to imported CRAN packages
                      s = list(pattern = "Smisc",
                               replacement = "<a href=https://CRAN.R-project.org/package=Smisc>Smisc</a>",
                               fixed = TRUE),

                      # Add links to suggested CRAN packages
                      s = list(pattern = "testthat",
                               replacement = "<a href=https://CRAN.R-project.org/package=testthat>testthat</a>",
                               fixed = TRUE),

                      # Fix the print method
                      r = list(at = "printstream(x, ...)</code></pre>",
                               replacement = "## S3 method for class 'stream'\nprint(x, ...)</code></pre>",
                               fixed = TRUE),

                      # Fix links that are in the description portion of `streamEdit`
                      s = list(pattern = "'sed_insert.html'", replacement = "#sed_insert", fixed = TRUE),
                      s = list(pattern = "'sed_replace.html'", replacement = "#sed_replace", fixed = TRUE),
                      s = list(pattern = "'sed_substitute.html'", replacement = "#sed_substitute", fixed = TRUE),
                      s = list(pattern = "'sed_comment.html'", replacement = "#sed_comment", fixed = TRUE),

                      # Copyright on page
                      s = list(pattern = paste("Battelle Memorial Institute,", substr(Sys.Date(), 1, 4)),
                               replace = "Battelle Memorial Institute, 2016",
                               fixed = TRUE)),
                 
                 inFile = "rd.html", outFile = "rd.html")
