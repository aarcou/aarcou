% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_module.R
\name{summarytabUI}
\alias{summarytabUI}
\alias{summarytab}
\title{summarytab_ui}
\usage{
summarytabUI(id)

summarytab(input, output, session, selectAnaID1 = reactive(NULL),
  selectAnaID2 = reactive(NULL), portfolioID1 = reactive(""),
  portfolioID2 = reactive(""), tbl_filesListDataana1 = reactive(NULL),
  compare = FALSE, active)
}
\arguments{
\item{id}{Namespace ID for the module.}

\item{input, output, session}{Shiny input, output, and session objects.}

\item{selectAnaID1}{id of selected analysis}

\item{selectAnaID2}{id of selected analysis}

\item{portfolioID1}{portfolio id associated with selected analysis}

\item{portfolioID2}{portfolio id associated with selected analysis}

\item{tbl_filesListDataana1}{dataframe of the output files}

\item{compare}{logical indicating comparison}

\item{active}{reactive expression whether the module state should be updated.}
}
\value{
UI panel element.

list of tags
}
\description{
UI/View of summary elements of an analysis.

Server logic of summary elements of an analysis.
}
\details{
Analysis Summary Server
}
