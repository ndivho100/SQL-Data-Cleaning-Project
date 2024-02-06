SELECT * FROM StudentDatabase.dbo.studentData


--CHANGE Abbreviations to full names
SELECT DISTINCT(sex), COUNT(sex)
FROM StudentDatabase.dbo.studentData
 GROUP BY sex

 SELECT sex,
 CASE WHEN sex = 'F' THEN 'Female'
 WHEN sex = 'M' THEN 'Male'
 ELSE sex
 END
FROM StudentDatabase.dbo.studentData

UPDATE studentData
SET sex=  CASE WHEN sex = 'F' THEN 'Female'
 WHEN sex = 'M' THEN 'Male'
 ELSE sex
 END
FROM StudentDatabase.dbo.studentData


SELECT DISTINCT(school), COUNT(school)
FROM StudentDatabase.dbo.studentData
 GROUP BY school

 SELECT school,
 CASE WHEN school = 'GP' THEN 'Geography School'
 WHEN school = 'MS' THEN 'Maths School'
 ELSE school
 END
FROM StudentDatabase.dbo.studentData

UPDATE studentData
SET school=  CASE WHEN sex = 'GP' THEN 'Geography School'
 WHEN school = 'MS' THEN 'Maths School'
 ELSE school
 END
FROM StudentDatabase.dbo.studentData

--DUm()

--Delete duplicates
SELECT school,sex,age,address,famsize,Pstatus,Medu,Fedu,Mjob,Fjob,reason,guardian, COUNT(*) FROM 
StudentDatabase.dbo.studentData
GROUP BY school,sex,age,address,famsize,Pstatus,Medu,Fedu,Mjob,Fjob,reason,guardian
HAVING COUNT(*) > 1

WITH DUp_CTE AS(
SELECT school,sex,age,address,famsize,Pstatus,Medu,Fedu,Mjob,Fjob,reason,guardian,
ROW_NUMBER() OVER (PARTITION BY school,sex,age,address,famsize,Pstatus,Medu,Fedu,Mjob,Fjob,reason,guardian ORDER BY school) as DuplicateCount
FROM StudentDatabase.dbo.studentData
)
DELETE FROM DUp_CTE WHERE DuplicateCount>1

--Delete columns

SELECT* FROM StudentDatabase.dbo.studentData

ALTER TABLE StudentDatabase.dbo.studentData
DROP COLUMN G1,G2,G3