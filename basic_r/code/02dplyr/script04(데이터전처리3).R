# 그룹핑과 요약하기
# summarise(데이터세트, 컬럼명=요약함수)
data <- read.csv("data/excel_exam.csv")
class(data)

summarise(data, sum_math = sum(math))

d1 <- summarise(data, sum_math = sum(math), #합계
                avg_math = mean(math), #평균
                count = n()) #빈도수
d1
class(d1)
is.list(d1) #list: 자바의 Object형 list와 똑같음(뭐든 다들어갈 수 있다)
#summarise는 요약정보를 list형태로 반환한다
mean(data$math)


# group_by(데이터세트, 변수...)
# 같은 행 데이터별로 묶는다

# 사용방법 -> 그룹핑할 컬럼을 group_by()그룹핑 시키고 요약정보를 출력합니다.
d2 <- group_by(data, class) # class별로 그룹핑

summarise(d2, math_sum = sum(math))

# 클래스별 수학, 영어, 과학의 합계를 요약
summarise(d2, math_sum = sum(math),
              eng_sum = sum(english),
              sci_sum = sum(science),
              total = n())

# 클래스별 수학, 영어, 과학의 평균과 중간값을 요약
summarise(d2, math_avg = mean(math),
              eng_avg = mean(english),
              sci_avg = mean(science),
              math_medi = median(math),
              eng_medi = median(english),
              sci_medi = median(science),
              total = n())

# 파이프라인으로 한번에 작성하기
data %>% 
  group_by(class) %>% #class로 그룹핑
  summarise(matn_sum = sum(math),
            math_avg = mean(math),
            total = n()) 
  
# 여러개를 그룹핑 시키려면 group_by()에 순서대로 적으면 된다
mpg <- as.data.frame(mpg)

table(mpg$manufacturer)
table(mpg$drv)

result <- mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty),
            mean_hwy = mean(hwy))


class(result)
as.data.frame(result) # 결과가 list의 형태이기 때문에 df형태로 다시 변환환

# 제조사별, 모델의 개수
result2 <- mpg %>% 
  group_by(manufacturer, model) %>% 
  summarise(total = n()) # 아우디 모델1 - total(몇개를 생산하는가)
as.data.frame(result2)






















