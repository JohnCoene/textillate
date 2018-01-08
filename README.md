[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/textillate.svg?branch=master)](https://travis-ci.org/JohnCoene/textillate)

# textillate

[textillate.js](http://textillate.js.org/) for R.

![textillate](http://john-coene.com/img/textillate.gif)

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

textillate("Effects", `in` = list(effect = "rollIn"))

textillate("Duration and effect", `in` = list(effect = "flipInX"), min.display.time = 5000)

textillate("Duration and effect", min.display.time = 5000) %>%
  textillate_in(
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
    txtOutput('textillate')
  )

  server <- function(input, output){
    output$textillate <- renderTxt({
      txt("Click to start", auto.start = FALSE) %>%
        txt_in(effect = "fadeIn") %>%
        txt_out(effect = "bounce")
    })

    observeEvent(input$start, {
      txtProxy("textillate") %>%
        txt_start_p()
    })

    observeEvent(input$start, {
      txtProxy("textillate") %>%
        txt_stop_p()
    })

    observeEvent(input$start, {
      txtProxy("textillate") %>%
        txt_in_p()
    })

    observeEvent(input$out, {
      txtProxy("textillate") %>%
        txt_out_p()
    })
  }

  shinyApp(ui, server)
}
```
