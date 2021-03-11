--Trigger
--Realizar un Trigger que no permita ingresar una fecha y hora
--repetida en una cita medica de un mismo paciente.

create or replace function control_citamedica()
returns trigger as $control_citamedica$
declare 
contador_cita int ;
cita_limite int ;
begin 
select count(*) into contador_cita
from cita_medica where (fecha_cita= new.fecha_cita) and (Id_paciente_paciente= new.Id_paciente_paciente)and(hora_cita= new.hora_cita);
select max_cita into cita_limite from cita_medica;
if (contador_cita>=cita_limite)then 
raise exception 'Este paciente ya contiene una cita medica en la fecha y hora asignada';
end if;
return new;
end;
$control_citamedica$ language plpgsql;
create trigger control_citamedica before insert 
on cita_medica for each row 
execute procedure control_citamedica();
--Cursor 
--Cursor que permita mostrar datos del paciente (nombre, apellido) y 
--la cantidad de veces que se le ha generado una cita.
do $$
	 declare
		cantidad int = 0;
		num int;
		almacenado record;
	cant_cita cursor for select * from cita_medica, paciente
 			where cita_medica.Id_paciente_paciente = paciente.id_paciente and
			paciente.id_paciente=1;
			
 	  begin
 			for num in cant_cita
 			loop cantidad  = cantidad  + count(num.id_paciente);
 				end loop;
 	open cant_cita;
 	fetch cant_cita into almacenado;
 raise notice ' apellido de paciente: %,nombre de paciente: %,cantidad de citas: %',almacenado.ape_paciente, almacenado.nomb_paciente, cantidad;
 	end $$
 	language 'plpgsql';
---Procedimiento Almacenado 
---Procedimiento almacenado que devuelva el total de ingresos obtenidos
--en la clínica en la área de ginecología en el mes de enero.
create or replace function ingreso_total_ginecologia()
returns numeric(4,2)
as $$
select sum (precio_cita) from cita_medica, medico
 
 where 
 medico.Id_medico=cita_medica.Id_medico_medico and 
 id_categoria_categoria1= '3' and
 extract (month from fecha_cita)=01;
 
 $$
language sql;
select ingreso_total_ginecologia();
----Reporte
--Realizar un reporte completo sobre la cantidad  de estados de citas  generadas
--de tal manera que muestre un número de pacientes que asistieron, 
---pendientes o que hayan suspendido la cita.
SELECT 
	  cita_medica.id_cita, 
	  cita_medica.estado_cita, 
	  paciente.id_paciente, 
	  medico.nomb_medico, 
	  paciente.nomb_paciente, 
	  categoria.tipo_categoria, 
	  cita_medica.fecha_cita
	FROM 
	  public.cita_medica, 
	  public.paciente, 
	  public.medico, 
	  public.categoria
	WHERE 
	  cita_medica.id_paciente_paciente = paciente.id_paciente AND
	  medico.id_medico = cita_medica.id_medico_medico AND
	  categoria.id_categoria = medico.id_categoria_categoria1



