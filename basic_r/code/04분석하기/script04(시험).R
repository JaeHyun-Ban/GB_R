library(ggplot2)
library(dplyr)

house <- read.csv("data/주택도시보증공사_전국 평균 분양가격(2020년 2월).csv")
class(house)

house <- rename(house, 
       "region" = "지역명",
       "area" = "규모구분",
       "year" = "연도",
       "month" = "월",
       "price" = "분양가격...")

house <- house %>% 
  mutate(area_lv = 
  ifelse(area == "전용면적 60㎡이하", "A",
         ifelse(area == "전용면적 60㎡초과 85㎡이하", "B" ,
                ifelse(area == "전용면적 85㎡초과 102㎡이하", "C",
                       ifelse(area == "전용면적 102㎡초과", "D", NA)))))

# area가 '전체'인 구역 제거
house <- house %>% 
  filter(!is.na(area_lv))


head(house, 10)
  
  
house$area <- filter(!is.na(house$area))

table(is.na(house$region))
table(is.na(house$area))
table(is.na(house$year))
table(is.na(house$month))
table(is.na(house$price)) # price에 결측치가 존재

# [문항4]  지역별 평당 분양가격 전체 평균을 구하고 막대그래프로 시각화하여 제출하세요
house %>% 
  filter(!is.na(price)) %>%  # 결측치 제거
  group_by(region) %>% 
  summarise(mean_price = mean(price)) %>% 
  ggplot(aes(x = reorder(region, -mean_price), y = mean_price, fill = region)) + 
  geom_col() + 
  labs(title = "지역별 전체평균", x = "지역", y = "평당분양가격평균")

# [문항5] 2016, 2017, 2018, 2019년의 연도별,지역별 분양가격평균을 막대그래프로 시각화하여 제출하세요
head(house)
house %>% 
  filter(year %in% c(2016, 2017, 2018, 2019)) %>% 
  filter(!is.na(price)) %>%  # 결측치 제거
  group_by(region, year) %>% 
  summarise(mean_price = mean(price)) %>% 
  ggplot(aes(x = year, y = mean_price, color = region)) + 
  geom_col(position = 'dodge') + 
  labs(title = "연도별 지역평균", x = "연도", y = "평당분양가격평균", color = "지역")


# [문항6] 2019년 서울지역의 '월별' 분양가격 평균 변화 추이를 시계열그래프로 시각화하여 제출하세요
head(house, 100)
table(is.na(house$month))

d1 <- house %>% 
  filter(!is.na(price)) %>% 
  filter(year == 2019) 

house %>% 
  filter(year %in% 2019 & !is.na(price) & region %in% "서울") %>% 
  group_by(month) %>% 
  summarise(mean_price = mean(price)) %>% 
  ggplot(aes(x = month, y = mean_price)) + 
  geom_line() + 
  labs(title = "2019년 서울지역 월별 평균변화", x = "월", y = "평당분양가격평균")

# 문항7]  연도별 아파트 평당분양가 변화동향을 시계열그래프로 시각화하여 제출하세요.
house %>% 
  filter(!is.na(price)) %>% 
  group_by(year) %>% 
  summarise(mean_price = mean(price)) %>% 
  ggplot(aes(x = year, y = mean_price)) + 
  geom_line()

d2 <- house %>% 
  filter(!is.na(price) & region %in% "서울") %>% 
  group_by(year, month) %>% 
  summarise(mean_price = mean(price))

d2 <- as.data.frame(d2)
d2
d2 %>% 
  mutate(date = year + month)
start <- as.Date("2015-10-01")
end <- as.Date("2020-02-01")
date_set <- seq(start, end, by = "month")
date_set <- as.data.frame(date_set)
date_set

d2 <- cbind(d2, date_set)
d2

d2 %>% 
  ggplot(aes(x = date_set, y = mean_price)) + 
  geom_line(color = "red") +
  geom_hline(yintercept = mean(d2$mean_price), color = "green") + 
  labs(title = "연도별 아파트분양가 변화동향", x = "연도", y = "평균분양가격평균")
  




















