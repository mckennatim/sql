SELECT * FROM `map_employee_hierarchy` as m 
JOIN 
(select * from `dim_employee`) as d

SELECT `employee_id`, `manager_id` FROM `map_employee_hierarchy` as m 
JOIN 
(select * from `dim_employee`) as d 
ON m.employee_id = d.id

SELECT * FROM `map_employee_hierarchy` as m 
JOIN 
(select * from `dim_employee`) as d 
ON m.employee_id = d.id

SELECT `employee_id`, `manager_id`  FROM `map_employee_hierarchy` as m 
JOIN 
(select * from `dim_employee`) as d 
ON m.employee_id = d.id as g 

SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id, AVG(dim_employee.salary) as av
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id
GROUP BY map_employee_hierarchy.manager_id



SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id 

SELECT `manager_id`, AVG(salary) as av FROM `v1`group by manager_id


SELECT `me.manager_id`, AVG(me.salary) as av FROM 
(SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id)
AS me
group by manager_id


create view v2 AS
SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id 

create view v3 AS 
	SELECT `manager_id`, AVG(salary) as av FROM `v2`group by manager_id

select v2.employee_id, v2.salary, v3.av from v2
join v3 ON
v2.manager_id=v3.manager_id

select v2.employee_id, v2.salary, v3.av from v2
join v3 ON
v2.manager_id=v3.manager_id

---finds average
SELECT map_employee_hierarchy.manager_id,
AVG(dim_employee.salary) as av 
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id 
GROUP by map_employee_hierarchy.manager_id 

---joins tables
SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id
FROM  map_employee_hierarchy 
JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id 

---finds manager average
SELECT v2.manager_id, AVG(v2.salary) AS av
from v2 
group by v2.manager_id

SELECT v2.employee_id , v2.manager_id, v2.salary, av 
FROM v2 
JOIN (SELECT v2.manager_id as man, AVG(v2.salary) AS av
from v2 
group by v2.manager_id) as vv
ON vv.man= v2.manager_id
WHERE v2.salary < av
ORDER BY v2.manager_id


(SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id , av
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id) 
JOIN v3


SELECT v2.employee_id , v2.manager_id, v2.salary, av 
FROM v2 
JOIN (SELECT v2.manager_id as man, AVG(v2.salary) AS av
from v2 
group by v2.manager_id) as vv
ON vv.man= v2.manager_id
WHERE v2.salary < av
ORDER BY v2.manager_id

SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id, av
FROM  map_employee_hierarchy 
	JOIN dim_employee
		ON map_employee_hierarchy.employee_id=dim_employee.id 
	JOIN v3
		ON 	v3.manager_id = map_employee_hierarchy.manager_id

SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id, av
FROM  map_employee_hierarchy 
	JOIN dim_employee
		ON map_employee_hierarchy.employee_id=dim_employee.id 
	JOIN (SELECT v2.manager_id as man, AVG(v2.salary) AS av
			from v2 
			group by v2.manager_id) as vv
		ON vv.man= map_employee_hierarchy.manager_id
	WHERE dim_employee.salary < av
	ORDER BY map_employee_hierarchy.manager_id		

---solution
SELECT map_employee_hierarchy.manager_id, map_employee_hierarchy.employee_id, dim_employee.salary, avg_salary_at_peer_group_level
FROM  map_employee_hierarchy 
	JOIN dim_employee
		ON map_employee_hierarchy.employee_id=dim_employee.id 
	JOIN (SELECT map_employee_hierarchy.manager_id,
			AVG(dim_employee.salary) as avg_salary_at_peer_group_level 
			FROM  map_employee_hierarchy 
				JOIN dim_employee
				ON map_employee_hierarchy.employee_id=dim_employee.id 
			GROUP by map_employee_hierarchy.manager_id ) as vv
		ON vv.manager_id= map_employee_hierarchy.manager_id
	WHERE dim_employee.salary < avg_salary_at_peer_group_level
	ORDER BY map_employee_hierarchy.manager_id	


---finds average
(SELECT map_employee_hierarchy.manager_id,
AVG(dim_employee.salary) as av 
FROM  map_employee_hierarchy 
	JOIN dim_employee
	ON map_employee_hierarchy.employee_id=dim_employee.id 
GROUP by map_employee_hierarchy.manager_id ) as vv

create view v2 AS
SELECT map_employee_hierarchy.employee_id, dim_employee.salary, 
map_employee_hierarchy.manager_id
FROM  map_employee_hierarchy JOIN dim_employee
ON map_employee_hierarchy.employee_id=dim_employee.id		