library(tidyverse)

df <- read_csv('results-20171027-131122.csv')
df <- df %>% arrange(value, form_factor, effective_connection_type)

ggplot(df, aes(x=origin, y=value/1000, color=form_factor)) %+% 
  geom_point() %+% 
  facet_grid(form_factor~effective_connection_type) %+%
  scale_y_log10(labels=comma) %+%
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  %+% 
  labs(title="99'th percentile of First Contentful Paint", x="Origin", y="First Contentful Paint (s)")

