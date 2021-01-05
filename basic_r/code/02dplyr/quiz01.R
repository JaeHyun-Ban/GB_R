# ggplot2에 있는 mpg 데이터를 이용해 분석 문제를 해결해 보세요.
library(ggplot2)
mpg <- as.data.frame(mpg)
# • Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 파이프라인을 이용해서 알아보세요.
displ4 <- mpg %>% 
  filter(mpg$displ <= 4)
mean(displ4$hwy)

displ5 <- mpg %>% 
  filter(mpg$displ >= 5)
mean(displ5$hwy)

round(mean(displ4$hwy), 2) # 반올림 2자리

# • Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi“ 제조년월이 2000년 이상인 데이터의 cty 합계, 평균을 구하세요

audi <- mpg %>% 
  filter(manufacturer %in% "audi") %>% 
  filter(year >= 2000 )
sum(audi$cty)
mean(audi$cty)


# • Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요
table(mpg$manufacturer)
x1 <- mpg %>% 
  filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(x1$hwy)






















