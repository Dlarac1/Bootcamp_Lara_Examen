drop schema if exists ejercicio3;
create schema ejercicio3;

create table ejercicio3.Curso(
	IdCurso int primary key auto_increment,
	Nombre_Curso varchar (45) not null,
	Descripción_Curso varchar(45) not null,
	Precio int not null
);

create table ejercicio3.Alumno(
	DNI int primary key,
	Nombre_Alumno varchar(45) not null,
	Celular char(9) not null,
	Email varchar(45) not null
);

create table ejercicio3.Profesor(
	idProfesor int primary key auto_increment,
	Nombre_Profesor varchar(45) not null,
	Descripción_Profesor varchar(45),
	Foto blob not null
);

create table ejercicio3.Curso_has_Alumno(
	Horario datetime not null,
    Curso_idCurso int not null,
    Alumno_DNI int not null,
	primary key(Curso_idCurso,Alumno_DNI),
	foreign key(Curso_idCurso) references ejercicio3.Curso(idCurso),
	foreign key(Alumno_DNI) references ejercicio3.Alumno(DNI)
);

create table ejercicio3.Curso_has_Profesor(
	Fecha date not null,
    Curso_idCurso int not null,
    Profesor_idProfesor int not null,
	primary key (Curso_idCurso,Profesor_idProfesor), 
	foreign key (Curso_idCurso) references ejercicio3.Curso(idCurso),
	foreign key (Profesor_idProfesor) references ejercicio3.Profesor(idProfesor)
);

                                                            /*CONSULTAS*/
                                                            
/*Mostrar todos los alumnos que llevan el curso X*/
select Nombre_Alumno, Nombre_Curso from ejercicio3.alumno, ejercicio3.curso, ejercicio3.curso_has_alumno
where alumno.DNI=curso_has_alumno.alumno_DNI and Curso.idCurso=Curso_has_Alumno.Curso_idCurso and Nombre_Curso = 'X';

/*Mostrar los datos de los cursos que han sido llevados por más de 1 profesor*/
select count(idProfesor), Nombre_Curso, Descripción_Curso, Precio from ejercicio3.profesor, ejercicio3.curso,
ejercicio3.curso_has_profesor where profesor.idProfesor=curso_has_profesor.Profesor_idProfesor 
and curso.idCurso=curso_has_profesor.Curso_idCurso group by idCurso having count(idProfesor)>1;

/*Mostrar los datos de los alumnos que han llevado más de 1 curso*/
select count(idCurso), DNI, Nombre_Alumno, Celular, Email from ejercicio3.curso, ejercicio3.alumno,
ejercicio3.curso_has_alumno where alumno.DNI=curso_has_alumno.Alumno_DNI 
and curso.idCurso=curso_has_alumno.Curso_idCurso group by DNI having count(idCurso)>1;

/*Mostrar los datos de los alumnos que han llevado el curso X y el curso Y*/
select Nombre_Curso, Nombre_Alumno, DNI, Celular, Email from ejercicio3.curso, ejercicio3.alumno,
ejercicio3.curso_has_alumno where alumno.DNI=curso_has_alumno.Alumno_DNI 
and curso.idCurso=curso_has_alumno.Curso_idCurso and Nombre_Curso = 'X' and Nombre_Curso='Y';
