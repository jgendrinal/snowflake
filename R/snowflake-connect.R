#' Snowflake connection class
#'
#' @export
#' @import DBI
#' @import methods
#' @keywords internal
setClass("SnowflakeConnection",
    contains = "DBIConnection",
    slots = list(
      account = "character",
      username = "character",
      password = "character",
      database = "character",
      warehouse = "character"
    ))

setMethod("dbConnect",
          "SnowflakeConnection",
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
