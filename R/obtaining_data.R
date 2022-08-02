library(rtweet)

# @jumping_uk timeline
get_timeline('jumping_uk', n = 2000)

# #rstats timeline
search_tweets('#rstats', n = 5000)

# @jumping_uk retweeters
morning = jr_timeline %>%
  filter(hour_posted <= 13)
afternoon = jr_timeline %>%
  filter(hour_posted > 13)

am_rt = c()
pm_rt = c()

for(i in 1:nrow(morning)){
  am_rt = append(am_rt, c(get_retweeters(morning$status_id[i])$user_id))
}

for(i in 1:nrow(afternoon)){
  pm_rt = append(pm_rt, c(get_retweeters(afternoon$status_id[i])$user_id))
}

morning_retweeters = lookup_users(am_rt)
afternoon_retweeters = lookup_users(pm_rt)
