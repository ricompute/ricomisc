#' View an HTML file in the RStudio Viewer pane.
#'
#' View an HTML file (e.g., a rendered R Markdown document) in the RStudio
#' Viewer pane without re-rendering the R Markdown document.
#'
#' @param file_name The HTML file to be viewed.
#' @param file_path The path to the directory in which the HTML file can be
#'   found, if the HTML file to be viewed is not in the current working
#'   directory.
#'
#' @export
rstudio_viewer <- function(file_name, file_path = NULL) {
    temporary_file <- tempfile()
    dir.create(temporary_file)
    html_file <- file.path(temporary_file, file_name)
    current_path <- ifelse(is.null(file_path),
                           getwd(),
                           path.expand(file_path))
    file.copy(file.path(current_path, file_name), html_file)
    rstudioapi::viewer(html_file)
}