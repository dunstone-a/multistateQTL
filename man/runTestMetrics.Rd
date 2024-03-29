% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runTestMetrics.R
\name{runTestMetrics}
\alias{runTestMetrics}
\title{Classify multi-state QTL}
\usage{
runTestMetrics(
  qtle,
  assay = "betas",
  significance_assay = "significant",
  global_buffer = 0,
  ...
)
}
\arguments{
\item{qtle}{QTLExperiment qtle}

\item{assay}{Name of assay containing QTL effect size estimate (e.g. betas)}

\item{significance_assay}{Name of assay with TRUE/FALSE significance calls}

\item{global_buffer}{Number of states that can be not-significant and the
QTL will still be called as global, for example, if
global_buffer=1, then a QTL will be considered global if
if is significant in all or all but 1 state.}

\item{...}{arguments passed to \code{runTestMetrics}}
}
\value{
The `QTLExperiment` object with the following columns added to the
rowData: nSignificant, effect_sd, qtl_type, qtl_type_simple
}
\description{
Takes the results from `callSignificance()` and from the assay `betas` to
categorize each QTL test using two classification strategies:

Strategy 1 (qtl_type):
(1) global-shared, (2) global-diverging, (3) multi-state-shared,
(4) multi-state-diverging, or (5) unique.

Strategy 2 (qtl_type_simple):
(1) global, (2) multi-state, or (3) unique.
}
\details{
If a test is significant in more than one sign across different
states, returns TRUE in rowData(qtle)$diverging
}
\examples{
m <- mockQTLE()
m <- callSignificance(m)
m <- runTestMetrics(m)

}
