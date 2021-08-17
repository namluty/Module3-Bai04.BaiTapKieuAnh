create database ManagerStudent;
use ManagerStudent;
create table address
(
    id_address   int primary key auto_increment,
    name_address varchar(50)
);

create table classes
(
    id_classes   int primary key auto_increment,
    name_classes varchar(50) not null,
    language     varchar(50) not null,
    description  varchar(255)
);

create table students
(
    id_student int primary key auto_increment,
    full_name  varchar(100) not null,
    id_address int          not null,
    phone      varchar(50)  not null unique,
    id_classes int          not null,
        foreign key (id_address) references address (id_address),
        foreign key (id_classes) references classes (id_classes)
);

create table course
(
    id_course          int primary key auto_increment,
    name_course        varchar(50) not null,
    description_course varchar(255)
);

create table point
(
    id_point   int primary key auto_increment,
    id_course  int not null,
    id_student int not null,
    point      int not null,
        foreign key (id_student) references students (id_student),
        foreign key (id_course) references course (id_course)
);

# Thêm dữ liệu
insert into ManagerStudent.address(id_address, name_address)
values (1, 'Hà Nội');
insert into ManagerStudent.address(id_address, name_address)
values (2, 'Vĩnh Phúc');
insert into ManagerStudent.address(id_address, name_address)
values (3, 'Bắc Ninh');
insert into ManagerStudent.address(id_address, name_address)
values (4, 'Hà Nam');
insert into ManagerStudent.address(id_address, name_address)
values (5, 'Bắc Giang');
insert into ManagerStudent.classes(id_classes, name_classes, language, description)
values (null, 'class1', 'Java', 'Java FullTime');
insert into ManagerStudent.classes(id_classes, name_classes, language, description)
values (null, 'class2', 'PHP', 'PHP FullTime');
insert into ManagerStudent.classes(id_classes, name_classes, language, description)
values (null, 'class3', 'Ruby', 'Ruby FullTime');
insert into ManagerStudent.classes(id_classes, name_classes, language, description)
values (null, 'class4', 'Python', 'Python FullTime');
insert into ManagerStudent.classes(id_classes, name_classes, language, description)
values (null, 'class5', 'Java', 'Java PartTime');
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van A', 1, '098765432', 2);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van B', 2, '098763455', 3);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van C', 3, '098762344', 4);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van D', 4, '098726266', 5);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van E', 5, '098764574', 1);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van F', 4, '098765756', 2);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van G', 5, '098765439', 3);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van H', 3, '098744566', 5);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van I', 2, '098765423', 4);
insert into ManagerStudent.students(id_student, full_name, id_address, phone, id_classes)
values (null, 'Nguyen Van K', 1, '098766457', 2);
insert into ManagerStudent.course(id_course, name_course, description_course)
values (null, 'Java FullTime', 'desc 1');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (null, 'PHP FullTime', 'desc 2');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (null, 'Ruby FullTime', 'desc 3');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (null, 'Python FullTime', 'desc 4');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (null, 'Java PartTime', 'desc 5');

insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 1, 1, 5);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 2, 3, 6);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 3, 4, 7);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 4, 5, 8);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 5, 6, 9);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 4, 7, 10);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 3, 8, 9);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 2, 9, 8);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 1, 10, 7);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 2, 10, 6);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 3, 3, 5);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 4, 5, 6);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 5, 6, 7);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 2, 7, 8);
insert into ManagerStudent.point(id_point, id_course, id_student, point)
values (null, 3, 1, 9);

#Thống kê số lượng HV các lớp
select name_classes, count(name_classes) 'Student Quantity' from classes
    join students s on classes.id_classes = s.id_classes group by name_classes;
#Thống kê số lượng học viên tại các tỉnh
select name_address, count(name_address) 'Student Quantity Of Province'
from address join students s on address.id_address = s.id_address
group by name_address;
#Tính điểm trung bình của các khóa học
select name_course, avg(point) 'Grade Average'
from point
         join course c on point.id_course = c.id_course
group by name_course;
#Đưa ra khóa học có điểm trung bình cao nhất
select name_course, avg(point) as avg_point
from point
         join course c on point.id_course = c.id_course
group by name_course having  avg_point >= ALL   (SELECT avg(point) as avg_point from point
                                      join course c on point.id_course = c.id_course
                              group by name_course);