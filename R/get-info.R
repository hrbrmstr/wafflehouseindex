.whi_get_loc_info <- function() {

  wfi_locs <- wfi_loc_list()

  batches <- sapply(split(wfi_locs$id, ceiling(seq_along(wfi_locs$id)/50)), paste0, collapse = ",")

  lapply(batches, function(.x) {

    httr::GET(
      url = "https://locations.wafflehouse.com/api/587d236eeb89fb17504336db/locations-details",
      .WHI_UA,
      httr::add_headers(
        `Referer` = "https://locations.wafflehouse.com/"
      ),
      query = list(
        locale= "en_US",
        clientId = "56fd9c824a88871f1d26062a",
        ids = .x
      )
    ) -> res

    Sys.sleep(0.05)

    res

  }) -> out

  o1 <- lapply(out, httr::content, as = "text")
  o2 <- lapply(o1, geojsonsf::geojson_sf)

  cols <- sapply(o2, colnames)

  all_cols <- sort(unique(unlist(cols)))

  lapply(o2, function(.x) {

    xcols <- colnames(.x)

    if (!("metaMetaLocationName" %in% xcols)) {
      .x$metaMetaLocationName <- NA_character_
    }

    if (!("metaBranchId" %in% xcols)) {
      .x$metaBranchId <- NA_character_
    }

    if (!("metaOperatedBy" %in% xcols)) {
      .x$metaOperatedBy <- NA_character_
    }

    if (!("metaPaymentMethods" %in% xcols)) {
      .x$metaPaymentMethods <- NA_character_
    }

    .x

  }) -> o3

  loc_df <- do.call(rbind, o3)

  # lapply(o3, function(.x) {
  #   setdiff(all_cols, colnames(.x))
  # })

  whidx_df <- loc_df[, "geometry"]
  whidx_df$status <- ifelse(nchar(loc_df$specialHoursOfOperation) == 2, "Open", "Closed")
  whidx_df$date <- Sys.Date()

  whidx_df

}

#' Retrieve the current info on all Waffle House locations
#'
#' @note this function is memoised since you're hitting a hidden API a few dozen times.
#' @export
whi_get_loc_info <- memoise::memoise(.whi_get_loc_info)
