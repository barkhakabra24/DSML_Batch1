Select * from emp_test.employee;


Select *
from emp_test.employee as emp
join emp_test.employee as mrg
on emp.mrgid = mrg.eid;


Select emp.ename as emp_name, mrg.ename as mrg_name
from emp_test.employee as emp
join emp_test.employee as mrg
on emp.mrgid = mrg.eid;

Select emp.ename as emp_name, mrg.ename as mrg_name
from emp_test.employee as emp
LEFT join emp_test.employee as mrg
on emp.mrgid = mrg.eid;