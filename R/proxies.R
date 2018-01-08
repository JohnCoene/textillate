#' Proxies
#'
#' Shiny proxies.
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
#'     txtOutput('textillate')
#'   )
#'
#'   server <- function(input, output){
#'     output$textillate <- renderTxt({
#'       txt("Click to start", auto.start = FALSE) %>%
#'         txt_in(effect = "fadeIn") %>%
#'         txt_out(effect = "bounce")
#'     })
#'
#'     observeEvent(input$start, {
#'       txtProxy("textillate") %>%
#'         txt_start_p()
#'     })
#'
#'     observeEvent(input$start, {
#'       txtProxy("textillate") %>%
#'         txt_stop_p()
#'     })
#'
#'     observeEvent(input$start, {
#'       txtProxy("textillate") %>%
#'         txt_in_p()
#'     })
#'
#'     observeEvent(input$out, {
#'       txtProxy("textillate") %>%
#'         txt_out_p()
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @rdname proxies
#' @export
txt_start_p <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_start", data)

  return(proxy)
}

#' @rdname proxies
#' @export
txt_stop_p <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_stop", data)

  return(proxy)
}

#' @rdname proxies
#' @export
txt_in_p <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_in_proxy", data)

  return(proxy)
}

#' @rdname proxies
#' @export
txt_out_p <- function(proxy){

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("txt_out_proxy", data)

  return(proxy)
}
