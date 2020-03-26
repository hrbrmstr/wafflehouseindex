
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/wafflehouseindex.svg?branch=master)](https://travis-ci.org/hrbrmstr/wafflehouseindex)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# wafflehouseindex

Compute the Waffle House Index Value Based on Current Closed Location
Data

## Description

The Waffle House Index was one of a series of metrics used by a former
FEMA directory to gauge the severity of disasters. If a Waffle House
closes, you know you’re hosed. Tools are provided to retrieve closure
information and compute the Waffle House Index.

## What’s Inside The Tin

The following functions are implemented:

  - `whi_compute`: Compute the Waffle House Index from list of
    open/closed stores
  - `whi_get_loc_info`: Retrieve the current info on all Waffle House
    locations
  - `whi_loc_list`: Retrieve main list of WH locations

## Installation

``` r
remotes::install_gitlab("hrbrmstr/wafflehouseindex")
# or
remotes::install_github("hrbrmstr/wafflehouseindex")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(wafflehouseindex)

# current version
packageVersion("wafflehouseindex")
## [1] '0.2.0'
```

## wafflehouseindex Metrics

| Lang | \# Files |  (%) | LoC | (%) | Blank lines | (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | --: | ----------: | --: | -------: | ---: |
| R    |        7 | 0.88 |  73 | 0.9 |          35 | 0.7 |       41 | 0.59 |
| Rmd  |        1 | 0.12 |   8 | 0.1 |          15 | 0.3 |       28 | 0.41 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
