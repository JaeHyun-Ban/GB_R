'''
참조사이트: https://ggplot2.tidyverse.org/reference/index.html
그래프 툴 만들기
ggplot(데이터셋, 축)
'''
install.packages("ggplot2")
library(ggplot2)

mpg <- as.data.frame(mpg)

ggplot(data = mpg, aes(x = displ, y = hwy)) # 1단계 쌓기
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() # 2단계
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "red", size=0.1) # 3단계
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "red", size=0.1) + xlim(5,7) # 4단계: 5~7부분만 가져옴

# 시각화함수들의 중첩이 길어져서 줄바꿈할 때는 +가 마지막에 있도록 처리한다
# scales를 이용한 축 설정
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(5,7) +
  ylim(10, 30)


# sclaes를 이용해서 제목과 축설정
# 1st
ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() + #점(point)형식 분석도
  xlab("x축제목") + # x축제목 설정
  ylab("y축제목") + # y축 제목 설정
  ggtitle("이건 제목입니다") # 분석도 제목 설정

# 2nd
ggplot(data = mpg, aes(x = cty, y = hwy) )+
  geom_point() + 
  #labs라는 명령어를 동해 각 제목들을 한번에 지정할 수 있다
  labs(title = "제목", x = "x축", y = "y축") 


# aes축에 color값을 고정으로 지정 or data별로 지정
ggplot(mpg, aes(x = cty, y = hwy, color = "red")) + 
  geom_point()

ggplot(mpg, aes(x = cty, y = hwy, color = cyl)) + 
  #cyl(실린더): 연속적인 색으로 표현해 준다(변화되는 실린더색(물탄것마냥)을 보여줌)
  #factor(cyl)으로도 사용 가능> 좀더 직관적인 색깔
  geom_point()






















