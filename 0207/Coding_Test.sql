### 흉부외과 또는 일반외과 의사 목록 출력하기 ###
USE practice_sql; 
CREATE TABLE DOCTOR (
	DR_NAME VARCHAR(20),
    DR_ID VARCHAR(10),
    LCNS_NO VARCHAR(30),
    HIRE_YMD DATE,
    MCDP_CD VARCHAR(6),
    TLNO VARCHAR(50)
);

INSERT INTO DOCTOR VALUES ('루피', 'DR20090029', 'LC00010001', '2009-03-01', 'CS', '01085482011');
INSERT INTO DOCTOR VALUES ('패티', 'DR20090001', 'LC00010901', '2009-07-01', 'CS', '01085220122');
INSERT INTO DOCTOR VALUES ('뽀로로', 'DR20170123', 'LC00091201', '2017-03-01', 'GS', '01034969210');
INSERT INTO DOCTOR VALUES ('티거', 'DR20100011', 'LC00011201', '2010-03-01', 'NF', '01034229818');
INSERT INTO DOCTOR VALUES ('품바', 'DR20090231', 'LC00011302', '2015-11-01', 'OS', '01049840278');
INSERT INTO DOCTOR VALUES ('티몬', 'DR20090112', 'LC00011162', '2010-03-01', 'FM', '01094622190');
INSERT INTO DOCTOR VALUES ('니모', 'DR20200012', 'LC00911162', '2020-03-01', 'CS', '01089483921');
INSERT INTO DOCTOR VALUES ('오로라', 'DR20100031', 'LC00010327', '2010-11-01', 'OS', '01098428957');
INSERT INTO DOCTOR VALUES ('자스민', 'DR20100032', 'LC00010192', '2010-03-01', 'GS', '01023981922');
INSERT INTO DOCTOR VALUES ('벨', 'DR20100039', 'LC00010562', '2010-07-01', 'GS', '01058390758');


DROP TABLE DOCTOR;

-- DOCTOR 테이블에서 진료과가 CS이거나 GS인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문을 작성
-- 이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬
-- 답
SELECT DR_NAME, DR_ID, MCDP_CD, HIRE_YMD 
FROM DOCTOR
WHERE MCDP_CD = 'CS' OR MCDP_CD = 'GS'
ORDER BY HIRE_YMD DESC, DR_NAME ASC;
-- SELECT DR_NAME, DR_ID, MCDP_CD, LEFT(HIRE_YMED, 10) AS HIRE_YMD
-- FROM DOCTOR
-- WHERE MCDP_CD = 'CS' OR MCDP_CD = 'GS'
-- ORDER BY HIRE_YMD DESC, DR_NAME ASC;


-- SUBSTRING(컬럼, 자를위치) 자를위치 FROM 시작위치 FOR 끝위치
-- SUBSTRING(컬럼, 자를위치, 길이) 자를위치 FROM 시작위치 FOR 끝위치
-- LEFT(컬럼, 길이)
-- LEFT(HIRE_YMED, 10) AS HIRE_YMD >> 2020-03-01 00:00:00 >> 2020-03-01
-- RIGHT(컬럼, 길이)



### 과일로 만든 아이스크림 고르기 ###
-- SELECT FLAVOR
-- FROM FIRST_HALF
-- WHERE TOTAL_ORDER > 3000
-- AND FLAVOR IN (
-- SELECT FLAVOR
-- FROM ICECREAM_INFO
-- WHERE INGREDIENT_TYPE = 'fruit_based'
-- )
-- ORDER BY TOTAL_ORDER DESC;


### 조건에 맞는 회원 수 구하기 ###
-- SELECT COUNT(USER_ID)
-- FROM USER_INFO
-- WHERE JOINED LIKE '2021-__-__' 
-- AND AGE BETWEEN 20 AND 29;


### 최댓값 구하기 ###
-- SELECT MAX(DATETIME) FROM ANIMAL_INS; 

### 강원도에 위치한 공장 출력하기 ###
-- SELECT FACTORY_ID, FACTORY_NAME, ADDRESS 
-- FROM FOOD_FACTORY
-- WHERE ADDRESS LIKE '강원도%'
-- ORDER BY FACTORY_ID ASC;


### 조건에 맞는 도서 리스트 출력하기 ###
-- SELECT BOOK_ID, LEFT(PUBLISHED_DATE, 10) AS PUBLISHED_DATE
-- FROM BOOK
-- WHERE PUBLISHED_DATE LIKE '2021-__-__' AND CATEGORY = '인문'
-- ORDER BY PUBLISHED_DATE;

