# output files Module ----------------------------------------------------------

# UI ---------------------------------------------------------------------------
#' outputfilesUI
#' @rdname outputfiles
#'
#' @description UI/View for output files of an analysis.
#'
#' @return List of tags.
#'
#' @export
outputfilesUI <- function(id) {

  ns <- NS(id)

  tagList(

    oasisuiPanel(
      id = ns("oasisuiPanelViewOutputFiles"),
      collapsible = TRUE,
      show = TRUE,
      heading = "Output files table",
      ViewFilesInTableUI(id  = ns("ViewOutputFiles"), includechkbox = TRUE)
    ),

    anainputsUI(id  = ns("anainputs"),
                heading = "Input files table",
                collapsible = TRUE)
  )
}


# Server -----------------------------------------------------------------------

#' outputfiles
#'
#' @rdname outputfiles
#'
#' @description  Server logic for output files of an analysis.
#'
#' @template params-module
#' @template params-active
#' @param tbl_filesListDataana Tbl of output files to view.
#' @param anaId Id of analysis.
#'
#' @export
outputfiles <- function(input, output, session,
                        tbl_filesListDataana = reactive(NULL),
                        anaId = reactive(NULL),
                        active = reactive(TRUE)) {

  ns <- session$ns

  # Reactive Values ------------------------------------------------------------
  result <- reactiveValues(
    counter = 0
  )

  # list of sub-modules
  sub_modules <- list()

  # Counter for Inputs ---------------------------------------------------------
  observeEvent(tbl_filesListDataana(),{
      result$counter <- result$counter + 1
  })


  # Submodules -----------------------------------------------------------------

      sub_modules$ViewOutputFiles <- callModule(
        ViewFilesInTable,
        id = "ViewOutputFiles",
        tbl_filesListData = tbl_filesListDataana,
        param = anaId,
        file_column = "files",
        includechkbox = TRUE)

      sub_modules$anainputs <- callModule(
        anainputs,
        id = "anainputs",
        analysisID = anaId,
        refresh_opt = FALSE,
        counter = reactive({result$counter}),
        active = reactive({active()})
      )

}
