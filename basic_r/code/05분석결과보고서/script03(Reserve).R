install.packages("Rserve")
library(Rserve)
Rserve(FALSE, port = 6311, args = '--RS-encoding utf8 --no-save --slave --encoding --internet2')
Rserve(args = "--RS- encoding utf8")

# png - java
setwd('C:\\Users\\Win10\\Desktop\\Backup\\국비반자료\\upload')
library(ggplot2)
mpg <- as.data.frame(mpg)
png(width = 500, height = 500, filename = '파일이름.png')
ggplot(mpg, aes(x = class, fill = class)) + geom_bar()
graphics.off()

# R도 프로그램언어라 출력구문이 가능
print("출력문~~~~~~~~~~~")
setwd('C:\\Users\\Win10\\Desktop\\Backup\\국비반자료\\upload')
library(ggplot2)
mpg <- as.data.frame(mpg)
print(png(width = 500, height = 500, filename = '파일이름1.png'))
print(ggplot(mpg, aes(x = class, fill = class)) + geom_bar())
print(graphics.off())


##### 파이프라인 -> 자바(png 출력)
library(ggplot2)
library(dplyr)
d1 <- as.data.frame(mpg) %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy))

print(png(width = 500, height = 500, filename = 'd1.png'))
print(ggplot(d1, aes(x = reorder(manufacturer, -mean_hwy), y = mean_hwy, fill = manufacturer)) +
  geom_col() + 
  coord_flip())
print(graphics.off())






























