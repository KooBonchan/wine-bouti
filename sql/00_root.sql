-- drop database project_winebouti;
create database project_winebouti;

-- drop user 'project_winebouti'@'localhost';
create user 'project_winebouti'@'localhost' identified by '12345';

grant all privileges on project_winebouti.* to 'project_winebouti'@'localhost';
