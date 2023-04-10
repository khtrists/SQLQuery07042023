CREATE DATABASE Academy;
GO

USE Academy;
GO

CREATE TABLE Student (
    StudentID INT IDENTITY PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

GO

INSERT INTO Student (FirstName, LastName)
VALUES
    ('Hikmet', 'Abbasov'),
    ('Abbas', 'Abbasov'),
    ('Tofiq', 'Abbasov'),
    ('Nermin', 'Abbasova'),
    ('Humbet', 'Nerimanov'),
    ('Kamran', 'Elekberli'),
    ('Mursel', 'Abbasov'),
    ('Goodboy', 'Abbasov');

GO

CREATE TABLE [Group] (
    GroupID INT IDENTITY PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL
);

GO

INSERT INTO [Group] (GroupName)
VALUES
    ('P232'),
    ('TT23'),
    ('H13F'),
    ('4536'),
    ('AA01'),
    ('TT033'),
    ('ZZ88');

GO

CREATE TABLE Subject (
    SubjectID INT IDENTITY PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL
);

GO

INSERT INTO Subject (SubjectName)
VALUES
    ('MATH'),
    ('ECONOMY'),
    ('POLITIC'),
    ('QUANTUM PHYSICS'),
    ('PHYSICS'),
    ('HISTORY'),
    ('AZERBAIJAN LANGUAGE');

GO

CREATE TABLE Exam (
    ExamID INT IDENTITY PRIMARY KEY,
    ExamDate DATE NOT NULL,
    SubjectID INT NOT NULL,
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

GO

INSERT INTO Exam (ExamDate, SubjectID)
VALUES
    ('2023-01-01', 1),
    ('2023-02-01', 2),
    ('2023-03-01', 3),
    ('2022-04-01', 1),
    ('2023-05-01', 2);

GO

CREATE TABLE ExamResult (
    ExamResultID INT IDENTITY PRIMARY KEY,
    ExamID INT NOT NULL,
    StudentID INT NOT NULL,
    Points INT NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

GO

INSERT INTO ExamResult (ExamID, StudentID, Points)
VALUES
(1, 1, 80),
(1, 2, 90),
(1, 3, 85),
(2, 1, 75),
(2, 2, 95),
(3, 3, 90),
(4, 1, 85),
(5, 2, 80),
(5, 3, 92),
(5, 4, 88),
(5, 5, 78);



SELECT Student.*, [Group].GroupName
FROM Student
INNER JOIN [Group] ON Student.StudentID = [Group].GroupID;



SELECT Student.*, COUNT(ExamResult.ExamResultID) AS NumExams
FROM Student
LEFT JOIN ExamResult ON Student.StudentID = ExamResult.StudentID
GROUP BY Student.StudentID;



SELECT Subject.*
FROM Subject
LEFT JOIN Exam ON Subject.SubjectID = Exam.SubjectID
WHERE Exam.ExamID IS NULL;



