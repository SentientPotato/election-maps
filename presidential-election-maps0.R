## Load packages
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(usmap)
## Read in data (available at https://doi.org/10.7910/DVN/42MVDX)
dat = read_csv("1976-2020-president.csv")
## Get two-party voteshare by state-year
dat = dat %>%
    filter(party_simplified %in% c("DEMOCRAT", "REPUBLICAN")) %>%
    group_by(state, year) %>%
    mutate(total = sum(candidatevotes)) %>%
    filter(party_simplified == "DEMOCRAT") %>%
    summarise(twoparty = candidatevotes / total) %>%
    distinct()
## For each election, generate a map
cap = "Figure by Sentient Potato (Twitter: @SentientPotato6)\n"
URL = "github.com/SentientPotato/election-maps"
cap = paste0(cap, "Code to reproduce at ", URL)
for ( election in unique(dat$year) ) {
    tmp = dat %>% filter(year == election)
    plt = plot_usmap(data = tmp, values = "twoparty") +
        scale_fill_gradient2(
            high = "dodgerblue4",
            low  = "firebrick3",
            midpoint = 0.5
        ) +
        labs(title = election, caption = cap) +
        theme(
            legend.position = "none",
            plot.background = element_rect(fill = "white", color = "white"),
            plot.caption = element_text(color = "#5f5f5f", hjust = 0, size = 6)
        )
    ggsave(
        filename = paste0(election, "map.png"),
        plot = plt,
        device = "png", width = 1200 / 300, height = 675 / 300
    )
}
