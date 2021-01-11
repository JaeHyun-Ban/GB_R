# job_code는 직업번호로 구분되어 있다
# readxl패키지를 사용해서 excel을 읽어옵니다. sheet = 2번
table(data$job_code)

library(readxl)
job_list <- read_excel("data/Koweps_Codebook.xlsx", sheet = 2) # 2번 시트만 읽어오기
table(job_list)

# 1.전처리
# left_join(기준데이터, 조인데이터, by = 키),(bind_join()도 잊지 말 것)
data
job_list
data <- left_join(data, job_list, by = c("job_code" = "code_job")) # 키가 다른경우

# 2. 분석하기
# income and job이 NA가 아닌 데이터를 가지고 처리
d4 <- data %>% 
  filter(!is.na(income) & !is.na(job)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
d4
ggplot(d4, aes(x = reorder(job, mean_income), y = mean_income, fill = job )) + 
  # fill하니까 보기좋고 예쁘네
  geom_col() + 
  coord_flip() + # 보기 좋게 돌려주기(z - 플립)
  labs(title = "직업별 급여", x = "직업", y = "급여평균")
  



































