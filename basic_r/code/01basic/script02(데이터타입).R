# 자료형

# 숫자형변수
a <- 1
class(a)

a <- 3.14
class(a)

b <- "1"
class(b)

c <- c(1:10)
class(c)

d <- TRUE
class(d)

# 범주형 변수
e <- factor(c(1,2,3,2,2,2,1,3))
e

class(e)
levels(e)

##################################################
# 타입변환 함수 as.numeric(), as.charactor(), as.factor()

as.character(a)
as.character(c)
as.numeric(b)
as.factor(c)

# as.Date("2020") # 문자열 -> 날짜
class(as.Date("2020-01-01")) # 반드시 날짜 서식형태를 지켜야 한다

##################################################
# 객체형 데이터 타입
# vector- 한 가지 타입으로 생성된 변수
c(1,2,3,4,5)
c(1:10)
c(1,2,3, "park", "hong") # 혼합하면 전부 문자형으로 저장됨됨


# dataframe - 여러타입이 합쳐진 2차원 구조
data.frame(a = c(1,2,3),
           b = c("park", "hong", "kim"))
data.frame(a = c(1:3),
           b = c("park", "hong")) ##error: 길이를 통일시켜야 한다

# 행렬(metrix): 한가지 타입으로 만들어진 2차원구조조
matrix(c(1:6), nrow = 3, ncol = 2)#(변수, 차원구조(nrow:행, ncol: 열))
matrix(c(1:6), nrow = 2, ncol = 3)
matrix(c(1:6), nrow = 3, ncol = 3)# 모자란 경우에는 앞의 원소를 채워준다다

as.data.frame(matrix(c(1:6), nrow = 2, ncol = 3))# data.frame형태로 형변환

# Array - 다차원의 구조의 행렬(매트릭스가 합쳐진 구조)
array(c(1:15), dim = c(3,4,5)) #3행 4열 3차원

# list = 모든 요소를 담는 다차원 구조(쓸일이 거의 없음)
list(a = c(1:5),
     b = data.frame(a = c(1,2,3), b = c("kim", "lee", "choi")),
     c = matrix(c(1:6),nrow = 3, ncol = 2))
# 모든 형태를 다 모아서 저장할 수 있는 구조조

















