'''
선그래프(시계열): 일정시간을 두고 변화를 표현할 때 사용
'''
library(ggplot2)
eco <- as.data.frame(economics)
eco
head(eco, 1)

?economics 
#psavert: 저축률, uempmed: 실업기간간
ggplot(eco, aes(x = date, y = psavert)) + 
  geom_line(color = "red")

ggplot(eco, aes(x = date, y = uempmed)) + 
  geom_line(color = "blue")

# 생성한 날짜를 이용해 시계열 그래프 생성
# 일별 연속 날짜 생성
start <- as.Date("1990-01-01")
end <- as.Date("2020-12-01")

date_set1 <- seq(start, end, by = 1)

# 월별 연속 날짜 생성
date_set2 <- seq(start, end, by = "month")
date_set2

# 연별 연속 날짜 생성
date_set3 <- seq(start, end, by = "year")
date_set3

# 월별 날짜를 이용한 시계열 그래프
date <- seq(as.Date("2000-01-01"), as.Date("2020-12-01"), by="month")
date
length(date)

# runif(갯수): 0~1사이 랜덤수를 갯수만큼 생성
runif(10)
# 데이터가 벡터이므로 데이터의 숫자 = 벡터의 길이
num <- ceiling(runif(length(date)) * 10) 

# 시계열 그래프로 사용할 수 있는 데이터세트
df <- data.frame(date, num)
# 날짜별 데이터 프레임
ggplot(df, aes(x = date, y = num)) + 
:  geom_line()

#================================================
# 상자 그래프
ggplot(mpg, aes(x = drv, y = hwy)) + 
  geom_boxplot()
# 클래스별
ggplot(mpg, aes(x = class, y = hwy)) + 
  geom_boxplot()
# 제조사 별
ggplot(mpg, aes(x = manufacturer, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

# 그래프의 사용방법이 궁금할때는? > cheatsheets
# > Data Visualization with ggplot2
# https://rstudio.com/resources/cheatsheets/
?help




















