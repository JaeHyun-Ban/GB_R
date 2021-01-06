# stringr은 벡터형의 문자열을 다루는 다양한 기능이 들어있다
install.packages("stringr")
library(stringr)

emp <- read.csv("data/emp.csv")
emp
str(emp)

# str_detect(벡터형, 정규식): 패턴검사
?str_detect

emp$FIRST_NAME
str_detect(emp$FIRST_NAME, "a") # a를 포함하는
str_detect(emp$FIRST_NAME, "[aA]") # a or A를 포함하는

str_detect(emp$FIRST_NAME, "^a") # a로 시작하는
str_detect(emp$FIRST_NAME, "^[aA]") #a or A로 시작하는

str_detect(emp$FIRST_NAME, "a$") #a로 끝나는
str_detect(emp$FIRST_NAME, "[aA]$")#a or A 로 끝나는


# str_count(백터형, 정규식): 출현빈도
str_count(emp$JOB_ID, "A") # A의 출현빈도
str_count(emp$JOB_ID, "PROG") #PROG의 출현빈도
str_count(emp$JOB_ID, toupper("prog")) #PROG의 출현빈도(대문자 변환)

# str_length(백터)
length(emp$FIRST_NAME)# 백터의 길이
nchar(emp$FIRST_NAME)#각 원소의 길이
str_length(emp$FIRST_NAME)# nchar와 결과가 같음

# $ str_c(백터, 벡터, 옵션): paste()와 동일
paste(emp$FIRST_NAME, emp$LAST_NAME) # 두 벡터를 공백으로 구분해 붙임
paste(emp$FIRST_NAME, emp$LAST_NAME, sep = "-")#두 벡터를 -로 구분해 붙임임
str_c(emp$FIRST_NAME, emp$LAST_NAME, sep = "-")

paste(emp$FIRST_NAME, collapse = ",") #구분자(,)로 모든 벡터를 붙여줌
str_c(emp$FIRST_NAME, collapse = ",")

# str_sub(벡터, 시작, 끝): substr()과 동일함
substr(emp$HIRE_DATE, 1, 2)# 1~2인덱스 추출
str_sub(emp$HIRE_DATE, 1, 2)

# 기본함수는 끝값을 반드시 지정해야하는 반면에 str_sub는 생략시 끝까지 추출.
substr(emp$HIRE_DATE, 4, nchar(emp$HIRE_DATE)) #4~마지막인덱스 길이 까지
str_sub(emp$HIRE_DATE, 4)


#★★
# str_replace(벡터, 패턴, 치환문자): 처음매칭되는 값을 변경
emp$PHONE_NUMBER
str_replace(emp$PHONE_NUMBER, ".", ")") # 주의: .은 정규표현식에서 모든문자를 표현
# 특수문자를 그대로 사용하려면 \\를 붙임(특수문자는 언제나 주의 할 것)
str_replace(emp$PHONE_NUMBER, "\\.", ")")

# str_replace_all(벡터, 패턴, 치환문자): 매칭되는 모든 값을 변경
str_replace_all(emp$PHONE_NUMBER, "\\.", "-") # 모든 .을 -로 변경
str_replace_all(emp$PHONE_NUMBER, "\\.", "") # 모든 .을 제거

# 치환결과를 저장
emp$PHONE_NUMBER <- str_replace_all(emp$PHONE_NUMBER, "\\.", "-")
emp$PHONE_NUMBER


# ===================================================================
# 문제
# HIRE_DATE의 타입을 확인하고 2020-01-06형식의 날짜형 데이터로 전부 변경
emp$HIRE_DATE

# r에서 날짜형은 yyyy-mm-dd형태를 가지고 있어야한다
str_replace_all(emp$HIRE_DATE, "/", "-")
emp$HIRE_DATE <-  as.Date(str_c(20, str_replace_all(emp$HIRE_DATE, "/", "-"))) 
emp$HIRE_DATE

















