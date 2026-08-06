use School_db;
-- 15.	List the students who don’t contain ‘A’ and ‘R’ in their names. 
select FullName
from student_raw_transformed_withtime
where fullname not regexp '[ar]';

-- 16.	List the students whose names contain only these characters - “A” or “B” or “C” or “D” (eg – names like “dada” “baba” “caba”) 
select FullName
from student_raw_transformed_withtime
where fullname not regexp '[e-z]';   
-- another method 
select FullName
from student_raw_transformed_withtime
where fullname regexp "^[abcd]+$"; 

-- 17.	List the students whose names don’t contain t, o, r anywhere
select FullName
from student_raw_transformed_withtime
where fullname not regexp '[tor]';

/* 18.List the students whose names contain only three characters and must 
contain at least one of the following characters: a, e, u*/
select FullName
from student_raw_transformed_withtime
where fullname regexp '^...$' and fullname regexp '[aeu]';