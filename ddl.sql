DROP TABLE `t_member` CASCADE CONSTRAINTS;

CREATE TABLE `t_member` (
    `Column2` INTEGER NOT NULL,
    `id` vachar2(10) NOT NULL,
    `pwd` vachar2(10) NOT NULL,
    `name` vachar2(50) NOT NULL,
    `email` vachar2(50) NOT NULL,
    `joinDate` INTEGER NOT NULL,
    PRIMARY KEY (`id`)
);
