% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/psych_utils_multi.R
\name{PsychModels}
\alias{PsychModels}
\title{Fit Multiple Psychometric Functions with Generalized Linear Models (GLM)}
\usage{
PsychModels(data, group_factors = NULL, formula, link = "probit")
}
\arguments{
\item{data}{a data frame containing the variables to be used in the model.}

\item{group_factors}{a character vector specifying the grouping variables in the dataset. If \code{NULL}, the model will be fit to the entire dataset without grouping.}

\item{formula}{the formula of the \code{\link[stats]{glm}} model. The response should consist of a binomial outcome (e.g., \code{cbind(yes, no)}).}

\item{link}{the link function. A character string specifying the link function to be used. By default, \code{"probit"} is used. See \code{\link[stats]{glm}} for available link functions.}
}
\description{
The function fits psychometric functions to data using \code{\link[stats]{glm}} for multiple groups. It supports the use of a binomial error distribution.
}
\details{
This function allows the fitting of psychometric functions to grouped data. If grouping variables are provided through \code{group_factors}, separate models are fit to each group. The function returns a list of models, one for each group, where the model for each group is fitted using the specified \code{formula} and \code{link}.

The models are returned as a named list, with each list element containing the fitted GLM model and the associated group-level information.
}
\examples{
model_list <- PsychModels(formula = cbind(Longer, Total - Longer) ~ X,
data = simul_data,
group_factors = "Subject")

model_list_vibro <- PsychModels(vibro_exp3,
group_factors = c("subject", "vibration"),
formula = cbind(faster, slower) ~ speed)

}
\seealso{
\code{\link[stats]{glm}}, \code{\link{PsychParameters}}
}
