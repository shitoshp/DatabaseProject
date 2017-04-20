CREATE TABLE Students (

StudentID int NOT NULL,

FirstName varchar(30) NOT NULL,

LastName varchar(30) NOT NULL,

Major varchar(20),

PRIMARY KEY (StudentID)

);

INSERT INTO Students(StudentID, FirstName, LastName, Major)
VALUES 
(3120, 'Shitosh', 'Parajuli', 'CS'),
(3091, 'Sudheesh', 'Bhattarai', 'CS'),
(3152, 'Gauri', 'Shankar', 'CS');








CREATE TABLE Courses (
  CourseID int NOT NULL,
  Department varchar(20) NOT NULL,
  CourseNumber int NOT NULL,
  CourseName varchar(50) NOT NULL,
  Semester varchar(10) NOT NULL,
  Year int NOT NULL,
  PRIMARY KEY (CourseID)
);


INSERT INTO Courses (CourseID, Department, CourseNumber, CourseName, Semester, Year)
VALUES
(1, 'CS', 41, 'Database', 'Spring', 2017);




CREATE TABLE Enrollment (
  StudentID int NOT NULL,
  CourseID int NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);


INSERT INTO Enrollment (StudentID, CourseID)
VALUES
(3120, 1),
(3091, 1);

SELECT StudentID FROM Enrollment WHERE CourseID = 2016;




CREATE TABLE Weights (
  WeightID int NOT NULL,
  CourseID int NOT NULL,
  Category varchar(20) NOT NULL,
  Percent int NOT NULL,
  PRIMARY KEY (WeightID)
);


INSERT INTO Weights (WeightID, CourseID, Category, Percent)
VALUES
(1, 2014, 'Quiz', 100),
(2, 2016, 'Test', 50);

SELECT Category FROM Weights WHERE Percent = 50;


CREATE TABLE Assignments (
  AssignmentID int NOT NULL,
  WeightID int NOT NULL,
  Instance int NOT NULL,
  TotalScore int DEFAULT 0 NOT NULL,
  PRIMARY KEY(AssignmentID) 
);



INSERT INTO Assignments (AssignmentID, WeightID, Instance, TotalScore)
VALUES
(1, 20, 1, 100),
(2, 30, 2, 100);


CREATE TABLE PointsTable (
  StudentID int NOT NULL,
  AssignmentID int NOT NULL,
  Score int DEFAULT 0 NOT NULL,
  PRIMARY KEY (StudentID, AssignmentID)
);




INSERT INTO PointsTable (StudentID, AssignmentID, Score)
VALUES
(3120, 1, 100),
(3091, 2, 90),
(3120, 2, 95);






SET @cid = (SELECT CourseID FROM Courses WHERE CourseName = 'Database');

SELECT FirstName, LastName FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollment WHERE CourseID = @cid);
SELECT Score FROM PointsTable WHERE StudentID IN (SELECT StudentID FROM Enrollment WHERE CourseID = @cid);







