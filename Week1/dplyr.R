library(readxl)
library(dplyr)

NBA_All_Star_Games <- read_excel("C:/Users/Acer/Downloads/NBA All Star Games.xlsx")
View(NBA_All_Star_Games)
write.csv(NBA_All_Star_Games, "NBA_All_Star_Games.csv", row.names = FALSE)

nba1 <- select(NBA_All_Star_Games, Player, Team)
write.csv(nba1, "nba1.csv", row.names = FALSE)

group1<-group_by(nba1,Player) %>%
  summarise(frequency=n())
write.csv(group1, "group1.csv", row.names = FALSE)

arrange1<-arrange(group1,desc(frequency))
write.csv(arrange1, "arrange1.csv", row.names = FALSE)

NBA_Drafts <- read_excel("C:/Users/Acer/Downloads/NBA Drafts.xlsx")
write.csv(NBA_Drafts, "NBA_Drafts.csv", row.names = FALSE)

nbadata1 <- select(NBA_Drafts,Player,FG,TP,Points,TotalRebounds,Assists)
write.csv(nbadata1, "nbadata1.csv", row.names = FALSE)

total_nba1<-merge(group1,nbadata1,by="Player")
write.csv(total_nba1, "total_nba1.csv", row.names = FALSE)

library(dplyr)
filterData <- filter(total_nba1, frequency >= 3)
write.csv(filterData, "filterData.csv", row.names = FALSE)

filterData %>% 
  summarise(avg_FG = mean(FG), avg_TP = mean(TP),avg_Points = mean(Points),
            avg_TotalRebounds = mean(TotalRebounds),avg_Assists = mean(Assists))

