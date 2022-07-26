#early retweeters

morning = jr_timeline %>%
  filter(hour_posted <= 13)
am_rt = c()

for(i in 1:nrow(morning)){
  am_rt = append(am_rt, c(get_retweeters(morning$status_id[i])$user_id))
}

am_retweeters = lookup_users(am_rt)

#later retweeters

afternoon = jr_timeline %>%
  filter(hour_poste > <= 13)
pm_rt = c()

for(i in 1:nrow(afternoon)){
  pm_rt = append(pm_rt, c(get_retweeters(afternoon$status_id[i])$user_id))
}

pm_retweeters = lookup_users(pm_rt)