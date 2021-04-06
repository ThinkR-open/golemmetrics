get_golem_logs <- function(){
  cranlogs::cran_downloads("golem", from = "2019-08-01", to = Sys.Date())
}
