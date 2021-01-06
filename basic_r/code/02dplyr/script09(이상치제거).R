# 이상한값 처리하기
# 논리적으로 이상한 값_ex)남,녀, 3(?)
# 상하위 0.3%를 벗어나면 극단치(이상한값)

d1 <- data.frame(gender = c(1,2,1,1,3),
                 score = c(12, 43, 65, 54, 23))
d1
table(d1$gender) # 일반적인 빈도보다 확연히 적다면, 이상치로 판단합니다
# 이상치를 NA값으로 변경
d1$gender <- ifelse(d1$gender == 3, NA, d1$gender)
d1

# NA를 filter로 제외하고 사용
d1 %>% 
  filter(!is.na(gender)) %>% 
  group_by(gender) %>% 
  summarise(gender_mean = mean(score))


# 극단값인 경우 제거할 것
# boxplot(컬럼)
boxplot(mpg$hwy) #초과하는 위치에 점이 존재함
boxplot(mpg$hwy)$stats # 극단치가 12, 37인 것을 확인

# 극단치 경계가 12미만, 37초과 데이터는 NA처리
mpg$hwy <-  ifelse(mpg$hwy > 37 | mpg$hwy < 12, NA, mpg$hwy)
table(is.na(mpg$hwy))

# 다시 새 값을 가져오기
rm(mpg)
mpg <- as.data.frame(mpg)

table(mpg$hwy)
table(is.na(mpg$hwy))

# NA처리한 것은 제거하고 분석
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_der = mean(hwy)) %>% 
  arrange(desc(mean_der))
  
# 숙제 옆에 문제풀기네
mpg <- as.data.frame(mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3,4,39,42)
boxplot(mpg$cty)
mpg$drv

# Q1
# .drv에 이상치가 있는지 확인 합니다. 이상치를 결측치로 처리한 다음 확인하세요.




















