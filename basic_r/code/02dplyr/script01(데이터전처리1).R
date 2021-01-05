'''
데이터 전처리 패키지 - 분석전 필요한 부분을 정렬이나 편집하는 작업
행 추출 - filter(데이터세트, 조건)
'''
.libPaths()
install.packages("dplyr")
library(dplyr)

data <- read.csv("data/excel_exam.csv")
data

d1 <- filter(data, class == 1) #(데이터, 조건): 다시 새로운 데이터 프레임형태로 반환(중요)
d1 # 데이터 프레임 형태라 또 가공이 가능하다(중요)
mean(d1$math)

d2 <- filter(data, class != 3)#class가 3이아닌 행들
d2

d3 <- filter(data, math >= 50)
d3

d4 <- filter(data, class == 2 & english >= 80)
d4

# %in% - 매칭되는 데이터를 찾을 때 사용한다
d5 <- filter(data, class %in% c(1,3,5)) # class가 1,3,5인 데이터들
class(d5)
d5

d6 <- filter(data, math %in% c(30:70))
d6

## 데이터 가공을 순차적으로 실행해주는 파이프라인
## 단축키 ctrl + shift + m 
ex1 <- filter(data, class != 1) # class가 1이 아닌
ex1

ex2 <- filter(ex1, math >= 50) #ex1에서 math가 50이상
ex2

ex3 <- filter(ex2, id %% 2 == 0) #ex2에서 아이디가 짝수인
ex3

## 파이프라인 적용
## mean은 dataframe을 넘기는 함수형태가 아니기 때문에 아래처럼은 사용이 불가능함
# ex4 <- data %>% 
#   filter(class != 1) %>% 
#   filter(math >= 50) %>% 
#   filter(id %% 2 == 0) %>% 
#   mean(science)
?mean 






















