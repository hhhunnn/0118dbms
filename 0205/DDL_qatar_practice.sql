-- qatar asian cup 데이터베이스

-- entity(객체)
-- 참가국 (국가명, 조, 감독, 피파랭킹)
-- 경기장 (경기장명, 수용인원, 주소)
-- 축구선수 (이름, 나이, 포지션, 소속프로팀, 등번호, 국가)
-- 심판 (이름, 나이, 포지션)

-- 관계 (객체의 행위로 인해 생김)
-- 경기 (경기일정, 국가1, 국가2, 경기장, 주심, 선심, 경기결과)


-- 객체지향 데이터베이스는 하나의 컬럼에 참조변수로 형태 넣을 수 있음
-- 관계형 데이터베이스는 하나의 컬럼에 하나만 넣을 수 있음

-- qata_asian_cup 
CREATE DATABASE qatar_asian_cup;
USE qatar_asian_cup;

-- country(name[가변문자열 30], group[가변문자열 1] manager[가변문자열 30], lanking[정수])
CREATE TABLE country (
	name VARCHAR(30),
	group_name VARCHAR(1),
    manager VARCHAR(30),
    lanking INT
);

-- stadium (name[가변문자열 50], capacity[정수], address[가변문자열 255])
CREATE TABLE stadium (
	name VARCHAR(50),
    capacity INT,
    address VARCHAR(255)
);

-- player (name[가변문자열 30], age[정수], position[가변문자열 15], pro_team[가변문자열 30],
-- 			uniform_number[정수], country[가변문자열 30]) -- country 위에 있는 country와 같은 타입
CREATE TABLE player (
	name VARCHAR(30),
    age INT,
    position VARCHAR(15),
    pro_team VARCHAR(30),
    uniform_number INT,
    country VARCHAR(30)
);

-- reference(name[가변문자열 30], age[정수],  position[가변문자열 15])
CREATE TABLE referee (
	name VARCHAR(30),
    age INT,
    position VARCHAR(15)
);

-- game (schedule[날짜 및 시간], country1[가변문자열 30], country2[가변문자열 30], stadium[가변문자열 50]
-- 		, chief_referee[가변문자열 30], second_referee[가변문자열 30], winnint_country[가변문자열 30])
CREATE TABLE game (
	schedule DATETIME,
    country1 VARCHAR(30),
    country2 VARCHAR(30),
    stadium VARCHAR(50),
    winnint_country VARCHAR(30),
    chief_referee VARCHAR(30),
    second_referee VARCHAR(30)
);






