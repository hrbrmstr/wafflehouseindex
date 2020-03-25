#' Retrieve main list of WH locations
#'
#' @export
wfi_loc_list <- function() {

  httr::GET(
    url = "https://locations.wafflehouse.com",
    .WHI_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- xml2::read_html(out)

  rvest::html_node(out, xpath = ".//script[contains(., 'window.__SLS_REDUX_STATE__')]") %>%
    rvest::html_text() -> places

  places <- sub('^.*"dataLocations":', '', places)
  places <- sub(',"uiLocationsList".*$', '', places)
  places <- sub('^\\{"collection":', '', places)

  geojsonsf::geojson_sf(places)

}
