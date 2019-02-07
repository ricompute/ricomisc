#' Custom ggplot2 themes.
#'
#' Base ggplot2 themes for paper figures and poster figures. All arguments are
#' passed on to \code{ggplot2::\link[ggplot2]{theme}()}.
#'
#' @name ggplot2_themes
NULL

#' @rdname ggplot2_themes
#' @inheritParams ggplot2::theme_classic
#' @inheritParams ggplot2::theme
#' @export
theme_paper <- function(base_size = 10,
                        legend.key.size = ggplot2::unit(0.09, "in"),
                        legend.title = ggplot2::element_blank(),
                        axis.title.x = ggplot2::element_blank(),
                        axis.text.x = ggplot2::element_text(size = 8),
                        axis.ticks.x = ggplot2::element_blank(),
                        axis.line.x = ggplot2::element_line(color = "black"),
                        axis.line.y = ggplot2::element_line(color = "black"),
                        plot.title = ggplot2::element_text(hjust = 0.5),
                        strip.background = ggplot2::element_blank(),
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
#' @inheritParams ggplot2::theme_classic
#' @inheritParams ggplot2::theme
#' @export
theme_paper_nhg <- function(base_size = 10,
                            text = element_text(family = "NeueHaasGroteskText"),
                            legend.key.size = ggplot2::unit(0.09, "in"),
                            legend.title = ggplot2::element_blank(),
                            axis.title.x = ggplot2::element_blank(),
                            axis.text.x = ggplot2::element_text(size = 8),
                            axis.ticks.x = ggplot2::element_blank(),
                            axis.line.x = ggplot2::element_line(color = "black"),
                            axis.line.y = ggplot2::element_line(color = "black"),
                            plot.title = ggplot2::element_text(hjust = 0.5),
                            strip.background = ggplot2::element_blank(),
                            ...) {
    ggplot2::theme_classic(base_size = base_size) +
        ggplot2::theme(text = text,
                       legend.key.size = legend.key.size,
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
#' @inheritParams ggplot2::theme_bw
#' @inheritParams ggplot2::theme
#' @export
theme_poster <- function(base_size = 15,
                         strip.background = ggplot2::element_blank(),
                         panel.background = ggplot2::element_blank(),
                         panel.grid.minor = ggplot2::element_line(color = "grey93"),
                         plot.background = ggplot2::element_rect(fill = "transparent",
                                                        color = NA),
                         ...) {
    ggplot2::theme_bw(base_size = base_size) +
        ggplot2::theme(strip.background = strip.background,
                       panel.background = panel.background,
                       panel.grid.minor = panel.grid.minor,
                       plot.background = plot.background,
                       ...)
}

#' Save ggplots with options
#'
#' @param filename A file path/name wrapped in \code{here::here()} before being
#'   passed to \code{ggsave()}
#' @param saveplots A logical indicating whether to save the plot. Can be
#'   overridden by a global variable named \code{global_saveplots}.
#' @param width Defaults to 180 mm
#' @param height Defaults to 180 mm
#' @param units Defaults to "mm"
#' @param dpi Defaults to 300
#' @inheritParams ggplot2::ggsave
#' @export
save_plot <- function(filename, plot, saveplots = NULL,
                      width = 180, height = 180,
                      units = "mm", dpi = 300, ...) {

    save <- ifelse(is.null(saveplots),
                   get0("global_saveplots", ifnotfound = TRUE),
                   saveplots)

    if (save) {
        ggplot2::ggsave(filename = here::here(filename),
                        plot = plot,
                        width = width,
                        height = height,
                        units = units,
                        dpi = dpi,
                        ...)
    }
}