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
(3091, 'Sudheesh', 'Qhattarai', 'CS'),
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
(1, 'CS', 41, 'Database', 'Spring', 2017),
(2, 'CS', 51, 'OR', 'Spring', 2017);




CREATE TABLE Enrollment (
  StudentID int NOT NULL,
  CourseID int NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);


INSERT INTO Enrollment (StudentID, CourseID)
VALUES
(3120, 1),
(3091, 2),
(3152, 1);

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
(1, 1, 'Participation', 10),
(2, 1, 'Homework', 20),
(3, 1, 'Test', 50),
(4, 1, 'Project', 20);

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
(1, 1, 1, 100),
(2, 2, 1, 50),
(3, 2, 2, 50),
(4, 3, 1, 100),
(5, 3, 2, 100),
(6, 4, 1, 100),
(7, 4, 2, 100);


CREATE TABLE PointsTable (
  StudentID int NOT NULL,
  AssignmentID int NOT NULL,
  Score int DEFAULT 0 NOT NULL,
  PRIMARY KEY (StudentID, AssignmentID)
);




INSERT INTO PointsTable (StudentID, AssignmentID, Score)
VALUES
(3120, 1, 100)
(3120, 2, 45)
(3120, 3, 47)
(3120, 4, 85)
(3120, 5, 99)
(3120, 6, 100)
(3120, 7, 94)
(3091, 1, 100)
(3091, 2, 50)
(3091, 3, 48)
(3091, 4, 93)
(3091, 5, 81)
(3091, 6, 95)
(3091, 7, 91)
(3152, 1, 86)
(3152, 2, 48)
(3152, 3, 48)
(3152, 4, 92)
(3152, 5, 89)
(3152, 6, 93)
(3152, 7, 97)




SET @cid = (SELECT CourseID FROM Courses WHERE CourseName = 'Database');

SELECT FirstName, LastName FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollment WHERE CourseID = @cid);
SELECT Score FROM PointsTable WHERE StudentID IN (SELECT StudentID FROM Enrollment WHERE CourseID = @cid);






UPDATE Students s, PointsTable p SET p.Score = p.Score + 2 FROM Students s WHERE s.StudentID = p.StudentID and
	(s.LastName LIKE '%Q%' OR s.LastName LIKE '%q%');

SELECT Score FROM PointsTable