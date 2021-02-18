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
