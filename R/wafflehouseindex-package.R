#' Compute the Waffle House Index Value Based on Current Closed Location Data
#'
#' The Waffle House Index was one of a series of metrics used by a former FEMA directory to gauge
#' the severity of disasters. If a Waffle House closes, you know you're hosed. Tools are provided to retrieve
#' closure information and compute the Waffle House Index.
#'
#' @md
#' @name wafflehouseindex
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import httr
#' @importFrom geojsonsf geojson_sf
#' @importFrom xml2 read_html
#' @importFrom rvest html_node html_text
#' @importFrom jsonlite fromJSON
"_PACKAGE"
