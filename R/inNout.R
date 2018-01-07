#' Customise effects
#'
#' Cutomise in  and out effect.
#'
#' @param t and object of class \code{textillate} as returned by \code{\link{textillate}}.
#' @param effect set effect name.
#' @param delay.scale set the delay factor applied to each consecutive character.
#' @param delay set the delay between each character.
#' @param sync set to true to animate all the characters at the same time.
#' @param shuffle randomize the character sequence.
#' @param reverse reverse the character sequence.
#'
#' @details See \href{textillate.js.org/}{http://textillate.js.org/} for examples.
#' \code{reserve = TRUE} doesn't make sense with \code{sync = TRUE}.
#'
#' @examples
#' # may not work in RStudio viewer, open in browser
#' textillate("Duration and effect", min.display.time = 5000) %>%
#'   textillate_in(
#'     effect = "flipInX",
#'     delay = 1000,
#'     shuffle = TRUE
#'   )
#'
#' @rdname effects
#' @export
textillate_in <- function(t, effect = "fadeInLeftBig", delay.scale = 1.5, delay = 50, sync = FALSE,
                          shuffle = FALSE, reverse = FALSE){

  effect_it(t, effect = effect, delay.scale = delay.scale, delay = delay, sync = sync,
            shuffle = shuffle, reverse = reverse, what = "in")
}

#' @rdname effects
#' @export
textillate_out <- function(t, effect = "hinge", delay.scale = 1.5, delay = 50, sync = FALSE,
                           shuffle = FALSE, reverse = FALSE){
  effect_it(t, effect = effect, delay.scale = delay.scale, delay = delay, sync = sync,
            shuffle = shuffle, reverse = reverse, what = "in")
}
