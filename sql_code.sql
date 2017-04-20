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



--For 4: Compute the average/highest/lowest score of an assignment;
SELECT AVG(Points) FROM StudentScores WHERE AssignmentID = givenID
SELECT MIN(Points) FROM StudentScores WHERE AssignmentID = givenID
SELECT MAX(Points) FROM StudentScores WHERE AssignmentID = givenID


--For 5: List all of the students in a given course;
SET @cid = (SELECT CourseID FROM Courses WHERE CourseName = 'Database');

SELECT FirstName, LastName FROM Students WHERE
  StudentID IN (
  SELECT StudentID FROM Enrollment WHERE CourseID = @cid
);


--For 6 :List all of the students in a course and all of their scores on every assignment;
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseID, p.AssignmentID, p.Score 
FROM Students s, Enrollment e, PointsTable p 
WHERE s.StudentID = p.StudentID and p.StudentID = e.StudentID and e.CourseID = 3;

--For 7: Add an assignment to a course;


-- For 8: Change the percentages of the categories for a course;
UPDATE Weights SET Percent = givenPercent WHERE Catergory = givenCategory;


--For 9: Add 2 points to the score of each student on an assignment;
 UPDATE PointsTable SET Score = Score + 2 WHERE AssignmentID = 2;


--For 10: Add 2 points just to those students whose last name contains a ‘Q’.


--For 11: Compute the grade for a student;

--For 12: Compute the grade for a student, where the lowest score for a given category is dropped.

