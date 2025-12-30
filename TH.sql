create database OnlineLearningSystem;
use OnlineLearningSystem;

create table Student (
    StudentID int primary key,
    FullName nvarchar(100) not null,
    DateOfBirth date,
    Email varchar(100) not null unique
);

create table Teacher (
    TeacherID int primary key,
    FullName nvarchar(100) not null,
    Email varchar(100) not null
);

create table Course (
    CourseID int primary key,
    CourseName nvarchar(200) not null,
    Description nvarchar(500),
    NumberOfSessions int,
    TeacherID int,
    foreign key (TeacherID) references Teacher(TeacherID)
);

create table Enrollment (
    EnrollmentID int primary key,
    StudentID int not null,
    CourseID int not null,
    EnrollmentDate date not null,
    foreign key (StudentID) references Student(StudentID),
    foreign key (CourseID) references Course(CourseID),
    unique (StudentID, CourseID)
);

create table Result (
    ResultID int primary key,
    StudentID int not null,
    CourseID int not null,
    MidtermScore decimal(3,1) check (MidtermScore >= 0 and MidtermScore <= 10),
    FinalScore decimal(3,1) check (FinalScore >= 0 and FinalScore <= 10),
    foreign key (StudentID) references Student(StudentID),
    foreign key (CourseID) references Course(CourseID),
    unique (StudentID, CourseID)
);

insert into Student (StudentID, FullName, DateOfBirth, Email)
values 
    (1, 'Nguyễn Văn An', '2003-05-15', 'an.nguyen@email.com'),
    (2, 'Trần Thị Bình', '2003-08-20', 'binh.tran@email.com'),
    (3, 'Lê Văn Cường', '2002-12-10', 'cuong.le@email.com'),
    (4, 'Phạm Thị Dung', '2003-03-25', 'dung.pham@email. com'),
    (5, 'Hoàng Văn Em', '2002-07-30', 'em.hoang@email.com');

insert into Teacher (TeacherID, FullName, Email)
values 
    (1, 'Ngô Minh Tuấn', 'tuan.ngo@school.edu.vn'),
    (2, 'Đặng Thị Hoa', 'hoa. dang@school.edu.vn'),
    (3, 'Bùi Văn Khoa', 'khoa.bui@school.edu. vn'),
    (4, 'Võ Thị Lan', 'lan.vo@school.edu.vn'),
    (5, 'Trương Văn Nam', 'nam.truong@school. edu.vn');

insert into Course (CourseID, CourseName, Description, NumberOfSessions, TeacherID)
values 
    (1, 'Lập trình C++', N'Học lập trình C++ cơ bản', 30, 1),
    (2, 'Cơ sở dữ liệu', N'Học về SQL và thiết kế CSDL', 25, 2),
    (3, 'Toán rời rạc', N'Học toán rời rạc cho khoa học máy tính', 28, 3),
    (4, 'Mạng máy tính', N'Học về mạng và truyền thông', 32, 4),
    (5, 'Tiếng Anh chuyên ngành', N'Tiếng Anh cho IT', 20, 5);

insert into Enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate)
values 
    (1, 1, 1, '2024-01-10'),
    (2, 1, 2, '2024-01-10'),
    (3, 2, 1, '2024-01-11'),
    (4, 2, 3, '2024-01-11'),
    (5, 3, 2, '2024-01-12'),
    (6, 3, 4, '2024-01-12'),
    (7, 4, 1, '2024-01-13'),
    (8, 5, 5, '2024-01-14');

insert into Result (ResultID, StudentID, CourseID, MidtermScore, FinalScore)
values 
    (1, 1, 1, 8.5, 9.0),
    (2, 1, 2, 7.0, 8.0),
    (3, 2, 1, 6.5, 7.5),
    (4, 2, 3, 9.0, 9.5),
    (5, 3, 2, 8.0, 8.5);

update Student
set Email = 'nguyenvanan. new@email.com'
where StudentID = 1;

update Course
set Description = N'Học về SQL, thiết kế CSDL và quản trị hệ thống'
where CourseID = 2;

update Result
set FinalScore = 9.0
where StudentID = 3 and CourseID = 2;

delete from Result
where StudentID = 5;

delete from Enrollment
where StudentID = 5 and CourseID = 5;

select * from Student;

select * from Teacher;

select * from Course;

select * from Enrollment;

select * from Result;