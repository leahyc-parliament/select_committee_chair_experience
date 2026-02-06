library(httr2)
library(dplyr)

# FETCHING LIST OF ALL COMMITTEES AND ID'S

# all select committees, current & former.
commmittees_url <- "https://committees-api.parliament.uk/api/Committees?CommitteeStatus=All&CommitteeCategory=Select&Take=20"

committees_response <- request(commmittees_url) |> 
  req_perform() |> 
  resp_body_json()

committee_list <- tibble(
  name = sapply(committees_response$items, function(x) x$name),
  house = sapply(committees_response$items, function(x) x$house),
  committee_id = sapply(committees_response$items, function(x) x$id)
  )

committee_ids <- committee_list$committee_id


# FETCHING LIST OF ALL COMMITTEE CHAIRS AND MNIS ID'S
# use committee_ids to return list all committee members
# filter list by is_chair = TRUE
# return tibble of chair names and mnis ID
# create list of mnis ID's

# FETCHING CHAIR BIOGRAPHIES
# use mnis ID's to return biographies for all chairs 
# process biographies (mini dashboard? stand alone visualisations?) - tbd
# pathway from election, junior minister to more senior roles with time