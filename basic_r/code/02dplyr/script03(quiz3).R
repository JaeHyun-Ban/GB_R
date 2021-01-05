library(ggplot2)
mpg <- as.data.frame(mpg)
class(mpg)
mpg
# Q1. mpg데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만들고 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)만 추출합니다.
x1 <- mpg %>% 
  select(class, cty) 
x1
x1 %>% 
  filter(class %in% "suv") 
mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))
  
# Q2. audi에서 생산한 자동차 중에 중 hwy가 1~5위에 해당하는 자동차의 (제조사, 모델, 년도, hwy)데이터만 출력하세요.

mpg %>% 
  filter(manufacturer %in% "audi") %>% 
  arrange(desc(hwy)) %>% 
  select(manufacturer, model, year, hwy) %>% 
  head(5) # 5위까지 출력

# ===========================================================================
# Q1. mpg 데이터 복사본을 만들고, cty 와 hwy 를 더한 '합산 연비 변수'를 추가.
z1 <- mpg %>% 
  mutate(total = cty + hwy)
z1

# Q2. 앞에서 만든 '합산 연비 변수'를 2 로 나눠 '평균 연비 변수'를 추가.
z1 <- z1 %>% 
  mutate(avg = total / 2)
z1

# Q3. '평균 연비 변수'가 가장 높은 자동차 5순위 데이터를 출력.
z1 %>% 
  arrange(desc(avg)) %>% 
  head(5) # 5위까지 출력


# Q4. 원본 데이터를 이용해서 1~3 번 문제에 더하여 avg가 35이상이면 high, 
# 35미만이면 row를 추가하는 파이프라인으로 한번에 처리하는 구문을 완성하세요.
z1 %>% 
  mutate(grade = ifelse(avg >= 35, "high", "row")) %>% 
  arrange(desc(avg))
z1

























