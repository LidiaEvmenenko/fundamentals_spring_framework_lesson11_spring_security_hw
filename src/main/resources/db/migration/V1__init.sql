create table users
(
    id       bigserial,
    username varchar(30) not null unique,
    password varchar(80) not null,
    email    varchar(50) unique,
    primary key (id)
);

create table roles
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);
create table privileges
(
    id   bigserial,
    name varchar(50) not null,
    primary key (id)
);

CREATE TABLE users_roles
(
    user_id bigint not null,
    role_id int    not null,
    primary key (user_id, role_id),
    foreign key (user_id) references users (id),
    foreign key (role_id) references roles (id)
);

CREATE TABLE roles_privileges
(
    role_id int    not null,
    privilege_id int not null,
    primary key (role_id, privilege_id),
    foreign key (role_id) references roles (id),
    foreign key (privilege_id) references privileges (id)
);


insert into roles (name)
values ('USER_READ'),
       ('USER_WRITE'),
       ('ADMIN_DELETE'),
       ('ADMIN_WRITE'),
       ('ROLE_ADMIN');

insert into users (username, password, email)
values ('userRead', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'user1@gmail.com'),
('userWrite', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'user2@gmail.com'),
('adminDelete', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'admin1@gmail.com'),
('adminWrite', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'admin2@gmail.com');

insert into privileges (name)
values ('DELETE'),
       ('WRITE'),
       ('READ');

insert into users_roles (user_id, role_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (3, 5),
       (4, 4),
       (4, 5);

insert into roles_privileges (role_id, privilege_id)
values (1, 3),
       (2, 2),
       (2, 3),
       (3, 1),
       (3, 2),
       (3, 3),
       (4, 2),
       (4, 3);