# 앞에서 data이름으로 전처리를 마친 후 확인
data

# 1. 결측치 확인
table(is.na(data$birth))

# 2. birth컬럼을 이용한 age파생변수 생성
data$age <- 2021 - data$birth + 1
data

# 3. 나이에 따른 월급 평균도
table(is.na(data$income))

data %>% 
  filter(!is.na(age) & !is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  ggplot(aes(x = age, y = mean_income)) + geom_col()

# 연령대에 따른 급여 ####
# 1. age를 이용해서 연령대 파생변수 생성
data <- data %>% 
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age < 60, "middle", "old")))

# 2. 분석처리
d2 <- data %>% 
  filter(!is.na(income) & !is.na(ageg)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
# 3. 시각화
ggplot(d2, aes(x = ageg, y = mean_income)) + 
  geom_col() + 
  labs(title = "연령대별 급여평균", x = "연령대", y = "급여평균") + 
  scale_x_discrete(limits = c("young", "middle", "old")) # x축 순서 -> y, m, o순으로 정렬


# 실습 ####
# 연령대 및 성별에 따른 급여 차이 막대그래프
data$ageg
data$gender <- ifelse(data$gender == 1 ? "male", "female")
d3 <- data %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, gender) %>% 
  summarise(mean_income = mean(income))


ggplot(d3,aes(x = ageg, y = mean_income, fill = gender)) + 
  geom_col(position = "dodge") + # 그래프 분리
  scale_x_discrete(limits = c("young", "middle", "old")) + 
  labs(title = "연령대 및 성별에 따른 급여", x = "연령대", y = "급여평균")






























