#' Driver for Snowflake databases
#'
#' @keywords  internal
#' @export
#' @import DBI
#' @import methods
setClass("SnowflakeDriver", contains = "DBIDriver")

#' @export
setMethod("show", "SnowflakeDriver", function(object){
  cat("<SnowflakeDriver>\n")
})

#' @export
Snowflake <- function() {
  new("SnowflakeDriver")
}
