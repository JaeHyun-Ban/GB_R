# 01
library(ggplot2)
mpg <- as.data.frame(mpg)
class(mpg)

# 02 컬럼명 수정: colnames
colnames(mpg)[8:9] <- c("city", "highway")
colnames(mpg)

# 03 복사본 데이터를 이용해서 cty + hwy/2의 total컬럼을 만드세요
mpg$total <- (mpg$city + mpg$highway) / 2
mpg

# 04 컬럼 total의 평균을 출력하세요
mean(mpg$total)

# 05 total에 따른 파생변수 test를 생성합니다(조건: total >= 20이상 PASS 나머지 FAIL)
mpg$test <- ifelse(mpg$total >= 20, "PASS", "FAIL")
test

# 06 total에 따른 파생변수 grade를 생성합니다(24이상 A, 20이상 B, 나머지는 C)
mpg$grade <- ifelse(mpg$total >= 24, "A", ifelse(mpg$total  >= 20, "B", "C"))
grade

# 07 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해보세요, 아래와 같은 결과물이 출력되어야 한다

head(mpg, 6)

