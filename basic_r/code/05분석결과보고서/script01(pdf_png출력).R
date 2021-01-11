# http://rstudio-pubs-static.s3.amazonaws.com/13946_b80e36b88ac1470197dbdd1c99f479a4.html

# 1. 작업폴더 확인
getwd() # R의 작업경로 확인
setwd("C:\\Users\\Win10\\Desktop\\Backup\\국비반자료\\upload") # 작업폴더 변경

# 2. png로 결과를 이미지로 출력하기
library(ggplot2)
mpg <- as.data.frame(mpg)
mpg
## png가 사용하기에 편함
png(width = 500, height = 500, filename = "test.png") # 1.png파일 경로선언
ggplot(mpg, aes(x = drv, fill = drv)) + 
  geom_bar() # bar = 누적 막대차트/ 2. 출력결과를 시각화
graphics.off() # 3. 그래픽 써내리기

# 3. PDF로 결과물 출력하기
pdf(file = "test.pdf") #1.pdf파일 경로 선언
ggplot(mpg, aes(x = drv, fill = drv)) +
  geom_bar()
graphics.off()


install.packages("tinytex")
library(tinytex)























