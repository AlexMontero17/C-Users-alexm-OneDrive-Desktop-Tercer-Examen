Create Database Vehiculos

Use Vehiculos

------------------------------ SE CREA LA TABLAS USUARIOS Y PLACAS ------------------------------

Create Table Usuarios
(
	IdUsuario Int Identity Primary Key,
	Usuario Nvarchar(50) UNIQUE,
	Clave Nvarchar(30) NOT NULL,
	Nombre Nvarchar(50)NOT NULL,
	Apellido Nvarchar(50)NOT NULL,
)


Create Table Placa
(
	IdPlaca Int Identity Primary Key,
	NumPlaca Nvarchar(6) UNIQUE,
	IdUsuario Int,
	Monto Money Default 0,
	Constraint IDUs Foreign Key (IdUsuario) References Usuarios(IdUsuario)
)


--------------------- SE INSERTA INFORMACION A LA TABLA USUARIOS ----------------------

Insert Into Usuarios Values ('Alex17@','A17','Alex','Montero'),('Ale29@','V29','Alejandra','Vega')
Select * From Usuarios

--------------------- SE INSERTA INFORMACION A LA TABLA PLACAS ----------------------

Insert Into Placa Values ('NXP123',1,150000),('BJT789',2,200000)
Select * From Placa

-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA BORRAR UN USUARIO ----------------

Create Procedure BorrarUsuarios
@IdUsuario Int
As
	Begin
	   Delete Usuarios Where IdUsuario = @IdUsuario
	End

Exec BorrarUsuarios 3

-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA INGRESAR UN USUARIO --------------

Create Procedure IngresarUsuarios
@Usuario Nvarchar(50) = '',
@Clave Nvarchar(30) = '',
@Nombre Nvarchar(50) = '',
@Apellido Nvarchar(50) = ''
As
	Begin
	   Insert Into Usuarios (Usuario,Clave,Nombre,Apellido) Values (@Usuario,@Clave,@Nombre,@Apellido)
	End

Exec IngresarUsuarios 'Tony15@','T15','Antonio','Ramirez'

-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA MODIFICAR UN USUARIO -------------

Create Procedure ModificarUsuarios
@IdUsuario Int,
@Usuario Nvarchar(50) = '',
@Clave Nvarchar(30) = '',
@Nombre Nvarchar(50) = '',
@Apellido Nvarchar(50) = ''
As
	Begin
	   Update Usuarios Set Usuario = @Usuario, Clave = @Clave, Nombre = @Nombre, Apellido = @Apellido Where IdUsuario = @IdUsuario
	End

Exec ModificarUsuarios 3, 'Tony15@','T15','Antonio','Carmona'



-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA BORRAR UNA PLACA ----------------

Create Procedure BorrarPlacas
@IdPlaca Int
As
	Begin
	   Delete Placa Where IdPlaca = @IdPlaca
	End

Exec BorrarPlacas 3

-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA INGRESAR UNA PLACA --------------

Create Procedure IngresarPlacas
@NumPlaca Nvarchar(6) = '',
@IdUsuario Int = '',
@Monto Money = ''
As
	Begin
	   Insert Into Placa (NumPlaca,IdUsuario,Monto) Values (@NumPlaca,@IdUsuario,@Monto)
	End

Exec IngresarPlacas 'ZXY',3,100000

-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA MODIFICAR UNA PLACA -------------

Create Procedure ModificarPlacas
@IdPlaca Int,
@NumPlaca Nvarchar(6) = '',
@IdUsuario Int = '',
@Monto Money = ''
As
	Begin
	   Update Placa Set NumPlaca = @NumPlaca, IdUsuario = @IdUsuario, Monto = @Monto Where IdPlaca = @IdPlaca
	End

Exec ModificarPlacas 3, 'QDT522',2,300000


-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA REPORTE CON FILTRO -------------

Alter Procedure ReporteFiltro
--@Nombre Nvarchar(50) = '',
@Apellido Nvarchar(50) = '',
@NumPlaca Nvarchar(6) = '',
@Monto Money = ''
As
	Begin
		Select US.Nombre, Us.Apellido, P.NumPlaca, P.Monto, P.Monto*0.13 as IVA, P.Monto*1.13 as Total
		From Placa P
		inner join Usuarios Us on P.IdUsuario = US.IdUsuario
	   --Select NumPlaca, Monto From Placa Where NumPlaca = @NumPlaca --Apellido = @Apellido From Usuarios NumPlaca = @NumPlaca, Monto = @Monto From Placa 
	End

Exec ReporteFiltro 'NXP123'


-------------- SE CREA PROCEDIMIENTO ALMACENADO PARA MOSTRAR INFO SI LA CONTRASEÑA Y USUARIO SON CORRECTOS ------------

Create Procedure ValidarUsuario -- Muestra info de solo un usuario si la contra y el correo son correctos
@Usuario Nvarchar (50),
@Clave Nvarchar(30)
   As
    Begin
	   Select*From Usuarios Where Usuario = @Usuario and Clave = @Clave
	End

Exec ValidarUsuario'Alex17@','A17' -- Si la contraseña no es correcta no muestra info






--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--
**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**

------------------------------ PROCEDIMIENTOS ALMACENADOS -----------------------------

Exec ModificarUsuarios 3, 'Tony15@','T15','Antonio','Carmona'
Exec IngresarUsuarios 'Tony15@','T15','Antonio','Ramirez'
Exec BorrarUsuarios 3

Exec ModificarPlacas 3, 'QDT522',2,300000
Exec IngresarPlacas 'ZXY',3,100000
Exec BorrarPlacas 3


Exec ReporteFiltro 'NXP123'

Exec ValidarUsuario'Alex17@','A17' 