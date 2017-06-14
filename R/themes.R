#' Custom ggplot2 themes.
#'
#' Base ggplot2 themes for paper figures and poster figures. All arguments are
#' passed on to \code{ggplot2::\link[ggplot2]{theme}()}.
#'
#' @name ggplot2_themes
NULL

#' @rdname ggplot2_themes
#' @export
theme_paper <- function(base_size = 10,
                        legend.key.size = unit(0.09, "in"),
                        legend.title = element_blank(),
                        axis.title.x = element_blank(),
                        axis.text.x = element_text(size = 8),
                        axis.ticks.x = element_blank(),
                        axis.line.x = element_line(color = "black"),
                        axis.line.y = element_line(color = "black"),
                        plot.title = element_text(hjust = 0.5),
                        strip.background = element_blank(),
                        ...) {
    ggplot2::theme_classic(base_size = base_size) +
        ggplot2::theme(legend.key.size = legend.key.size,
                       legend.title = legend.title,
                       axis.title.x = axis.title.x,
                       axis.text.x = axis.text.x,
                       axis.ticks.x = axis.ticks.x,
                       axis.line.x = axis.line.x,
                       axis.line.y = axis.line.y,
                       plot.title = plot.title,
                       strip.background = strip.background,
                       ...)
}

#' @rdname ggplot2_themes
#' @export
theme_poster <- function(base_size = 15,
                         strip.background = element_blank(),
                         panel.background = element_blank(),
                         panel.grid.minor = element_line(color = "grey93"),
                         plot.background = element_rect(fill = "transparent",
                                                        color = NA),
                         ...) {
    ggplot2::theme_bw(base_size = base_size) +
        ggplot2::theme(strip.background = strip.background,
                       panel.background = panel.background,
                       panel.grid.minor = panel.grid.minor,
                       plot.background = plot.background,
                       ...)
}