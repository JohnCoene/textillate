effect_it <- function(t, effect = "hinge", delay.scale = 1.5, delay = 50, sync = FALSE,
                      shuffle = FALSE, reverse = FALSE, what = "in"){

  t$x$opts[[what]]$effect <- effect
  t$x$opts[[what]]$delayScale <- delay.scale
  t$x$opts[[what]]$delay <- delay
  t$x$opts[[what]]$sync <- sync
  t$x$opts[[what]]$shuffle <- shuffle
  t$x$opts[[what]]$reverse <- reverse

  t
}
