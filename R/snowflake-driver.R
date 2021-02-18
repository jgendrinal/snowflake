#' Driver for Snowflake databases
#'
#' @import DBI methods
#' @export
setClass("SnowflakeDriver", contains = "DBIDriver")

#' @export
setMethod("show", "SnowflakeDriver", function(object){
  cat("<SnowflakeDriver>\n")
})

#' @rdname Snowflake
#' @export
Snowflake <- function() {
  new("SnowflakeDriver")
}

Snowflake()

#' Snowflake connection class
#'
#' @keywords internal
#' @export
setClass("SnowflakeConnection",
         contains = "DBIConnection",
         slots = list(
           account = "character",
           username = "character",
           password = "character",
           database = "character",
           warehouse = "character"
         ))

#' @rdname Snowflake
#' @export
setMethod(
  "dbConnect", "SnowflakeDriver",
          function(drv,
                   account,
                   username,
                   password,
                   database,
                   warehouse){
            new("SnowflakeConnection",
                account = account,
                username = username,
                password = password,
                warehouse = warehouse)
          })
