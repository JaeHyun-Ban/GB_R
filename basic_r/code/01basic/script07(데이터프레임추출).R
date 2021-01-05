# 데이터 수정하기
exam <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
str(exam)

exam[1, ] <- 100 #첫행값을 100으로 변경
exam[c(1,3,5), ] <- 100 #1,3,5행 변경경

# 데이터 열 수정하기
exam[, 4] <- 50
exam[, "english"] <- 70

# 데이터 부분 수정하기
exam[10, "math"] <- 1000

# 데이터 열 추가하기
# 열인데기스 or 열이름을 이용해서 추가
exam[, 6] <- "hello" #기존에 없는 6열에 hello를 추가

exam[, ncol(exam)+1] <- "bye" # 열 + 1을 통해 항상 새로운 열을 생성함함

exam[, "xxx"] <- "abc" # 없는 열이라면 생성하면서 가져온다(열 이름으로 추가)

exam$yyy <- "yyy" #위와 같은 표현(없는 것을 새롭게 추가해준다다)
# 후에는 $연산을 많이사용한다고 한다다

exam
head(exam)


# 컬럼명의 수정 - colnames()
colnames(exam) # 컬럼네임을 벡터형태로 가져옴
colnames(exam)[6] <- "zzz" # 컬럼이름, 6번째를 "zzz"로 변경
colnames(exam)[7] <- "kkk"
colnames(exam)[6:9] <- c("aaa", "bbb", "ccc", "ddd") # 중요(★)
colnames(exam) <- c("a", "b", "c", "d", "e", "f", "g", "h", "u") #이런식으로 가능

exam

# 주의할점 - 기본형식에서 컬럼수정은 반드시 인덱스로 할 것(인덱싱으로만 찾아야한다)
# colnames(exam)["i"] <- "test"
# test <- c("aaa", "bbb", "ccc")
# test["aaa"] # 항상 인덱싱을 통해 찾을 수 있다


head(exam)

# ifelse를 이용한 파생변수 생성
exam <- read.csv("data/excel_exam.csv")
exam

a <- c(1,3,4,5) # 열갯수와 더하기 파악용
exam$total <- exam$math + exam$english + exam$science # 열 갯수가 안맞아도 잘 더해짐
exam$avg <- (exam$math + exam$english + exam$science) / 3

# 조건절을 이용한 파생변수 생성
# ifelse(exam$avg >= 60, TRUE, FALSE) #60보다 크면 TRUE, 아니면 FALSE
exam$pass_fail <- ifelse(exam$avg >= 60 , "Y", "N")#3항연산같은 느낌 사용
exam

exam$level <- ifelse(exam$avg >= 80, "high", 
                                     ifelse(exam$avg <= 60, "row", "middel"))
exam


###################################################
# 데이터 병합

















