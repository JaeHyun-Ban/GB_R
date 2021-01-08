'''
막대그래프: 집단별 평균을 나타낼때 일반적으로 사용
데이터의 요약정보를 먼저 생성 후 평균표를 이용
'''

library(ggplot2)
library(dplyr)

mpg <- as.data.frame(mpg)

# drv별 hwy(고속도로)연비 평균
d1 <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T)) # NA를 지운 hwy데이터

ggplot(d1, aes(x = drv, y = mean_hwy)) + 
  geom_col()

# reorder는(정렬하고 싶은변수, 연속형 변수)
#> arrange()과 같은 기능(역정렬 = -mean_hwy)
ggplot(d1, aes(x = reorder(drv, mean_hwy), y = mean_hwy)) + 
  geom_col()

# 제조사별 hwy평균
d2 <- mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))

ggplot(d2, aes(x = reorder(manufacturer, mean_hwy), y = mean_hwy)) +
  geom_col()

'''
# 누적 막대 그래프(빈도 그래프) 
geom_bar()를 사용, 원자료를 이용해서 처리해도 된다
빈도를 표현하기 때문에 x값만 지정한다
'''
# 구동방식(drv)의 빈도
ggplot(mpg, aes(x = drv)) + 
  geom_bar()

# 모델별 빈도(color: 막대 테두리색, fill:막대 내부 채우기)
ggplot(mpg, aes(x = model, color = "red", fill = "drv")) + 
  geom_bar()

#class별 제조사
ggplot(mpg, aes(x = class, fill = manufacturer)) +
  geom_bar()

# drv(구동방식)별 fl(연료)
ggplot(mpg, aes(x = drv, fill = fl))+
  geom_bar()

# 구동방식 별 연료 누적열을 분리
ggplot(mpg, aes(x = drv, fill = fl))+
  geom_bar(position = "dodge") # position은 geom_bar()에만 존재하는 옵션


'''
막대그래프의 가독성을 올려주는 coordinate
누적열을 분리, 회전, 원형으로 변경
'''
# coord_flip(): 그래프 회전시키기
# x축 데이터가 많은 경우 가독성을 위해 사용
ggplot(mpg, aes(x = model, fill = model))+
  geom_bar() + 
  coord_flip()

# coord_polar(): 그래프를 비율로 표기하는 원형차트로 변경 
#> 위에서 바라본 막대그래프(느낌)
# 제조사별(manufacturer), 구동방식(drv)
ggplot(mpg, aes(x = manufacturer, fill = drv)) +
  geom_bar() + 
  coord_polar()

# 구동방식별(drv), 모델(model)
ggplot(mpg, aes(x = drv, fill = model)) + 
  geom_bar() + 
  coord_polar()

# 구동방식(drv)별 연료(fl)
ggplot(mpg, aes(x = drv, fill = fl)) + 
  geom_bar() + 
  coord_polar()

'''
연속형 막대 차트에서 데이터가 없는 경우 빈영역으로 표시됨
원형차트를 사용할 때는 축이나 fill값을 빈요소가 없도록 처리하는 편이 좋다
as.factor() or factor() 형태로 변환합니다
'''
# factor()의 유무 비교
# 빈자료는 빈공간으로 표시
ggplot(mpg, aes(x = hwy, fill = drv)) + 
  geom_bar() + 
  coord_polar()
# 빈자료의 공간이 사라짐
ggplot(mpg, aes(x = factor(hwy), fill = drv)) + 
  geom_bar()+
  coord_polar()


'''
coord_polar(theta = "y"): 원그래프의 비율을 표시
'''
ggplot(mpg, aes(x = drv, fill = model)) + 
  geom_bar(position = "fill") + 
  coord_polar(theta = "y")



# 원그래프를 이용한 하나의 컬럼값 비율
# drv를 하나로 맞춘다
#>drv이란 하나의 기준으로 분석을 해준다(보기 좋다)
ggplot(mpg, aes(x = 1, fill = drv)) + 
  geom_bar(position = "fill") + 
  coord_polar(theta = "y")


# ================================================
ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar(position = "fill") + 
  coord_flip()


'''
r에서는 기본적으로 제공해주는 색상들이 존재한다
막대그래프에서 fill을 이용하면 기본색상이 적용된다
scale_fill_manual(컬러)
'''
# 막대그래프의 색상을 직접 지정
# class별 평균
test <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

#rgb색을 직접 지정해서 사용할 수 있다.
my_color <- c("2seater" = "#CC0099",
              "compact" = "#00CCCC",
              "midsize" = "#CC6666",
              "minivan" = "#CC99CC",
              "pickup" = "#6666CC",
              "subcompact" = "#FFCC99",
              "suv" = "#990033")

# x축 class, y축 cty평균, 그래프 = class
ggplot(test, aes(x = class, y = mean_cty, fill = class)) + 
  geom_col() + 
  scale_fill_manual(values = my_color)


















