--Return a list of first name, last name and  phone numbers Remember that all records need to have phone numbers
--HINT: Person.Person AND Person.PersonPhone

SELECT p.FirstName, p.LastName, pp.PhoneNumber
FROM Person.Person p
INNER JOIN Person.PersonPhone pp
ON p.BusinessEntityID = pp.BusinessEntityID
WHERE pp.PhoneNumberType = 'Work'


--Using the same tables from question 1, return the first name, middle name and last name and email
-- address, remember that all the names must have email addresses create a derived columns called Full
-- name that will concatenated values that includes Title, First Name, Middle Name, Last name. 
-- Also include their email addresses. 
-- Hint: Person.PersonPhone and Person.EmailAddress
SELECT p.FirstName, p.MiddleName, p.LastName, e.EmailAddress, p.Title + ' ' + p.FirstName + ' ' + p.MiddleName + ' ' + p.LastName AS FullName
FROM Person.Person p
INNER JOIN Person.EmailAddress e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE p.MiddleName IS NOT NULL


--Please return all the list of phone numbers where the phone number type is "Home" 
-- HINT:Person.PersonPhone, Person.PhoneNumberType, WHERE
SELECT pp.PhoneNumber
FROM Person.PersonPhone pp
INNER JOIN Person.PhoneNumberType pnt
ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
WHERE pnt.Name = 'Home'


--Retrieve the FirstName, MiddleName, LastName of all the employees. 
-- Also create a derived column called LegalName. LegalName is a combination of the FirstName,
-- MiddleName and LastName. If the middle name is null replace it with "NA".
-- Also create a derived column for the age of all the employees
-- HINT: Person.Person, HumanResources.Employee, DATEDIFF(), COALESCE() OR ISNULL()

SELECT p.FirstName, p.MiddleName, p.LastName, p.Title + ' ' + p.FirstName + ' ' + COALESCE(p.MiddleName, 'NA') + ' ' + p.LastName AS LegalName, DATEDIFF(YEAR, p.BirthDate, GETDATE()) AS Age
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID

-- Using the query from question 3&5, retrieve the FullName, age, PhoneNumber, 
-- Address and EmailAddress of all the employees.
-- HINT: HumanResources.Employee,Person.Person,Person.PersonPhone,Person.BusinessEntityAddress
-- 		,Person.EmailAddress,DATEDIFF(), COALESCE() OR ISNULL()
SELECT p.Title + ' ' + p.FirstName + ' ' + COALESCE(p.MiddleName, 'NA') + ' ' + p.LastName AS FullName, DATEDIFF(YEAR, p.BirthDate, GETDATE()) AS Age, pp.PhoneNumber, bea.AddressLine1, e.EmailAddress
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN Person.PersonPhone pp
ON p.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Person.BusinessEntityAddress bea
ON p.BusinessEntityID = bea.BusinessEntityID
INNER JOIN Person.EmailAddress ea
ON p.BusinessEntityID = ea.BusinessEntityID
WHERE pp.PhoneNumberType = 'Work'


--Provide a list of Employees (FirstName , LastName) that have changed departments at least twice
-- HINT : HumanResources.Employee ,[HumanResources].[EmployeeDepartmentHistory], 
-- Non correlated sub query in WHERE Clause,GROUP BY IN Subquery , 
-- HAVING In Subquery, COUNT IN Subquery
--Question 6
SELECT p.FirstName, p.LastName
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.BusinessEntityID = edh.BusinessEntityID
WHERE (SELECT COUNT(DISTINCT DepartmentID) FROM HumanResources.EmployeeDepartmentHistory WHERE BusinessEntityID = e.BusinessEntityID) >= 2
GROUP BY p.FirstName, p.LastName



--Using JOIN re-Write your the same question from question 6

SELECT p.FirstName, p.LastName
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.BusinessEntityID = edh.BusinessEntityID
GROUP BY p.FirstName, p.LastName
HAVING COUNT(DISTINCT edh.DepartmentID) >= 2



-- Provide a list of Vendors that supply more than one type of product 
-- HINT : [Purchasing].[ProductVendor],[Purchasing].[Vendor], 
-- Non correlated sub query in WHERE Clause,GROUP BY IN Subquery , 
-- HAVING In Subquery, COUNT IN Subquery
SELECT v.Name
FROM Purchasing.Vendor v
INNER JOIN Purchasing.ProductVendor pv
ON v.BusinessEntityID = pv.BusinessEntityID
WHERE (SELECT COUNT(DISTINCT ProductID) FROM Purchasing.ProductVendor WHERE BusinessEntityID = v.BusinessEntityID) >= 2
GROUP BY v.Name

---Re write question 8's query using a JOIN

SELECT v.Name
FROM Purchasing.Vendor v
INNER JOIN Purchasing.ProductVendor pv
ON v.BusinessEntityID = pv.BusinessEntityID
GROUP BY v.Name
HAVING COUNT(DISTINCT pv.ProductID) >= 2


--Provide a list of individual products (Product Name , List Price) 
-- that are supplied by different vendors. i.e a single product can be supplied by multiple vendors
-- HINT : [Purchasing].[ProductVendor],[Production].[Product], 
-- Non correlated sub query in WHERE Clause,GROUP BY IN Subquery , 
-- HAVING In Subquery, COUNT DISTINCT IN Subquery

SELECT p.Name, p.ListPrice
FROM Production.Product p
INNER JOIN Purchasing.ProductVendor pv
ON p.ProductID = pv.ProductID
WHERE (SELECT COUNT(DISTINCT BusinessEntityID) FROM Purchasing.ProductVendor WHERE ProductID = p.ProductID) >= 2
GROUP BY p.Name, p.ListPrice


-- Return the job title, birthdate, gender, and vacation hours, sick leave hours.
-- Write a column that meets the below condition
--    If the salaried Flag is 1 then Employee else contractor
--  If the salaried Flag is 1 then = "Yes Make"
--  Else "contractor"


SELECT j.Name
FROM HumanResources.JobCandidate j
INNER JOIN HumanResources.Employee e
ON j.BusinessEntityID = e.BusinessEntityID
WHERE (SELECT COUNT(DISTINCT BusinessEntityID) FROM HumanResources.Employee WHERE BusinessEntityID = j.BusinessEntityID) >= 2
GROUP BY j.Name


--RETURN THE [MaritalStatus], [Gender] ,[VacationHours] ,[SickLeaveHours]
--Please create a derived column to indicate when the Marital Status is 
--M to read married and when the 
--Marital Status is S to read single


SELECT p.MaritalStatus
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE (SELECT COUNT(DISTINCT BusinessEntityID) FROM HumanResources.Employee WHERE BusinessEntityID = p.BusinessEntityID) >= 2
GROUP BY p.MaritalStatus

--RETURN THE [MaritalStatus], [Gender] ,[VacationHours] ,[SickLeaveHours]
--Please create a derived column to indicate when the Marital Status is 
--M to read married and when the 
--Marital Status is S to read single
--Also create another derived column that indicate M for Male and F for female


SELECT p.MaritalStatus
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE (SELECT COUNT(DISTINCT BusinessEntityID) FROM HumanResources.Employee WHERE BusinessEntityID = p.BusinessEntityID) >= 2
GROUP BY p.MaritalStatus




--RETURN THE [MaritalStatus], [Gender] ,[VacationHours] ,[SickLeaveHours]
--Please create a derived column to indicate when the Marital Status is 
--M and vacation hours is grater than 50 it should read "Go to Vacation" 
--ALSO if the Marital Status is S and the vacation hours is less than
-- 30 it should "you need more hours"  
--Every other category should ready "you are safe"

SELECT p.MaritalStatus AS Marital
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE (SELECT COUNT(DISTINCT BusinessEntityID) FROM HumanResources.Employee WHERE BusinessEntityID = p.BusinessEntityID) >= 2
GROUP BY p.MaritalStatus







