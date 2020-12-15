
/* 1 Consultar datos del médico ( el género la especialidad) y cuantos médicos atienden por área*/
SELECT 
  medico.genero_medico, 
  categoria.tipo_categoria,
    count (tipo_categoria)  as medicos_dispoinbles
FROM 
  public.medico, 
  public.categoria
WHERE 
  medico.id_categoria_categoria1 = categoria.id_categoria 
   group by 
    medico.genero_medico, 
  categoria.tipo_categoria
/* 2 Consultar un registro de pacientes que visitaron la área de pediatría el último mes*/

SELECT 
  paciente.ape_paciente, 
  categoria.tipo_categoria, 
  cita_medica.fecha_cita, 
  cita_medica.hora_cita, 
  cita_medica.precio_cita
FROM 
  public.medico, 
  public.categoria, 
  public.cita_medica, 
  public.paciente
WHERE 
  medico.id_categoria_categoria1 = categoria.id_categoria AND
  medico.id_medico = cita_medica.id_medico_medico AND
  cita_medica.id_paciente_paciente = paciente.id_paciente and 
 categoria.tipo_categoria='Pediátria'AND
extract(month from fecha_cita)=12 ;

/* 3 Generar una lista de todas las citas que se registraron en la area de odontologia 
 a las 8 AM con un precio   mayor o igual a 20 dolares*/

SELECT 
  medico.ape_medico, 
  cita_medica.fecha_cita, 
  cita_medica.hora_cita, 
  cita_medica.precio_cita, 
  cita_medica.area_cita
FROM 
  public.medico, 
  public.cita_medica
WHERE 
  medico.id_medico = cita_medica.id_medico_medico and
   cita_medica.area_cita='Odontologia'and
  (hora_cita='8:00 AM') and
  (precio_cita>='20.00');

/*4 Consultar la suma total de  todas las citas medicas que se  generaron  desde '2020-06-09' al '2020-06-10*/
SELECT 
  cita_medica.fecha_cita, 
  categoria.tipo_categoria,
    sum(precio_cita) 
FROM 
  public.medico, 
  public.cita_medica, 
  public.categoria
WHERE 
  medico.id_medico = cita_medica.id_medico_medico AND
  categoria.id_categoria = medico.id_categoria_categoria1 and
  fecha_cita  between '2020-06-09' and '2020-06-10' 
  group by
  cita_medica.fecha_cita, 
  categoria.tipo_categoria





