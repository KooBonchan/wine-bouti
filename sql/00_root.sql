create database project_wineshop;

drop user project_wineshop;
create user project_wineshop@localhost identified by '12345';

grant all privileges on project_wineshop.* to project_wineshop@localhost;
