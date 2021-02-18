#' Driver for Snowflake databases
#'
#' @import DBI methods
#' @export
setClass("SnowflakeDriver", contains = "DBIDriver")

#' @export
#' @rdname Snowflake-class
setMethod("dbUnloadDriver", "SnowflakeDriver", function(drv, ...) {
  TRUE
})

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

#' Snowflake results class
#'
#' @export
setClass(
  "SnowflakeResult", contains = "DBIResult",
  slots = list(
    head = "logical"
  )
)


#' Send a query to Snowflake
#'
#' @export
setMethod(
  "dbSendQuery", "SnowflakeConnection",
  function(conn, statement, head, ...) {
    new("SnowflakeResult", head = TRUE)
  }
)

#' @export
setMethod("dbClearResult", "SnowflakeResult", function(res, ...) {
  # free resources
  TRUE
})

#' Retrieve records from Kazam query
#' @export
setMethod("dbFetch", "SnowflakeResult", function(res, n = -1, ...) {
  TRUE
})

#' Find the database data type associated with an R object
#' @export
setMethod("dbDataType", "SnowflakeConnection", function(dbObj, obj, ...) {
  TRUE
})

#' @export
setMethod("dbHasCompleted", "SnowflakeResult", function(res, ...) {
  TRUE
})
