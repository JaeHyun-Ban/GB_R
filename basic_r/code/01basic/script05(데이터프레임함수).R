## 데이터프레임 함수
library(ggplot2) 

mpg

mpg <- as.data.frame(mpg)
class(mpg)
mpg

## 데이터프레임 앞부분 확인
head(mpg)
head(mpg, 20)# 앞부분 20행만 가져옴

tail(mpg)
tail(mpg, 20) # 끝에서 20행 가져옴

## 테이블 구조로 데이터 확인
View(mpg)


## 데이터 프레임의 구조 확인 str(), dim(), nrow(), ncol()
str(mpg) # 구조 확인
dim(mpg) #234행 11열(행, 열을 한번에 확인)
nrow(mpg) #234행
ncol(mpg) #11열

# summary(): 요약통계 산출
summary(mpg)
# 사분위수: 데이터를 동이랗게 사등분해서 나온 위치
#통계학에서 신뢰할 수 있는 데이터 구간은 4분위 수(그 이외는 신뢰하기 힘듦)
# 사(4)분위로 나누면 3등분이 되겟죠? |----|----|----| 이거임
#1st Qu.: 4분위로 나눌때 1분위
#median: 4분위 중 가운데(2)분위
#mean: 2분위의 중앙값

colnames(mpg) # 열 이름만 추출
rownames(mpg) # 행 이름만 추출

































