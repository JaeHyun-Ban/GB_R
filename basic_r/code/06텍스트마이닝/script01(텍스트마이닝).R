'''
텍스트 마이닝: 문자로된 데이터에서 가치있는 정보를 얻어내는 분석기법
1. 자바가 반드시 설치되어 있어야 한다.
2. rJava, KoNLP라이브러리가 필요하다
3. 기존에 사용하는 방법이 안되므로, git에서 라이브러리를 받는 형식으로 진행
'''
install.packages("rJava")
install.packages("multilinguer")

library(rJava)
library(multilinguer)
# 의존성 패키지 설치
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

# 깃허브 버전 설치
install.packages("remotes")

# 리모트
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts = c("--no-multiarch"))

# 위 설치를 모두 완료후에 확인
library(KoNLP)
useNIADic()

#========================================
# 1. 데이터를 한줄씩 읽는다
song <- readLines("data/song.txt")
song

# 2. stringr패키지를 이용해서 특수문자를 제거
##> \\w는 R정규표현에서 특수문자를 의미
library(stringr)
song <- str_replace_all(song, "\\w,", " ")

# [KoNLP]extractNoun(): 문장에서 명사를 추출
extractNoun("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세")

# 3. 명사추출: extractNoun은 list형태로 결과를 반환
song_list <- extractNoun(song)
song_list # 
class(song_list) # list형태로는 사용할 수 없다

# 4. unlist함수를 이용해서 vector형으로 형변환
song_vec <- unlist(song_list)
song_vec
class(song_vec)

# 5. vector형에서 분석을 위해 dataframe으로 변경
song_df <- as.data.frame(song_vec)
song_df

# 6. 분석을 위한 컬럼명 변경
library(dplyr)
song_df <- rename(song_df, word = song_vec)
head(song_df)

# 7. 분석(단어의 자주사용된 빈도를 내림차순 정렬)
result <- song_df %>% 
  filter(nchar(word) >= 2) %>% #단어 길이가 2이상인 것 
  group_by(word) %>% 
  summarise(feq = n()) %>%  # 빈도 확인
  arrange(desc(feq))

View(result)

# 8. wordcloud 설치
install.packages("wordcloud")
library(RColorBrewer)
library(wordcloud)

# 색상목록을 추출
#> pal(이름, 색상명)
?brewer # 확인하기
color <- brewer.pal(12, "Set3")

color <- brewer.pal(8, "Accent")
song_df$word
wordcloud(words = result$word, # 적용시킬 단어들
          freq = result$feq, #빈도
          min.freq = 2, #최소 단어 빈도
          max.words = 200, # 표현할 단어 수
          random.order = F, # 고빈도 단어 중앙배치(F:중앙, T:랜덤)
          rot.per = 0.1, # 단어 회전비율
          scale = c(3, 0.3), # 단어크기(중앙, 끝)
          colors = color) # 표현할 색상상





















