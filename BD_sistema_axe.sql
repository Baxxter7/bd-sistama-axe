--#1
Create Table SEG_ROLES(
  COD_ROLES SERIAL PRIMARY KEY   NOT NULL, -- codigo de tabla roles
	TIP_ROLES VARCHAR(20)      NOT NULL, -- 'tipos de Roles del usuario'
);

--#2
Create Table SEG_PERMISOS(
  COD_PERMISOS SERIAL PRIMARY KEY NOT NULL,    --'codigo de tabla permisos'
	PER_INSERCION VARCHAR(1)    NOT NULL,    --'Permiso de insertar'
	PER_ELIMINAR VARCHAR(1)     NOT NULL,    --'Permiso de Eliminar'
	PER_ACTUALIZAR VARCHAR (1)  NOT NULL,    --'Permiso de edita r'
	PER_CONSULTAR VARCHAR(1)    NOT NULL,    --'Permiso de seleccionar'
	FEC_MODIFICACION TIMESTAMP  NOT NULL,    --'Fecha de conseder los permisos'

  --Llave foranea
  COD_ROL INTEGER NULL,                     --'codigo de tabla roles'

  --Relacion 
	FOREIGN KEY (COD_ROL) REFERENCES SEG_ROLES(COD_ROLES)
);

--#3
Create Table PERSON_EMAILES(
	COD_EMAIL SERIAL PRIMARY KEY NOT NULL, --'Codigo de la tabla Email'
	DIR_CORREO VARCHAR(50)   NOT NULL, --'Direccion del correo'
);

--#4
--Create Type TELEFONO AS ENUM('P','T','C'); --'tipo de telefono del usuario'
Create Table PERSON_TELEFONOS(
  COD_TELEFONO SERIAL PRIMARY KEY    NOT NULL, --'codigo de la tabla'
	NUM_TELEFONO VARCHAR(32)       NOT NULL, --'numero de telefono de usuario'
);

--#5
Create Table PERSON_USUARIOS(
  COD_USUARIO SERIAL PRIMARY KEY    NOT NULL, --'codigo de tabla usuarios'
	NOM_USUARIO VARCHAR (70)       NOT NULL, --'Nombre del Usuario'
	CONTRASEÑA VARCHAR (100)       NOT NULL, --'contraseña del usuario '
	ESTADO_USUARIO  NOT NULL , --'Estado del Usuario en el Sistema' 
	FEC_CREACION TIMESTAMP         NOT NULL, --'Fecha que se registro en el sistema'

	COD_ROL INTEGER                 NULL, --'codigo de la tabla ROLES'
	COD_TELEFONO INTEGER           NULL, --'Codigo de la tablas Telefonos'
	COD_EMAIL INTEGER              NULL, --'Codigo de la tabla Email'
	--#codigoDirec DIR_RESIDENCIA VARCHAR(100)    NOT NULL, --'Lugar donde reside'[Esta pendiente agregar el nuevo codigo]
	
	--Relaciones
	FOREIGN KEY (COD_ROL) REFERENCES SEG_ROLES(COD_ROLES),
	FOREIGN KEY (COD_TELEFONO) REFERENCES PERSON_TELEFONOS(COD_TELEFONO),
	FOREIGN KEY (COD_EMAIL) REFERENCES PERSON_EMAILES(COD_EMAIL)
);
