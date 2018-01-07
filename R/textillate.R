#' Textillate
#'
#' Animate text
#'
#' @param text text to animate.
#' @param ... any element.
#' @param loop enable looping.
#' @param min.display.time sets the minimum display time for each text before it is replaced.
#' @param initial.delay sets the initial delay before starting the animation.
#' @param auto.start set whether or not to automatically start animating.
#' @param in.effects,out.effects custom set of 'in' and 'out' effects. This effects whether or not the character
#' is shown/hidden before or after an animation.
#' @param type set the type of token to animate (available types: \code{char} and \code{word})
#' @param width,height dimensions.
#' @param elementId id of html element.
#'
#' @details
#' Effects:
#' \itemize{
#'   \item{\code{}}
#' }
#'
#' @examples
#' # may not work in RStudio viewer, open in browser
#' textillate("Textillate") # basic
#'
#' textillate("Effects", `in` = list(effect = "rollIn")) # effects
#'
#' textillate("Duration and effect", `in` = list(effect = "flipInX"), min.display.time = 5000)
#'
#' # OR
#' textillate("Duration and effect", min.display.time = 5000) %>%
#'   textillate_in(
#'     effect = "flipInX",
#'     delay = 1000
#'   )
#'
#' @details See \href{textillate.js.org/}{http://textillate.js.org/} for examples.
#' \code{reserve = TRUE} doesn't make sense with \code{sync = TRUE}.
#'
#' @import htmlwidgets
#'
#' @seealso \code{\link{textillate_in}}, \code{\link{textillate_out}}
#'
#' @export
textillate <- function(text, ..., loop = FALSE, min.display.time = 2000, initial.delay = 0, auto.start = TRUE,
                       in.effects = list(), out.effects = list("hinge"), type = "char",
                       width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    text = text,
    opts = list(
      loop = loop,
      minDisplayTime = min.display.time,
      initialDelay = initial.delay,
      autoStart = auto.start,
      inEffects = in.effects,
      outEffects = out.effects,
      type = type,
      ...
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'textillate',
    x,
    width = width,
    height = height,
    package = 'textillate',
    elementId = elementId
  )
}

textillate_html <- function(id, style, class, ...){
  htmltools::tags$span(id = id, class = paste("tlt", class))
}

#' Shiny bindings for textillate
#'
#' Output and render functions for using textillate within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a textillate
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name textillate-shiny
#'
#' @export
textillateOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'textillate', width, height, package = 'textillate')
}

#' @rdname textillate-shiny
#' @export
renderTextillate <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, textillateOutput, env, quoted = TRUE)
}
