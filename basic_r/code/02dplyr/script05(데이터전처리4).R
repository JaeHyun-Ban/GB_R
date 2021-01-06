# 데이터 프레임을 가로로 합치기 left_join(데이터세트, 데이터세트, 연결키)
# 연결가능한 동일키가 존재해야 한다
library(dplyr)

d1 <- data.frame(class = c(1:5),
           teacher = c("park", "hong", "choi", "lee", "kim"))
d2 <- data.frame(teacher = c("park", "hong", "choi", "lee", "kim"),
                 subject = c("math", "kor", "science", "english", "society"))
d1
d2

left_join(d1, d2, by = "teacher") # teacher키로 연결

# 열이름이 다른경우
# 열이름을 바꾸는 방법1
colnames(d2)[1] <- "ttt"

# 열이름을 바꾸는 방법2
#rename(데이터세트, 바꿀컬럼명 = 기존컬럼명)
# rename(d2, "ttt" = "teacher")

# 열이름이 다른경우 강제연결
left_join(d1, d2, by = c("teacher" = "ttt"))


# 행개수가 다르더라도 가능
data <- read.csv("data/excel_exam.csv")
class(data)
d1
new_data <- left_join(data, d1, by = "class")
new_data

#================================================
# 데이터프레임을 세로로 합치기 bind_rows(데이터세트, 데이터세트)
d3 <- data.frame(id = c(1:5), test1 = seq(60, 100, by = 10))
d3
# runif(갯수): 난수 생성성
d4 <- data.frame(id = c(6:20), test1 = ceiling(runif(15) * 10)) 
d4
bind_rows(d3, d4)

?dplyr













