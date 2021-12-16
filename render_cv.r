# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

############## CV
# Knit the HTML version
rmarkdown::render("cv_plus_refs.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "cv_plus_refs.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv_plus_refs.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert CV to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "cv_plus_refs.pdf")

############## Resume
# Knit the HTML version
rmarkdown::render("resume_longer.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "resume_sjmarks_long.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("resume_longer.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)


# Convert Resume to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "resume_sjmarks_long.pdf")
