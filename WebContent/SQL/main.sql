普通用户表：
create table user (
	userId int primary key auto_increment,
	username varchar(20) unique,
	password varchar(20) not null
);

create table userDetailInfo (
	userBodyId int primary key auto_increment,
	userId int unique references user(userId),
	userPhoto varchar(255),
	userIntroduce varchar(255),
	userGender ENUM('男', '女'),
	userHeight int,
	userWeight int,
	userBWH varchar(11),
	userAge int,
	userBirthday date,
	userTel int,
	userAddress varchar(255),
	roleId int unique references role(roleId)
);


角色表：
create table role (
roleId int primary key auto_increment,
roleName varchar(11) unique
);
roleId 			roleName
1 				普通用户
2 				商家
3				管理员

权限表：
create table authority (
authorizationId int primary key auto_increment,
authorizationName varchar(20) unique
);
AuthorizationId AuthorizationName
1 				登陆
2 				发表主题
3 				回复主题
4 				发布健身房信息
5				删帖
6				删回复
7				删用户
8				禁封
9				删健身房信息

角色&权限表:
create table roleWithauthority (
	roleId int not null references role(roleId),
	authorizationId int references authority(authorizationId)
);
insert into roleWithauthority values(3, 1);
insert into roleWithauthority values(3, 2);
insert into roleWithauthority values(3, 3);
insert into roleWithauthority values(3, 4);
insert into roleWithauthority values(3, 5);
insert into roleWithauthority values(3, 6);
insert into roleWithauthority values(3, 7);
insert into roleWithauthority values(3, 8);
insert into roleWithauthority values(3, 9);
roleId 			AuthorizationId
1				1
1				2
1				3
2				1
2				2
2				3
2				4
3				123456789

商家发布健身房的信息：
gymId
businessId reference(商家表)
gymName
gymIntroduce
gymPicture1
gymPicture2
gymPicture3
gymPrice
gymTel
gymAddress

create table publishHealthyRoom (
	gymId int primary key auto_increment,
	businessId int references user(userId),
	gymName varchar(30),
	gymIntroduce varchar(255),
	gymPicture1 varchar(30),
	gymPicture2 varchar(30),
	gymPicture3 varchar(30),
	gymPrice varchar(5),
	gymTel varchar(20),
	gymAddress varchar(255),
	gymPublishDate date
)


create table theme (
themeId int primary key auto_increment,
userId int references user(userId),
title varchar(255) not null,
cont varchar(255) not null,
picture varchar(20),
publishtime date,
contAmount int
);
帖子主题表
themeId
userId
title
cont
picture
publishtime
contAmount

create table replytheme (
themeId int references theme(themeId),
floorId int default 1,
userId int references user(userId),
replytime date,
cont varchar(255),
picture varchar(20),
constraint unique(themeId, floorId)
);
回复帖子表
themeId reference(themeId)
floorId
userId
replytime
cont
picture
