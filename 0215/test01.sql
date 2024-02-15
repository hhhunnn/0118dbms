CREATE DATABASE board;
USE board;

CREATE TABLE user (
	email VARCHAR(50) PRIMARY KEY,
	password VARCHAR(100) NOT NULL,
	nickname VARCHAR(20) UNIQUE KEY NOT NULL,
	tel_number VARCHAR(15) UNIQUE KEY NOT NULL,
	address TEXT NOT NULL,
	address_detail TEXT,
	profile_image TEXT,
	agreed_personal TINYINT NOT NULL
);

CREATE TABLE board (
	board_number INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	contents TEXT NOT NULL,
	write_datetime DATETIME NOT NULL DEFAULT now(),
	favorite_count INT NOT NULL DEFAULT 0,
	comment_count INT NOT NULL DEFAULT 0,
	view_count INT NOT NULL DEFAULT 0,
	writer_email VARCHAR(50),
    CONSTRAINT writer FOREIGN KEY (writer_email) REFERENCES user (email)
);

CREATE TABLE comment (
	comment_number INT PRIMARY KEY,
	contents TEXT NOT NULL,
	write_datetime DATETIME NOT NULL DEFAULT now(),
    user_email VARCHAR(50) NOT NULL,
    board_number INT NOT NULL,
	CONSTRAINT comment_writer FOREIGN KEY (user_email) REFERENCES user (email),
	CONSTRAINT board_comment FOREIGN KEY (board_number) REFERENCES board (board_number)
);

CREATE TABLE favorite(
	user_email VARCHAR(50) NOT NULL,
	board_board_number INT NOT NULL,
	CONSTRAINT user_favorite FOREIGN KEY (user_email) REFERENCES user (email),
	CONSTRAINT borad_favorite FOREIGN KEY (board_board_number) REFERENCES board (board_number)
);
ALTER TABLE board.favorite
ADD PRIMARY KEY (board_board_number, user_email);


CREATE TABLE board_image(
	sequence INT PRIMARY KEY AUTO_INCREMENT,
	board_number INT NOT NULL,
	image_url TEXT,
	CONSTRAINT board_image FOREIGN KEY (board_number) REFERENCES board (board_number)
);

CREATE TABLE search_log(
	sequence INT PRIMARY KEY,
	search_word TEXT NOT NULL,
	relation_word TEXT,
	relation TINYINT NOT NULL
);



USE board;
-- 1.
INSERT INTO user 
VALUES ('email@email.com', 'P!ssw0rd', 'rose', '010-1234-5678', '부산광역시 사하구', '낙동대로', null, true);

-- 2.
UPDATE user SET profile_image = 'https://cdn.onews.tv/news/photo/202103/62559_62563_456.jpg'
WHERE email = 'email@email.com';

-- 3. 실패 : 외래키 제약조건 때문에
INSERT INTO board (title, contents, writer_email) 
VALUES ('첫번째 게시물', '반갑습니다. 처음뵙겠습니다.', 'email2@email.com');

-- 4.
INSERT INTO board (title, contents, writer_email) 
VALUES ('첫번째 게시물', '반갑습니다. 처음뵙겠습니다.', 'email@email.com');

-- 5.
INSERT INTO board_image (board_number, image_url) 
VALUES (1, 'https://image.van-go.co.kr/place_main/2022/04/04/12217/035e1737735049018a2ed2964dda596c_750S.jpg');

-- 6.
UPDATE board SET favorite_count = 1, view_count = 1
WHERE board_number = 1;

-- 7. 
SELECT B.board_number, B.title, B.contents, B.view_count, B.comment_count,
		B.favorite_count, B.write_datetime, B.writer_email,
		U.profile_image AS writer_profile_image, U.nickname AS writer_nickname
FROM board AS B
INNER JOIN user AS U
ON B.writer_email = U.email;

-- 8.
CREATE VIEW board_view AS
SELECT B.board_number, B.title, B.contents, B.view_count, B.comment_count,
		B.favorite_count, B.write_datetime, B.writer_email,
		U.profile_image AS writer_profile_image, U.nickname AS writer_nickname
FROM board AS B
INNER JOIN user AS U
ON B.writer_email = U.email;

-- 9.
SELECT *
FROM board_view
WHERE title LIKE '%반갑%' OR contents LIKE '%반갑%';

-- 10.
CREATE INDEX board_title_idx ON board (title);









