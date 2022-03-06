drop database if exists EMP_System;
create database EMP_System;
use EMP_System;

CREATE table user(
user_ID varchar(6),
name varchar(30),
dob date,
nic varchar(12),
email varchar(30),
type varchar(20),
address_no varchar(8),
address_street varchar(20),
address_city varchar(20),
account_ID varchar(6),
user_name varchar(15),
password varchar(20),
user_img varchar(30),
salary_ID varchar(8),
amount real,
allowance real,
deduction real,
constraint user_PK primary key(user_ID)
);

CREATE table attendence(
attendence_ID varchar(8),
date date,
in_time time,
out_time time,
user_ID varchar(6),
constraint attendence_PK primary key(attendence_ID),
constraint attendence_FK foreign key(user_ID) references user(user_ID)
);

CREATE table leave_table(
leave_ID varchar(8),
leave_type varchar(20),
from_date date,
to_date date,
reason varchar(30),
leave_status varchar(10),
emp_ID varchar(6),
manager_ID varchar(6),
constraint Leave_PK primary key (leave_ID),
constraint Leave_FK1 foreign key(emp_ID) references user(user_ID),
constraint Leave_FK2 foreign key(manager_ID) references user(user_ID)
);

CREATE table loan(
loan_ID varchar(8),
amount real,
loan_date date,
reason varchar(30),
emp_ID varchar(6),
manager_ID varchar(6),
constraint Loan_PK primary key(loan_ID),
constraint Loan_FK1 foreign key(emp_ID) references user(user_ID),
constraint Loan_FK2 foreign key(manager_ID) references user(user_ID)
);

CREATE table project(
project_ID varchar(8),
project_company varchar(30),
project_name varchar(30),
start_date date,
due_date date,
description varchar(30),
supervisor_ID varchar(6),
manager_ID varchar(6),
constraint project_PK primary key(project_ID),
constraint Project_FK1 foreign key(supervisor_ID) references user(user_ID),
constraint Project_FK2 foreign key(manager_ID) references user(user_ID)
);

CREATE table team(
team_ID varchar(8),
name varchar(30),
description varchar(30),
project_ID varchar(8),
supervisor_ID varchar(6),
constraint Team_PK primary key(team_ID),
constraint Team_FK1 foreign key(project_ID) references project(project_ID),
constraint Team_FK2 foreign key(supervisor_ID) references user(user_ID)
);

CREATE table task(
task_ID varchar(8),
task_name varchar(30),
description varchar(30),
duration varchar(15),
supervisor_ID varchar(6),
team_ID varchar(8),
constraint Task_PK primary key(task_ID),
constraint Task_FK1 foreign key(team_ID) references team(team_ID),
constraint Task_FK2 foreign key(supervisor_ID) references user(user_ID)
);



CREATE table project_manage(
project_ID varchar(8),
manager_ID varchar(6),
constraint Project_manage_PK primary key(project_ID,manager_ID )
);

CREATE table user_TP(
user_ID varchar(8),
tp_No varchar(10),
constraint TP_PK primary key (user_ID,tp_No)
);

CREATE table employee_team(
team_ID varchar(8),
emp_ID varchar (6),
constraint Emp_team_PK primary key(team_ID,emp_ID),
constraint Emp_team_FK1 foreign key(team_ID) references team(team_ID),
constraint Emp_team_FK2 foreign key(emp_ID) references user(user_ID)
);


































































































































