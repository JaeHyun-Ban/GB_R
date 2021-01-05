# 데이터 추출
library(ggplot2)
mpg <- as.data.frame(mpg)

# 인덱싱을 활용한 데이터 추출
# 변수명[행, 열]
mpg
mpg[3, ]#3행 추출
mpg[15, ]#15행추출
mpg[1:6, ]# 1~6행 추출
mpg[c(2,4,6), ] #2,4,6행만 추출(combine로 묶어준다)
mpg[c(1:6, 8, 10), ] #1~6, 8, 10행만 추출

# 인덱싱을 활용한 데이터 열추출
mpg[,3] #3열 추출(벡터형으로 반환)
mpg[, 7] #7열 추출
mpg[,1:6] #1~6열 추출출
mpg[, c(1:6, 8, 10)] 
## 나중에 데이터가 너무 크면 특정 열을 뽑아도 뭔지 모른다
mpg[, "model"] # model열만 추출
mpg[, c("model", "class")] # model, class 열만 추출

# 인덱싱을 활용한 데이터 행영추출
head(mpg)
mpg[1,3]
mpg[1:3, 2:3]
mpg[4:6, c("displ", "year", "trans")]

# 주의
# 데이터프레임에서 컬럼이 1개인 경우에는 vector형으로 결과가 나온다
mpg[1:3, 1]
mpg[1:3, "model"]

###############################################
# 데이터 프레임에서 특정행에 대한 결과를 보려면 $컬럼명을 사용
mpg$manufacturer # == mpg[, "manufacturer"]
mpg$model
mpg$year
mpg$class == "suv" # class가 suv인 벡터를 T,F로 반환

# $연산을 이용해서 조건에 충족하는 행 추출
mpg$model 
mpg[mpg$model == "a4",] # 모델이 a4인 행
mpg[mpg$year >= 2000, ] # 생산년도(year)가 2000이후
mpg[mpg$cty >= 20, ] #도로연비(cty)가 20이상인 행
mpg[mpg$cty >= 20 & mpg$hwy >= 30,] # &는 and로 사용

##############################################################
# quiz생성
quiz <- data.frame(product = c("사과", "딸기", "수박"), 
                   price = c(1800, 1500, 3000), 
                   order = c(24, 38, 13)) # 컬럼명 = 값, 컬럼명 = 값
quiz


# 과일가격평균, 판매량합계, 평균
sum(quiz$price)
mean(quiz$price)

sum(quiz$order)
mean(quiz$order)

















