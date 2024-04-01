BEGIN TRANSACTION;
CREATE TABLE "posts"
(
    id      INTEGER
        primary key autoincrement,
    title   TEXT not null,
    content TEXT not null
, image_post TEXT);
INSERT INTO "posts" VALUES(31,'Структура SQL-запроса','На изображении отображается структура SQL-запроса.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(38,'lorem loremloremloremlorem','loremloremloremloremloremloremloremloremloremloremloremloremloremlorem','sql_query_structure.jpg');
CREATE TABLE "releases"
(
    id       INTEGER
        primary key autoincrement,
    datetime datetime default CURRENT_TIMESTAMP,
    title    TEXT not null,
    content  TEXT not null
);
INSERT INTO "releases" VALUES(3,'2023-12-23 22:03:36','Validation','Made validation for data input to all application forms.');
INSERT INTO "releases" VALUES(5,'2023-12-25 09:33:13','Requirements','Generate the Requirements.txt file.');
INSERT INTO "releases" VALUES(6,'2023-12-25 11:19:17','New Menu','Menu layout.');
INSERT INTO "releases" VALUES(7,'2023-12-27 11:06:56','Picture upload','Picture upload functionality has been developed.');
INSERT INTO "releases" VALUES(12,'2023-12-28 11:05:16','Fixed font, layout and partially application logic.','Fixed font, layout and partially application logic.');
INSERT INTO "releases" VALUES(13,'2023-12-28 11:40:29','1 Megabyte uploaded picture size ','Made the uploaded picture size limit to 1 Megabyte.');
INSERT INTO "releases" VALUES(14,'2024-01-02 17:48:48','Fixed redirection after uploading an image.','Fixed redirection after uploading an image.');
INSERT INTO "releases" VALUES(15,'2024-01-02 17:50:09','The image upload folder has been changed to "Images"','The image upload folder has been changed to "Images"');
INSERT INTO "releases" VALUES(16,'2024-01-04 12:03:42','Added logic for 404 page errors','Added logic for 404 page errors.');
INSERT INTO "releases" VALUES(17,'2024-01-04 12:10:29','Creating a database backup app','Creating a database backup app.');
CREATE TABLE "tasks"
(
    id_task       INTEGER
        primary key autoincrement,
    datetime_task datetime default CURRENT_TIMESTAMP,
    title_task    TEXT not null,
    content       TEXT not null
);
INSERT INTO "tasks" VALUES(1,'2023-12-22 08:50:07','GENERATED LOREM IPSUM','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed blandit libero volutpat sed cras ornare arcu dui vivamus. Purus in mollis nunc sed id semper. Ac tortor dignissim convallis aenean et tortor at risus. Quis viverra nibh cras pulvinar mattis nunc sed. Sapien et ligula ullamcorper malesuada proin. Tempus egestas sed sed risus pretium quam. At ultrices mi tempus imperdiet nulla malesuada. Ultricies lacus sed turpis tincidunt. Non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus. Mauris commodo quis imperdiet massa tincidunt nunc pulvinar. Egestas integer eget aliquet nibh praesent tristique. Viverra ipsum nunc aliquet bibendum enim facilisis. Facilisi etiam dignissim diam quis. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant. Sit amet risus nullam eget felis eget nunc lobortis.

Eget est lorem ipsum dolor. Tempor nec feugiat nisl pretium fusce id velit ut. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Viverra ipsum nunc aliquet bibendum enim. Penatibus et magnis dis parturient montes nascetur ridiculus. Id donec ultrices tincidunt arcu. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Dui id ornare arcu odio ut sem. Adipiscing tristique risus nec feugiat in. Laoreet non curabitur gravida arcu ac tortor dignissim.

Quis enim lobortis scelerisque fermentum dui. Tellus molestie nunc non blandit massa enim nec dui. Pulvinar sapien et ligula ullamcorper malesuada. Et tortor at risus viverra adipiscing at in tellus integer. Eget magna fermentum iaculis eu non diam. Ultricies tristique nulla aliquet enim tortor. Ipsum suspendisse ultrices gravida dictum fusce ut placerat. Arcu cursus vitae congue mauris. Velit ut tortor pretium viverra suspendisse potenti. Nisl tincidunt eget nullam non. Sociis natoque penatibus et magnis. Non tellus orci ac auctor augue mauris augue.

Elementum curabitur vitae nunc sed. Tincidunt ornare massa eget egestas purus viverra accumsan in nisl. Pretium fusce id velit ut tortor pretium. Volutpat blandit aliquam etiam erat velit. Vel orci porta non pulvinar neque laoreet suspendisse interdum. Aliquet porttitor lacus luctus accumsan. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Mauris a diam maecenas sed enim ut sem viverra aliquet. Aenean sed adipiscing diam donec adipiscing. Pharetra et ultrices neque ornare aenean euismod elementum nisi. Eros donec ac odio tempor orci. Urna nec tincidunt praesent semper. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque. Facilisis volutpat est velit egestas dui.

Malesuada proin libero nunc consequat interdum varius sit. Ultrices eros in cursus turpis massa tincidunt dui ut ornare. Velit laoreet id donec ultrices. Mauris sit amet massa vitae tortor condimentum lacinia. Elit pellentesque habitant morbi tristique senectus. Maecenas pharetra convallis posuere morbi leo. Aliquam etiam erat velit scelerisque in dictum non consectetur a. Orci porta non pulvinar neque laoreet suspendisse interdum. Nibh cras pulvinar mattis nunc sed blandit. Hac habitasse platea dictumst quisque sagittis purus sit. Cursus metus aliquam eleifend mi in nulla. Lectus magna fringilla urna porttitor rhoncus dolor purus non enim. Nec feugiat in fermentum posuere. Vel quam elementum pulvinar etiam. Sit amet purus gravida quis blandit turpis cursus. Proin fermentum leo vel orci porta non pulvinar neque.');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',43);
INSERT INTO "sqlite_sequence" VALUES('tasks',9);
INSERT INTO "sqlite_sequence" VALUES('releases',17);
COMMIT;
