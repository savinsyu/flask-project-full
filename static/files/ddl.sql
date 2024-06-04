create table main.healthy
(
    healthy_id      INTEGER
        primary key autoincrement,
    healthy_header TEXT not null,
    healthy_content TEXT not null
);