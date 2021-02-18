#' Driver for Snowflake databases
#'
#' @keywords  internal
#' @export
#' @import DBI
#' @import methods
setClass("SnowflakeDriver", contains = "DBIDriver")

#' @export
#' @rdname Snowflake-class
setMethod("dbUnloadDriver", "SnowflakeDriver", function(drv, ...){
  TRUE
})

setMethod("show", "SnowflakeDriver", function(object){
  cat("<SnowflakeDriver>\n")
})

#' @export
Snowflake <- function() {
  new("SnowflakeDriver")
}
