#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Golem metrics"),
    tags$blockquote(
      "Note: this application is automatically built via ",
      tags$a(
        href = "https://github.com/ThinkR-open/golem/actions",
        "{golem} CI system"
      )
    ),
    tags$div(
      class = "left",
      align = "center",
      h2("All time download"),
      uiOutput(ns("n")),
      tags$blockquote("(RStudio's CRAN mirror)")
    ),
    tags$div(
      class = "right",
      align = "center",
      h2("GitHub Stars"),
      tags$div(id = "github")
    ),
  )
}

#' main Server Functions
#'
#' @noRd
mod_main_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$n <- renderUI({
      golem::invoke_js("alert", "Welcome! This app displays the number of downloads from RStudio CRAN mirror and the number of stars on GitHub for the {golem} package. This app is automatically built via {golem} CI.")
      res <- get_golem_logs()

      h3(
        class = "number",
        pretty_num(sum(res$count))
      )

    })

  })
}

## To be copied in the UI
# mod_main_ui("main_ui_1")

## To be copied in the server
# mod_main_server("main_ui_1")
