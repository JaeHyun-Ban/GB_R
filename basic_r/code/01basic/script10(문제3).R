# ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 데이터가 포함되어
# 있습니다. midwest 데이터를 사용해 데이터 분석 문제를해결해보세요.
data(package = .packages(all.available = T))#모든 연습용 데이터 확인

library(ggplot2)
?midwest # ? 는 help명령어

# • Q01. ggplot2 의 Midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 (구조, 끝부분, 뷰 창, 차원, 요약)을 파악하세요.
temp <- as.data.frame(midwest)
temp
str(temp)
tail(temp)
View(temp)
dim(temp)
summary(temp)


9
# • Q02. poptotal(전체인구)을total로, popasian(아시아인구)을asian으로변수명을수정하세요.
head(temp, 0)

colnames(temp)[5] <- "total"
colnames(temp)[10] <- "asian"

# • Q03. total, asian변수를이용해'전체인구대비아시아인구백분율' 파생변수를만들고, 히스토그램을 만들어도시들이 어떻게 분포하는지살펴보세요.
temp$percent <- temp$asian / temp$total * 100 #백분율 구하기
hist(temp$percent)
mean(temp$percent)

# • Q04. 아시아인구백분율전체평균을구하고, 평균을초과하면"large", 그외에는"small"을부여하는 파생변수(group)을 만들어 보세요
temp$group <-  ifelse(temp$percent > mean(temp$percent), "large", "small")
temp

# • Q05. group의 빈도수를 확인하세요.

table(temp$group)





















