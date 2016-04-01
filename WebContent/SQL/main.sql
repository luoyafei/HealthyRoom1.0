��ͨ�û���
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
	userGender ENUM('��', 'Ů'),
	userHeight int,
	userWeight int,
	userBWH varchar(11),
	userAge int,
	userBirthday date,
	userTel int,
	userAddress varchar(255),
	roleId int unique references role(roleId)
);


��ɫ��
create table role (
roleId int primary key auto_increment,
roleName varchar(11) unique
);
roleId 			roleName
1 				��ͨ�û�
2 				�̼�
3				����Ա

Ȩ�ޱ�
create table authority (
authorizationId int primary key auto_increment,
authorizationName varchar(20) unique
);
AuthorizationId AuthorizationName
1 				��½
2 				��������
3 				�ظ�����
4 				����������Ϣ
5				ɾ��
6				ɾ�ظ�
7				ɾ�û�
8				����
9				ɾ������Ϣ

��ɫ&Ȩ�ޱ�:
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

�̼ҷ�����������Ϣ��
gymId
businessId reference(�̼ұ�)
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
���������
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
�ظ����ӱ�
themeId reference(themeId)
floorId
userId
replytime
cont
picture
