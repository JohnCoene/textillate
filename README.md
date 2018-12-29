[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/textillate.svg?branch=master)](https://travis-ci.org/JohnCoene/textillate)

# textillate

[textillate.js](http://textillate.js.org/) for R.

## Dependencies

* [jQuery](http://jquery.com/download/)
* [lettering.js](https://github.com/davatron5000/Lettering.js)
* [animate.css](https://github.com/daneden/animate.css)

## Examples

### RMarkdown

``` r
textillate(
  "Textillate"
)

textillate(
  "Effects", 
  `in` = list(
    effect = "rollIn"
  )
)

# Pass options as list
textillate(
  "Duration and effect", 
  `in` = list(
    effect = "flipInX"
  ), 
  min.display.time = 5000
)

# Or pipe
textillate(
    "Duration and effect", 
    min.display.time = 5000
  ) %>%
  textillateIn(
    effect = "flipInX",
    delay = 1000,
    shuffle = TRUE
  )
```

### Shiny

*proxies*

```r
if(interactive()){
  library(shiny)

  ui <- fluidPage(
    actionButton(
      "start",
      "start"
    ),
    actionButton(
      "stop",
      "stop"
    ),
    actionButton(
      "in",
      "in"
    ),
    actionButton(
      "out",
      "out"
    ),
    textillateOutput('textillate')
  )

  server <- function(input, output){
    output$textillate <- renderTextillate({
      textillate("Click to start", auto.start = FALSE) %>%
        textillateIn(effect = "fadeIn") %>%
        textillateOut(effect = "bounce")
    })

    observeEvent(input$start, {
      textillateProxy("textillate") %>%
        textillateStartProxy()
    })

    observeEvent(input$start, {
      textillateProxy("textillate") %>%
        textillateStopProxy()
    })

    observeEvent(input$start, {
      textillateProxy("textillate") %>%
        textillateInProxy()
    })

    observeEvent(input$out, {
      textillateProxy("textillate") %>%
        textillateOutProxy()
    })
  }

  shinyApp(ui, server)
}
```
