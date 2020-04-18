SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS DemandComment;
DROP TABLE IF EXISTS UserPostLikes;
DROP TABLE IF EXISTS DemandPost;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS User;




/* Create Tables */

CREATE TABLE Categories
(
	CategoryTitle varchar(20) NOT NULL,
	CategoryId int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (CategoryId),
	UNIQUE (CategoryTitle),
	UNIQUE (CategoryId)
);


CREATE TABLE DemandComment
(
	DemandPostId int NOT NULL,
	DemandCmtId int NOT NULL AUTO_INCREMENT,
	UserId int NOT NULL,
	CreatedDate ,
	PRIMARY KEY (DemandCmtId),
	UNIQUE (DemandCmtId)
);


CREATE TABLE DemandPost
(
	DemandPostId int NOT NULL AUTO_INCREMENT,
	CreatedUserId int NOT NULL,
	PostCategoryId int NOT NULL,
	Nego ,
	ImgSrc ,
	Description ,
	numLikes ,
	DemandPostID ,
	DemandPostTitle ,
	DemandPostLocation ,
	DemandPostPrice ,
	DemandPostCreatedDate ,
	PRIMARY KEY (DemandPostId),
	UNIQUE (DemandPostId)
);


CREATE TABLE User
(
	UserId int NOT NULL AUTO_INCREMENT,
	UserName  NOT NULL,
	UserRep ,
	UserPW ,
	UserGender ,
	UserEmail ,
	UserPhoneNum ,
	UserLocation ,
	UserNickname ,
	PRIMARY KEY (UserId)
);


CREATE TABLE UserPostLikes
(
	UserId int NOT NULL,
	DemandPostId int NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE DemandPost
	ADD FOREIGN KEY (PostCategoryId)
	REFERENCES Categories (CategoryId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DemandComment
	ADD FOREIGN KEY (DemandPostId)
	REFERENCES DemandPost (DemandPostId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE UserPostLikes
	ADD FOREIGN KEY (DemandPostId)
	REFERENCES DemandPost (DemandPostId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DemandComment
	ADD FOREIGN KEY (UserId)
	REFERENCES User (UserId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DemandPost
	ADD FOREIGN KEY (CreatedUserId)
	REFERENCES User (UserId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE UserPostLikes
	ADD FOREIGN KEY (UserId)
	REFERENCES User (UserId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



