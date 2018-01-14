#' Proxies
#'
#' Shiny proxies.
#'
#' @param proxy an object of class \code{txtProxy} as returned by \code{\link{textillateProxy}}.
#'
#' @examples
#' if(interactive()){
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     actionButton(
#'       "start",
#'       "start"
#'     ),
#'     actionButton(
#'       "stop",
#'       "stop"
#'     ),
#'     actionButton(
#'       "in",
#'       "in"
#'     ),
#'     actionButton(
#'       "out",
#'       "out"
#'     ),
#'     textillateOutput('textillate')
#'   )
#'
#'   server <- function(input, output){
#'     output$textillate <- renderTextillate({
#'       textillate("Click to start", auto.start = FALSE) %>%
#'         textillateIn(effect = "fadeIn") %>%
#'         textillateOut(effect = "bounce")
#'     })
#'
#'     observeEvent(input$start, {
#'       textillateProxy("textillate") %>%
#'         textillateStartProxy()
#'     })
#'
#'     observeEvent(input$start, {
#'       textillateProxy("textillate") %>%
#'         textillateStopProxy()
#'     })
#'
#'     observeEvent(input$start, {
#'       textillateProxy("textillate") %>%
#'         textillateInProxy()
#'     })
#'
#'     observeEvent(input$out, {
#'       textillateProxy("textillate") %>%
#'         textillateOutProxy()
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @rdname proxies
#' @export
textillateStartProxy <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_start", data)

  return(proxy)
}

#' @rdname proxies
#' @export
textillateStopProxy <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_stop", data)

  return(proxy)
}

#' @rdname proxies
#' @export
textillateInProxy <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_in_proxy", data)

  return(proxy)
}

#' @rdname proxies
#' @export
textillateOutProxy <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_out_proxy", data)

  return(proxy)
}
