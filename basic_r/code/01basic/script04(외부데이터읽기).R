# 외부데이터 불러오기
getwd() # 내 프로젝트 경로
setwd("C:/Users/Win10/Desktop/Backup/workspace/GookBe/GB_R/basic_r") # 기준폴더 설정

#read.table(): text파일을 읽음
# header = T:  첫번째 행이 컬럼명인 경우 header로 인식시켜준다
d1 <- read.table("data/excel_exam.txt", header = T)
class(d1)# data.frame형태 확인됨
d1

# 데이터가 tap으로 구분된 파일을 읽을 때 사용.
# 그냥 read.table()로 읽자
d2 <- read.delim("data/excel_exam.txt", header = T)
d2

# 문자열데이터가 Factor로 변경되서들어올 때가 존재함
# 그 때 csv와 같이쓰면 좋은 stringAsFactors = F(factor로 변경되는 것을 막는옵션션)
d3 <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
d3
class(d3)
str(d3) # 데이터의 구조 확인(버릇처럼 확인해보자)

########################################################
# excel파일을 읽기 위해서 패키지 설치
install.packages("readxl")
library(readxl)# 라이브러리 로드

#col_names = F: 제목이 없는 순수한 데이터로 가져오겠다
#보통 엑셀파일은 제목이 존재하니 그냥 가져오자
d4 <- read_excel("data/excel_exam.xlsx", col_names = T)
d4 <- as.data.frame(d4)
class(d4) # 데이터 프레임으로 변경이 필요

#########################################################
# file -> import-dataset 선택하고 마우스로 데이터를 import가능

# 데이터 저장하기기
name <- c("park", "kim", "lee", "choi", "hong")
kor <- c(10, 20, 30, 40, 50)
eng <- c(23, 45, 64, 34, 23)

d5 <- data.frame(name, kor, eng)

# \는 탈출 문자로 \\로 작성해야 한다
write.csv(d5, file = "data/export.csv") #getwd()기준 상대경로
write.csv(d5, file = "C:\\Users\\Win10\\Desktop\\Backup\\workspace\\GookBe\\GB_R/basic_r\\data\\exprot2.csv")


















