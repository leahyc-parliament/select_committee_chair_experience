library(httr2)
library(dplyr)

# FETCHING LIST OF ALL COMMITTEES AND ID'S

# all select committees, current & former.
commmittees_url <- "https://committees-api.parliament.uk/api/Committees?CommitteeStatus=All&CommitteeCategory=Select&Take=1"

committees_response <- request(commmittees_url) |> 
  req_perform() |> 
  resp_body_json()

committee_list <- tibble(
  name = sapply(response$items, function(x) x$name),
  house = sapply(response$items, function(x) x$house),
  committee_id = sapply(response$items, function(x) x$id)
  )

committee_ids <- committee_list$committee_id
