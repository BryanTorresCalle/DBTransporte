#Punto 1
select empleados.nombre as empleado, cursos.nombre as curso, 
if( empleado_curso.fechaFin > now(), 'En curso', if( empleado_curso.nota >= 3.5, 'Aprobado', 'Reprobado')) as estado
from empleados 
inner join empleado_curso on empleados.id = empleado_curso.idEmpleado 
inner join cursos on empleado_curso.idCurso = cursos.id
where empleados.id = 2;

#Punto 2
select cargos.nombre as cargo, cursos.nombre as curso from cargos_curso 
inner join cargos on cargos.id = cargos_curso.idCargo 
inner join cursos on cursos.id = cargos_curso.idCurso 
order by cargos.nombre;

#3
select empleados.nombre as empleado,  cursos.nombre as 'curso aprobado', cargos.nombre as 'cargo relacionado' from empleado_curso
inner join empleados on empleados.id = empleado_curso.idEmpleado
inner join cargos_curso on cargos_curso.idCurso = empleado_curso.idCurso
inner join cargos on cargos.id = cargos_curso.idCargo
inner join cursos on cursos.id = cargos_curso.idCurso
where empleado_curso.nota >= 3.5
order by empleados.nombre;

#Punto 4
select empleados.nombre as empleado, cargos.nombre as 'cargo actual', cursos.nombre as 'curso a enseñar' from empleados
inner join empleado_curso on empleados.id = empleado_curso.idEmpleado
inner join cursos on empleado_curso.idCurso = cursos.id
inner join cargos_curso on cursos.id = cargos_curso.idCurso
inner join cargos on cargos_curso.idCargo = cargos.id
where empleado_curso.idCurso = cargos_curso.idCurso and empleado_curso.nota >= 3.5 and empleados.idCargo = cargos_curso.idCargo
order by empleados.nombre;

#Putno 6
select empleados.nombre as empleado, count(if( empleado_curso.nota >= 3.5, 1, 0)) as aprobadas  from empleados
inner join empleado_curso on empleados.id = empleado_curso.idEmpleado
where empleado_curso.nota >= 3.5
group by empleado
order by aprobadas desc limit 5;


#Punto 7
select empleados.nombre as empleado, count(if( empleado_curso.nota < 3.5, 1, 0)) as reprobadas  from empleados
inner join empleado_curso on empleados.id = empleado_curso.idEmpleado
where empleado_curso.nota < 3.5
group by empleado
order by reprobadas asc limit 5;

#Punto 8
select cursos.nombre, count(empleado_curso.idCurso) as cantidad from cursos 
inner join empleado_curso on cursos.id = empleado_curso.idCurso
where empleado_curso.nota >= 3.5
group by empleado_curso.idCurso
order by cantidad desc limit 5




