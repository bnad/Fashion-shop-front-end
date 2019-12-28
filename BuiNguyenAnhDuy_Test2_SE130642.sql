USE FUH_UNIVERSITY
--1
SELECT S.subName, COUNT(T.insSSN) as NumberOfTeacher
FROM tblSubject S, tblTeaching T, tblInstructor I
WHERE S.subCode = T.subCode AND T.insSSN = I.insSSN
GROUP BY S.subName
--2.
SELECT s.subName, COUNT(se.secCode) as Section
FROM tblSubject s, tblSection se
WHERE s.subCode =  se.subCode
GROUP BY s.subName
HAVING COUNT(se.secCode) <= ALL(
								SELECT COUNT(se.secCode)
								FROM tblSubject S, tblSection SE
								WHERE S.subCode =  SE.subCode
								GROUP BY S.subName
								)

--3. 
SELECT DISTINCT s.stuCode, s.stuName, a.secSemester,a.claCode,a.depName
FROM tblStudent s INNER JOIN(
							SELECT c.claCode, se.secSemester,d.depName
							FROM 
							tblClass c JOIN tblSection se ON c.claCode = se.claCode,
							tblDepartment d
							WHERE
							c.depCode = d.depCode AND
							d.depName LIKE N'% information technologies' AND
							se.secSemester = 1 AND
							se.secYear = 2010
							)a
ON s.claCode = a.claCode
--4.
SELECT su.subName, COUNT(s.stuCode)
FROM tblSubject su INNER JOIN tblDepartment d ON su.depCode = d.depCode 
INNER JOIN tblClass c ON d.depCode = c.depCode
INNER JOIN tblStudent s ON c.claCode = s.claCode
GROUP BY su.subName
HAVING COUNT(s.stuCode) >= ALL (
									SELECT AVG(s.stuCode)
									FROM tblSubject su INNER JOIN tblDepartment d ON su.depCode = d.depCode 
									INNER JOIN tblClass c ON d.depCode = C.depCode
									INNER JOIN tblStudent s ON c.claCode = s.claCode
									GROUP BY su.subName
								)
--5.
SELECT I.insName, S.secYear
FROM tblInstructor I INNER JOIN tblSection S ON I.insSSN = S.insSSN
WHERE S.secSemester <> 1 AND S.secYear <> 2010
--6
SELECT DISTINCT S.secNumber, COUNT(ST.stuCode) as TotalStudent
FROM tblSection S INNER JOIN tblClass C ON S.claCode = C.claCode INNER JOIN
tblStudent ST ON C.claCode = ST.claCode
GROUP BY S.secNumber
--7


