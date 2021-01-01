# 간단한 함수
# 숫자형 함수 sum(), mean(), max(), min(), median()

x <- c(1:10)
x

sum(x) # 합계
mean(x) # 평균
max(x) # 최대값
min(x) # 최소값
median(x) # 백터형의 가장 중앙값을 보여준다 5, 6사이 5.5(평균 아님)

# 결측값(NA)이 있다면 함수의 사용이 불가능
y <- c(1:10, NA, 11:20)#combine변수의 조합
y

#(na.rm = T(NA를 지울까요? = 네(true))
sum(y, na.rm = T) # 결측값은 제거하고 합계
mean(y, na.rm = T) # 결과가 안나올 때는 결측값을 예상해 제거해주고 계산하자


# 문자형 함수 nchar(), paste()
str1 <- "hello world"
str2 <-  "my name is ban"
str3 <-  c("a", "b", "c", "d", "e")

# ★nchar(): 문자열의 길이 확인
nchar(str1)
nchar(str2)
nchar(str3) # 1개, 1개, 1개... 각 원소들의 글자값을 확인

# paste(): 문자열 붙이기 함수수
paste(str1, str2)
paste(str1, 10, str2) # 문자와 숫자의 결합이 가능

# paste()
# sep = 옵션: separate(분리)
paste(str1, str2, sep = ",") # 문자열의 구분자를 직접지정(기본은 공백)
paste(str1, str2, sep = "-")

# combine형 변수에는 collapse옵션을 사용한다 
paste(str3, collapse = ",")

# 문자열 자르기(R은 1부터 시작)
str1
substr(str1, 7, 11) # 1~3번을 자르기
substr(str1, 7, nchar(str1))# nchar()와 함께 사용해보자
#str1 <- substr(str1, 1,2)


############################################################
## 패키지 설치
# .libPaths("경로..(영어로)")# 라이브러리 설치경로 변경 영어로
install.packages("ggplot2") # 그래프를 그려주는 패키지
library(ggplot2) # 라이브러리 로드 명령어어
############################################################

x <- c(1:10)
x <- c(1,1,1,2,2,3,4,5)
qplot(x)# 단순한 빈도 그래프 

# 패키지에는 연습용 데이터가 존재함
data

mpg # mpg:차량의 연비,구동타입, 이름, 생산년도, 기름 등등이 들어있는 데이터
mpg <- as.data.frame(mpg) # data,frame으로 변환
class(mpg) #자료형 확인

#qplot(): 단순한 데이터 형태를 확인할 때 사용
qplot(data = mpg, x = hwy) # 자동차 데이터의 고속도로 연비
qplot(data = mpg, x = cty) # 시내(일반도로)주행의 연비
qplot(data = mpg, x = drv) # 자동차 구동방식의 빈도

qplot(data = mpg, x = drv, y = cty)
qplot(data = mpg, x = cty, y = hwy)

qplot(data = mpg, x = drv, y = cty, geom = "line", color = drv)
qplot(data = mpg, x = drv, y = cty, geom = "boxplot", color = drv)
# boxplot: 어디에 중접으로 모여있는가, 그외는 점으로 표시된다

########################
# 다섯명의 시험점수를 가지고 있는 변수를  80, 54, 75, 34, 90
# 평균 합계 새로운 변수에 저장해서 확인
score <- c(80, 54, 75, 34, 90)
sum <- sum(score)
mean <- mean(score)
sum
mean














