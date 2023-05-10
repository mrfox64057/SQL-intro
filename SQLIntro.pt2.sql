/* joins: select all the computers from the products table:
using the products table and the categories table
 return the product name and the category name */
 
 select p.Name as Product, c.Name as Category 
 from products as p
 inner join Categories as c on p.CategoryID = c.CategoryID
 where c.CategoryID = 1;
 
 
 select p.Name as Product, c.Name as Category 
 from products as p
 inner join Categories as c
 on p.CategoryID = c.CategoryID
 where c.Name = 'Computers';
 
 select products.Name as Product, categories.Name as Category from products
 inner join categories on categories.CategoryID = products.CategoryID
 where categories.Name = 'Computers'; 

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 select p.Name, r.Rating from products as p 
 inner join reviews as r
 on p.ProductID = r.ProductID
 where r.Rating = 5;
 
 select p.Name, p.Price, r.Rating from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
/*
select e.FirstName, e.LastName, sum(s.Quantity) as toal
from employees as e
inner join sales as s
on e.EmployeeId = s.EmployeeID
group by e.EmployeeID
order by toatl desc;        */ -- this did't work for some reason

select e.FirstName, e.LastName, Sum(s.Quantity) as total from sales as s
inner join  employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by Total desc limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

select d.Name as 'Department Name', c.Name as 'Category Type' from departments as d 
inner join  categories as c on c.DepartmentID = d.DepartmentID
where c.Name = 'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

select p.Name, sum(s.Quantity) as 'Total Units Sold', sum(s.Quantity * s.PricePerUnit) as 'Total Price'
from products as p
inner join sales as s
on p.ProductID = s.ProductID
where p.ProductID like '%Eagles%Hotel%California%'
group by p.Name;


select p.Name, Sum(s.Quantity) as 'Units Sold', Sum(s.Quantity * s.PricePerUnit) as 'Amount Made' from products as p
inner join sales as s on s.ProductID = p.ProductID where p.ProductID = 97;
  

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select p.Name, p.Price, Min(r.Rating)
from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857
group by p.ProductID;    

select products.Name as 'Product Name', reviews.Reviewer as 'Reviewer Name', reviews.Rating, reviews.Comment
from products
inner join reviews
on products.ProductID = reviews.ProductID
where products.ProductID = 857
and reviews.Rating = 1;

/*                         MIN(r.Rating)    */
select p.Name, r.Reviewer, r.Rating, r.Comment from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1
group by p.ProductionID, r.Reviewer;        

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select e.EmployeeID, e.FirstName, e.LastName, p.Name as Item, Sum(s.Quantity) as TotalSold 
from Sales as s
inner join employees as e on s.EmployeeID = e.EmployeeID
inner join products as p on s.ProductID = p.ProductID
group by e.EmployeeID, p.ProductID
order by EmployeeID;