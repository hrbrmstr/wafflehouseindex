#' Compute the Waffle House Index from list of open/closed stores
#'
#' @param whi pass in a pre-gathered list of Waffle House stores (with [whi_get_loc_info()]) or let it compute it for you.
#' @export
whi_compute <- function(whi = whi_get_loc_info()) {

  res1 <- table(whidx_df$status)
  res1/sum(res1)

}