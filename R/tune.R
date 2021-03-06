#' Tune hyperparameters on Cloud ML
#'
#' @inheritParams cloudml_train
#' @param hypertune
#'   Path to a YAML file, defining how hyperparameters should
#'   be tuned. See
#'   https://cloud.google.com/ml/reference/rest/v1/projects.jobs
#'   for more details.
cloudml_tune <- function(application = getwd(),
                         config = "cloudml",
                         hypertune = "hypertune.yml",
                         ...)
{
  # validate hyperparameters path
  if (!file.exists(file.path(application, hypertune))) {
    fmt <- "no configuration file exists at path '%s'"
    stopf(fmt, file.path(application, hypertune))
  }

  # delegate to cloudml_train
  cloudml_train(application = application,
                config = config,
                hypertune = hypertune,
                ...)
}
