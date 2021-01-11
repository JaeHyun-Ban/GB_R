library(ggplot2)
library(dplyr)

# Q1
# mpg 데이터의 cty(도시 연비) hwy(고속연비)를 이용해서 x 축은 cty, y 축은 hwy 로 된 산점도를 생성하세요.
mpg <- as.data.frame(mpg)
ggplot(mpg, aes(x = cty, y = hwy)) + geom_point()
ggplot(mpg, aes(x = hwy, y = cty)) + geom_point()

# Q2
# 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용합니다
# x 축은 poptotal(전체 인구), y 축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요.
# 전체 인구는 50 만 명 이하, 아시아인 인구는 1 만 명 이하인 지역만 산점도에 표시되게 설정하세요.
mid <- as.data.frame(midwest)
ggplot(mid, aes(x = poptotal, y = popasian)) + 
  geom_point()

d1 <- mid %>% 
  filter(poptotal <= 500000 | popasian <= 10000) %>% 
  select(county, poptotal, popasian)

ggplot(mid, aes(x = poptotal, y = popasian)) +
  geom_point() + 
  xlim(0, 500000) + 
  ylim(0, 10000) + 
  labs(x = "전체인구", y = "아시아인구")


# Q3
# mpg데이터에서 어떤 회사별 suv 차종의 도시 연비가 높은지 확인하려 합니다.
# suv차종을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요
# 막대는 연비 가 높은 순으로 reorder하세요.
df_mpg <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

df_mpg <- as.data.frame(df_mpg)
ggplot(df_mpg, aes(x = reorder(manufacturer, mean_cty), y = mean_cty, fill = manufacturer)) + 
  geom_col() + 
  labs(x = "회사", y = "평균 도시연비")
  
# Q4
# 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 합니다.
# 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.
ggplot(mpg, aes(x = class, fill = class)) + geom_bar()
ggplot(mpg, aes(x = class, fill = model)) + geom_bar() + coord_polar(theta = "y")
  


# Q5
# ggplot2패키지 economics데이터를 이용합니다.
# psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다. 시간에 따른 psavert(개인 저축률)의 변화를
# 나타낸 시계열 그래프를 만들어 보세요.
economics <- as.data.frame(economics)
economics %>% 
  head(1)
ggplot(economics, aes(x = date, y = psavert)) + 
  geom_line()



# Q6
# mpg데이터를 이용합니다.
# class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시 연비)가 어떻게 다른지 비교해보려고 합니다.
# 세 차종의 cty를 나타낸 상자 그림을 만들어 보세요.
# 힌트: 파이프라인 추출

mpg %>% 
  filter(class %in% c("compact", "subcompact", "suv")) %>% 
  ggplot(aes(x = class, y = cty, color = class, fill = manufacturer)) +
  geom_boxplot()
 

# =========================================
# 시각화 함수는 레이어 층으로 계속 쌓이며 올라간다
head(economics, 1)
class(economics)
ggplot(economics, aes(x = date, y = psavert)) + 
  geom_line()

ggplot(economics) + 
  geom_line(aes(x = date, y = psavert))
'''
그래프와 그래프 더하기
중간에 있는 레이어층(그래프함수)들이 겹쳐서 서로 보이는 형태로 사용함
'''
str(mpg)
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(mpg, aes(x = hwy, y = displ)) + geom_point()
# 위의 두개를 한번에 보여주기
# 옵션 aes함수 안에 지정하면 범주가 나타나고, 밖에 선언해주면 그래프의 색상만 변한다
ggplot(mpg) + # mpg기준
  geom_point(aes(x = displ, y = hwy, color = "red")) + # 레이어1
  geom_point(aes(x = hwy, y = displ, color = "blue")) # 레이어2

# x 축을 고정하고, 서로다른 데이터를 표현
ggplot(mpg) + 
  geom_point(aes(x = displ, y = cty), color = "red") + 
  geom_point(aes(x = displ, y = hwy), color = "blue")

# 하나의 데이터를 점과 라인으로 표현
head(economics, 1)
# 저출률 vs 실업률
a <- ggplot(economics) + 
  geom_line(aes(x = date, y = psavert), color = "red") + 
  geom_line(aes(x = date, y = uempmed), color = "blue")

# line과 point
b <- ggplot(economics) + 
  geom_line(aes(x = date, y = psavert), color = "red") + 
  geom_point(aes(x = date, y = psavert), size = 0.1)

# 저축률 vs 실업률
# hline(): 수평축(yintercept에 축 위치)
# vline(): 수직축(xintercept에 축 위치)
c <- ggplot(economics) + 
  geom_line(aes(x = date, y = psavert), color = "red") +
  geom_line(aes(x = date, y = uempmed), color = 'blue') + 
  # geom_hline(yintercept = 15) # y수평축
  geom_hline(yintercept = mean(economics$psavert), color = "green") + # y축의 값
  geom_vline(xintercept = as.Date("2010-12-31"), color = 'pink') + # x축의 값
  labs(title = "저축률 vs 실업률", x = "날짜",  y = "저축률(실업률)")

# 동시에 여러 그래프를 표현하기 gridExtra패키지
install.packages("gridExtra")
library(gridExtra)

# step1 - 각각의 그래프를 변수에 저장
a
b
c
# step2 - grid.arrange()함수 안에 표현
grid.arrange(a,b,c, nrow = 1, ncol = 3)
grid.arrange(a,b,c, nrow = 3, ncol = 1)
grid.arrange(a,b,c, nrow = 2, ncol = 2)














































