# 열 추출하기 select(데이터세트, 열...)


library(dplyr)
data = read.csv("data/excel_exam.csv")
data
class(data)

select(data, id)
select(data, id, math, english) #여러행 셀렉트
select(data, -id)# 행 제외
select(data, -id, -class)# 여러행 제외

## 반환이 data.frame이라 파이프라인 작성이 가능하다

# 클래스가 1~3인 행 데이터의 수,영,과 컬럼만 조회(파이프 라인)
data %>% 
  filter(class %in% c(1:3)) %>% 
  select(math, english, science) %>% 
  head(10) #head는 파이프라인의 마지막에 사용해준다


#################################################
# 열 정렬하기 arrange(데이터세트, 열...)
# 내림차순 정렬을 하고 싶다면 desc(열)를 이용한다

arrange(data, math) # data를 math기준 정렬렬
arrange(data, desc(id))# id기준 내림차순
arrange(data, class, math)#클래스 오른차순, math오름차순순
arrange(data, desc(class), id)

data %>% 
  filter(class %in% c(1:3) ) %>% 
  select(id, math) %>% 
  arrange(desc(math))

#########################################
#기존의 열 추출방법(기존 dataset이 무조건 변함)
data$test <-data$math + data$english + data$science
data

# 기존 열에 대하여 새로운 열 추가 mutate(데이터세트, 열 = 기준열)
d1 <- mutate(data, total = math + english + science)
data # 기존데이터는 실제로 변하지는 않음(저장 필요)
d1

# 여러행을 한번에 생성하기
d2 <- mutate(data, total = math + english + science,
             avg = (math + english + science) / 3,
             test = "hello")
d2

###################
# 조건에 따른 파생변수 추가
d3 <- mutate(d2, exam_result = ifelse(avg >= 60, "pass", "fail"))
d2

# 파이프라인으로 한번에 작성하기(total, avg, exam_result)변수
data <- read.csv(("data/excel_exam.csv"))
data
result <- data %>% 
  mutate(total = math + english + science,
         avg = (math + english + science) / 3) %>% 
  mutate(exam_result = ifelse(avg >= 60, "pass", "fail")) %>% 
  filter(exam_result == "pass") # 그 중 pass인 사람만
result  

















