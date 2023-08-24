create database if not exists Time4Trivia;

use Time4Trivia;

drop table if exists UserRoles;
drop table if exists Users;
drop table if exists Roles;
drop table if exists Questions;
drop table if exists Answers;

create table if not exists Users(
    UserId int NOT NULL AUTO_INCREMENT,
    Username varchar(100) NOT NULL,
    Password varchar(100) NOT NULL,
    Email varchar(100) NOT NULL,
    FirstName varchar(100) NOT NULL,
    LastName varchar(100) NOT NULL,
    PRIMARY KEY (UserId),
    CONSTRAINT Users_UniqueEmail UNIQUE(Email),
    CONSTRAINT Users_UniqueUsername UNIQUE(Username)
);

create table if not exists Roles(
    RoleId int NOT NULL AUTO_INCREMENT,
    Role varchar(100) NOT NULL,
    RoleDescription text NOT NULL,
    PRIMARY KEY (RoleId),
    CONSTRAINT Roles_UniqueRole UNIQUE(Role)
);

create table if not exists UserRoles(
    UserId int,
    RoleId int,
    PRIMARY KEY (UserId, RoleId),
    foreign key (UserId) references Users(UserId),
    foreign key (RoleId) references Roles(RoleId)
);

create table if not exists Leaderboard(
    UserId int,
    Score int,
    PRIMARY KEY (UserId),
    foreign key (userId) references Users(UserId)
);

create table if not exists DisabledUsers(
    UserId int,
    DisabledStatus boolean,
    PRIMARY KEY (UserId),
    foreign key (userId) references Users(UserId)
);

create table if not exists Questions(
    QuestionId int NOT NULL AUTO_INCREMENT,
    Question text NOT NULL,
    PRIMARY KEY (QuestionId)
);

create table if not exists Leaderboard(
    UserId int NOT NULL,
	Score int NOT NULL,
    PRIMARY KEY (UserId),
    foreign key (UserId) references Users(UserId)
);

create table if not exists Answers(
    AnswerId int NOT NULL AUTO_INCREMENT,
    QuestionId int NOT NULL,
    Answer text NOT NULL,
	Correct boolean NOT NULL,
    PRIMARY KEY (AnswerId),
    foreign key (QuestionId) references Questions(QuestionId)
);
