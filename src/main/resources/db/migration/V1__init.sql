create table categories
(
    id    bigserial primary key,
    title varchar(255)
);
insert into categories (title)
values ('Продукты'),
 ('Молочные продукты'),
 ('Хлебные изделия');

create table cart
(
    id          bigserial primary key,
    title       varchar(255),
    price       int,
    amount      int
);

create table products
(
    id          bigserial primary key,
    title       varchar(255),
    price       int,
    category_id bigint references categories (id)
);
insert into products (title, price, category_id)
values ('Хлеб', 25, 3),
('Молоко', 80, 2),
('Кетчуп', 65, 1),
('Макароны', 75, 3),
('Помидоры', 99, 1),
('Огурец', 78, 1),
('Сметана', 80, 2),
('Вода', 40, 1),
('Шоколад', 59, 1),
('Конфеты', 280, 1),
('Творог', 150, 2),
('Колбаса', 80, 1),
('Мясо', 380, 1),
('Грибы', 98, 1),
('Мороженое', 54, 1),
('Чипсы', 40, 1),
('Кока-кола', 80, 1),
('Батон', 83, 3),
('Яблоко', 79, 1),
('Яблоко', 179, 1),
('Яблоко', 279, 1),
('Сыр', 450, 2);

create table users
(
    id         bigserial primary key,
    username   varchar(30) not null,
    password   varchar(60) not null,
    email      varchar(50) unique,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

create table roles
(
    id         bigserial primary key,
    name       varchar(50) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

CREATE TABLE users_roles
(
    user_id bigint not null references users (id),
    role_id bigint not null references roles (id),
    primary key (user_id, role_id)
);

insert into roles (name)
values ('ROLE_USER'),
       ('ROLE_ADMIN');

insert into users (username, password, email)
values ('user', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'bob_johnson@gmail.com'),
       ('admin', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'john_johnson@gmail.com');

insert into users_roles (user_id, role_id)
values (1, 1),
(2, 2);