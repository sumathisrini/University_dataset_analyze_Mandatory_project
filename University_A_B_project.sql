# ****************************SQL Project2**********************

#1.Create new schema as alumni

create database alumni;
use alumni;

#2.Import all .csv files into MySQL

/* Right click on Tables->Table Data import Wizard
set path of the file -> next -> set the table name
import all files one by one.*/

select * from college_a_hs;
select * from college_a_sj;
select * from college_b_hs;
select * from college_a_se;
select * from college_b_se;
select * from college_b_sj;

#3. Run SQL command to see the structure of six tables

Desc college_b_sj;
Desc college_b_se;
Desc college_b_hs;
Desc college_a_sj;
Desc college_a_se;
Desc college_a_hs;

/*#4. Display first 1000 rows of tables 
(College_A_HS, College_A_SE, College_A_SJ, 
College_B_HS, College_B_SE, College_B_SJ) with Python.

Run the following code in python
import mysql;
import mysql.connector;
testdb=mysql.connector.connect(host='Localhost',user='root',password='2404',database='alumni')
cur=testdb.cursor()

# For college_a_hs
cur.execute('select * from college_a_hs limit 1000')
cur.fetchall()

# For college_a_sj
cur.execute('select * from college_a_sj limit 1000')
cur.fetchall()

# For college_a_se
cur.execute('select * from college_a_se limit 1000')
cur.fetchall()

# For college_b_se
cur.execute('select * from college_b_se limit 1000')
cur.fetchall()

#For college_b_sj
cur.execute('select * from college_b_sj limit 1000')
cur.fetchall()

# For college_b_hs
cur.execute('select * from college_b_hs limit 1000')
cur.fetchall()


*/

#5.Import first 1500 rows of tables 
# (College_A_HS, College_A_SE, College_A_SJ, 
# College_B_HS, College_B_SE, College_B_SJ) into MS Excel.

/*Open excel -> data-> mysql connector-> 
login to mysql-> select alumni database.
choose the table start importing set the advance limit to 1500
and start importing one by one file
 kindly refer the attached  sqlproject2.doc. file.

#6.Perform data cleaning on table College_A_HS and store 
cleaned data in view College_A_HS_V, Remove null values. */


CREATE VIEW college_a_hs_v AS
    (SELECT 
        *
    FROM
        college_a_hs
    WHERE
        RollNO IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL);

#7. Perform data cleaning on table College_A_SE and store 
# cleaned data in view College_A_SE_V, Remove null values.


CREATE VIEW college_a_se_v AS
    (SELECT 
        *
    FROM
        college_a_se
    WHERE
        RollNO IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL);



#8. Perform data cleaning on table College_A_SJ and 
# store cleaned data in view College_A_SJ_V, Remove null values.

CREATE VIEW college_a_sj_v AS
    (SELECT 
        *
    FROM
        college_a_sj
    WHERE
        RollNO IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL);
            
            
# 9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values. --


CREATE VIEW college_b_hs_v AS
    (SELECT 
        *
    FROM
        college_b_hs
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL);
            
# 10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values. --

CREATE VIEW college_b_se_v AS
   ( SELECT 
        *
    FROM
        college_b_se
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND presentstatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL);
            
# 11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V. --

CREATE VIEW college_b_sj_v AS
    (SELECT 
        *
    FROM
        college_b_sj
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus  IS NOT NULL
            AND organization  IS NOT NULL
            AND designation IS NOT NULL
            AND Location IS NOT NULL);


/*#12.Make procedure to use string function/s for converting 
record of Name, FatherName, MotherName into lower case for 
views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V)*/

# 1. College_A_HS_V

delimiter $$
create procedure con_low_ahs()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_a_hs_v ;
end $$
delimiter ;
call con_low_ahs()

#2.College_A_SE_V

delimiter $$
create procedure con_low_ase()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_a_se_v;
end $$
delimiter ;
call con_low_ase();

#3.College_A_SJ_V

delimiter $$
create procedure con_low_asj()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_a_sj_v;
end $$
delimiter ;
call con_low_asj();

#4. College_B_HS_V

delimiter $$
create procedure con_low_bhs()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_b_hs_v;
end $$
delimiter ;
call con_low_bhs();

# 5.college_b_se_v

delimiter $$
create procedure con_low_bse()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_b_se_v;
end $$
delimiter ;
call con_low_bse();

#6.college_b_sj

delimiter $$
create procedure con_low_bsj()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_b_sj_v;
end $$
delimiter ;
call con_low_bsj();



#13.Import the created views (College_A_HS_V, College_A_SE_V,
# College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
# into MS Excel and make pivot chart for location of Alumni. 

/* Pivot chart has been created for all the views and snap shot has been 
stored in attached sqlproject2.doc. kindly refer it.*/


#14.Write a query to create procedure get_name using the cursor 
# to fetch names of all students from college A.

Delimiter //
CREATE procedure get_name()
BEGIN
declare f int default 0;
declare temp text;
declare Nam text;
declare c_a 
cursor for select name from college_a;
declare continue handler for not found set f=1;
open c_a;
loop1:loop
	fetch c_a into temp;
    if f = 1 then leave loop1;
    end if;
    set Nam=concat_ws(";",temp,Nam);
End loop;
close c_a;
select Nam as Name_list;
End //
Delimiter ;

call get_name();

#15.Write a query to create procedure get_name using the cursor
# to fetch names of all students from college B.

Delimiter //
CREATE procedure get_name_b()
BEGIN
declare f int default 0;
declare temp text;
declare Nam text;
declare c_a 
cursor for select name from college_b;
declare continue handler for not found set f=1;
open c_a;
loop1:loop
	fetch c_a into temp;
    if f = 1 then leave loop1;
    end if;
    set Nam=concat_ws(";",temp,Nam);
End loop;
close c_a;
select Nam as Name_list;
End //
Delimiter ;

call get_name_b();

#16. Calculate the percentage of career choice of College A 
# and College B Alumni (w.r.t Higher Studies, Self Employed 
# and Service/Job) 

# for college A 

select count(rollno) from college_a_hs;
select count(rollno) from college_a_se;
select count(rollno) from college_a_sj;
# add all the above count total is 5884

SELECT 
    'P_Higher_studies' AS 'Career_choice_percent',
    (COUNT(college_a_hs.rollno) / 5884) * 100 'College_A'
FROM
    college_a_hs 
UNION SELECT 
    'P_Self_Employed',
    (COUNT(college_a_se.rollno) / 5884) * 100
FROM
    college_a_se 
UNION SELECT 
    'P_Service/Job',
    (COUNT(college_a_sj.rollno) / 5884) * 100
FROM
    college_a_sj;
    
    
    
# for college b

select count(rollno) from college_b_hs;
select count(rollno) from college_b_se;
select count(rollno) from college_b_sj;
# add all the above count total is 2259

SELECT 
    'P_Higher_studies' AS 'Career_choice_percent',
    (COUNT(college_b_hs.rollno) / 2259) * 100 'College_B'
FROM
    college_b_hs 
UNION SELECT 
    'P_Self_Employed',
    (COUNT(college_b_se.rollno) / 2259) * 100
FROM
    college_b_se 
UNION SELECT 
    'P_Service/Job',
    (COUNT(college_b_sj.rollno) / 2259) * 100
FROM
    college_b_sj;
