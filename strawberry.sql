SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS DemandComment;
DROP TABLE IF EXISTS UserDemandPostLikes;
DROP TABLE IF EXISTS DemandPost;
DROP TABLE IF EXISTS SupplyComment;
DROP TABLE IF EXISTS UserSupplyPostLikes;
DROP TABLE IF EXISTS SupplyPost;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS User;




/* Create Tables */

CREATE TABLE Categories
(
	CategoryTitle varchar(20) NOT NULL,
	CategoryId int unsigned NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (CategoryId),
	UNIQUE (CategoryTitle),
	UNIQUE (CategoryId)
);


CREATE TABLE DemandComment
(
	DemandPostId int unsigned NOT NULL,
	DemandCommentId int unsigned NOT NULL AUTO_INCREMENT,
	UserId int unsigned NOT NULL,
	CreatedDate timestamp NOT NULL,
	PRIMARY KEY (DemandCommentId),
	UNIQUE (DemandCommentId)
);


CREATE TABLE DemandPost
(
	DemandPostId int unsigned NOT NULL AUTO_INCREMENT,
	CreatedUserId int unsigned NOT NULL,
	PostCategoryId int unsigned NOT NULL,
	Nego boolean DEFAULT 'TRUE' NOT NULL,
	ImgSrc varchar(200),
	Description varchar(500),
	numLikes int unsigned zerofill NOT NULL,
	DemandPostTitle varchar(20) NOT NULL,
	DemandPostLocation varchar(20) NOT NULL,
	DemandPostPrice int unsigned,
	DemandPostCreatedDate timestamp NOT NULL,
	PRIMARY KEY (DemandPostId),
	UNIQUE (DemandPostId)
);


CREATE TABLE SupplyComment
(
	SupplyCommentId int NOT NULL AUTO_INCREMENT,
	CreatedDate timestamp NOT NULL,
	SupplyPostID int unsigned NOT NULL,
	UserId int unsigned NOT NULL,
	PRIMARY KEY (SupplyCommentId),
	UNIQUE (SupplyCommentId)
);


CREATE TABLE SupplyPost
(
	SupplyPostID int unsigned NOT NULL AUTO_INCREMENT,
	ImgSrc varchar(200) NOT NULL,
	Nego boolean DEFAULT 'TRUE' NOT NULL,
	Description varchar(500),
	numLikes int unsigned zerofill NOT NULL,
	Title varchar(20) NOT NULL,
	Location varchar(20) NOT NULL,
	Price int unsigned NOT NULL,
	CreatedDate timestamp NOT NULL,
	ThingState varchar(20) NOT NULL,
	CategoryId int unsigned NOT NULL,
	PRIMARY KEY (SupplyPostID),
	UNIQUE (SupplyPostID)
);


CREATE TABLE User
(
	UserId int unsigned NOT NULL AUTO_INCREMENT,
	UserName varchar(20) NOT NULL,
	UserRep tinyint DEFAULT 5 NOT NULL,
	UserPhoneNum varchar(20) NOT NULL,
	UserPW varchar(30) NOT NULL,
	UserGender varchar(20) NOT NULL,
	UserEmail varchar(30),
	UserLocation varchar(20) NOT NULL,
	UserNickname varchar(20) NOT NULL,
	PRIMARY KEY (UserId),
	UNIQUE (UserId)
);


CREATE TABLE UserDemandPostLikes
(
	UserId int unsigned NOT NULL,
	DemandPostId int unsigned NOT NULL
);


CREATE TABLE UserSupplyPostLikes
(
	UserId int unsigned NOT NULL,
	SupplyPostID int unsigned NOT NULL,
	UNIQUE (SupplyPostID)
);



/* Create Foreign Keys */

ALTER TABLE DemandPost
	ADD FOREIGN KEY (PostCategoryId)
	REFERENCES Categories (CategoryId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SupplyPost
	ADD FOREIGN KEY (CategoryId)
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


ALTER TABLE UserDemandPostLikes
	ADD FOREIGN KEY (DemandPostId)
	REFERENCES DemandPost (DemandPostId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SupplyComment
	ADD FOREIGN KEY (SupplyPostID)
	REFERENCES SupplyPost (SupplyPostID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE UserSupplyPostLikes
	ADD FOREIGN KEY (SupplyPostID)
	REFERENCES SupplyPost (SupplyPostID)
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


ALTER TABLE SupplyComment
	ADD FOREIGN KEY (UserId)
	REFERENCES User (UserId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE UserDemandPostLikes
	ADD FOREIGN KEY (UserId)
	REFERENCES User (UserId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE UserSupplyPostLikes
	ADD FOREIGN KEY (UserId)
	REFERENCES User (UserId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



