# 데이터 병합 cbind(), rbind()
library(ggplot2)
mpg <- as.data.frame(mpg)

aaa <- mpg[1:3, 1:4]
bbb <- mpg[11:13, 1:4]

aaa
bbb

cbind(aaa, bbb) #컬럼병합(그냥 옆으로)
rbind(aaa, bbb) #행병합(세로로 병합)

# 주의 
# cbind()은 행의 개수가 반드시 일치해야 함
# rbind()은 열의 개수가 반드시 일치

ccc <- mpg[1:2, 1:5]
ddd <- mpg[1:3, 1:5]

cbind(aaa, ccc) #에러
rbind(aaa, ddd) #에러

# 열 데이터의 빈도수
table(mpg$model) #model데이터의 빈도수
table(mpg$year)
table(mpg$manufacturer)

# 열데이터를 여러개 넣으면 다차원으로 빈도수 확인
table(mpg$manufacturer, mpg$year)


#hist(빈도수): 간략한 표 형태로 표현
hist(table(mpg$year))
hist(table(mpg$model))
hist(table(mpg$manufacturer))


























