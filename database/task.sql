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


-- Provide a list of Vendors that supply more than one type of product 
-- HINT : [Purchasing].[ProductVendor],[Purchasing].[Vendor], 
-- Non correlated sub query in WHERE Clause,GROUP BY IN Subquery , 
-- HAVING In Subquery, COUNT IN Subquery

SELECT 







