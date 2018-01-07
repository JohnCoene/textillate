#' Customise effects
#'
#' Cutomise in  and out effect.
#'
#' @rdname effects
#' @export
textillate_in <- function(t, effect = "fadeInLeftBig", delay.scale = 1.5, delay = 50, sync = FALSE,
                          shuffle = FALSE, reverse = FALSE, ...){

  effect_it(t, effect = effect, delay.scale = delay.scale, delay = delay, sync = sync,
            shuffle = shuffle, reverse = reverse, what = "in", ...)
}

#' @rdname effects
#' @export
textillate_out <- function(t, effect = "hinge", delay.scale = 1.5, delay = 50, sync = FALSE,
                           shuffle = FALSE, reverse = FALSE, ...){
  effect_it(t, effect = effect, delay.scale = delay.scale, delay = delay, sync = sync,
            shuffle = shuffle, reverse = reverse, what = "in", ...)
}
