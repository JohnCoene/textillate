[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/textillate.svg?branch=master)](https://travis-ci.org/JohnCoene/textillate)

# textillate

[textillate.js](http://textillate.js.org/) for R.

![textillate](http://john-coene.com/img/textillate.gif)

## Dependencies

* [jQuery](http://jquery.com/download/)
* [lettering.js](https://github.com/davatron5000/Lettering.js)
* [animate.css](https://github.com/daneden/animate.css)

## Examples

``` r
textillate(
  "Textillate"
)

textillate("Effects", `in` = list(effect = "rollIn"))

textillate("Duration and effect", `in` = list(effect = "flipInX"), min.display.time = 5000)

textillate("Duration and effect", min.display.time = 5000) %>%
  textillate_in(
    effect = "flipInX",
    delay = 1000,
    shuffle = TRUE
  )
```
