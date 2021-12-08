USE [DB_SISCOSE]
GO
/****** Object:  StoredProcedure [Core].[USP_LIST_ProyectosbyIdProyecto]    Script Date: 08/12/2021 14:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE Core.Proyectos
ADD FechaDesde VARCHAR(10),
FechaHasta VARCHAR(10)



--=================================================
--Author:	Alberto Alcarraz de Maguiña
--Create Date: 06/12/2021
--Description: Obtiene el listado de Proyectos by Id Proyecto
--Change:	   -
--Example:     [Core].[USP_LIST_ProyectosbyIdProyecto]   22

--================================================= 
CREATE PROC [Core].[USP_LIST_ProyectosbyIdProyecto]     
@ParamIIdProyecto	int
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

	SELECT 
		IdProyecto
		,Codigo
		,Nombre
		,Transferencia
		,IdTipoInversion
		,IdCicloInversion
		,IdNaturaleza
		,IdDepartamento
		,IdProvincia
		,IdDistrito
		,Programa
		,IdModalidad
		,Costo
		,Estado
		,IdZona
		,Asignado
		,IdTipoProyecto
		,FechaRegistro
		,FechaDesde
		,FechaHasta
	FROM	Core.Proyectos
	WHERE	IdProyecto	=	@ParamIIdProyecto

	SELECT		pro.Codigo		
				,inp.IdInsumoObra
				,inp.IdProyecto
				,inp.MaderaTipoA
				,inp.MaderaTipoB
				,inp.Concreto
				,inp.Aluminio
				,inp.PIN3
				,inp.PIN4
				,inp.Suspencion
				,inp.PAT1
				,inp.PAT2
				,inp.Pernos
				,inp.Abrazaderas
				,inp.Aisladores
				,inp.Monofasicos
				,inp.Bifasicos
				,inp.Trifasicos
				,inp.Transformadores
				,inp.Interruptores
				,inp.Contactores
				,inp.Medidores
				,inp.Fusibles
				,inp.Pararrayos
				,inp.Lotes
				,inp.MaderaSecundarioTipoA
				,inp.ConcretoSecundarioTipoA
				,inp.ConcretoSecundarioTipoB
				,inp.AluminioSecundario
				,inp.Alumbrado
				,inp.Retenidas
				,inp.PuestaTierra
				,inp.GrapaSuspencion
				,inp.GrapaAnclaje
				,inp.PernosSecundarios
				,inp.Conexiones
				,inp.PanelesSolares
				,inp.Celdas
				,inp.Inversor
				,inp.Soporte
				,inp.Estructura
				,inp.Cableado
				,inp.TipoRegistro
				,inp.TipoObra
	FROM		Core.Proyectos pro
	INNER JOIN	Core.InsumosProyecto inp
	ON			pro.IdProyecto	= inp.IdProyecto
	WHERE		pro.IdProyecto	=	@ParamIIdProyecto
	AND			inp.TipoRegistro	=	1


	SELECT	IdCronograma
			,Idproyecto
			,Orden
			,Nombre
			,FechaInicio
			,FechaFin
			,Seguimiento
			,Estado
			,FechaRegistro 
	FROM	Core.Cronograma 
	WHERE	IdProyecto	=	@ParamIIdProyecto
GO
/****** Object:  StoredProcedure [Core].[USP_REG_Cronograma]    Script Date: 08/12/2021 14:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_REG_Cronograma]  

--================================================= 
CREATE PROC [Core].[USP_REG_Cronograma]      

 @IdCronograma	INT
,@Idproyecto	INT
,@Orden	INT
,@Nombre VARCHAR(MAX)
,@FechaInicio VARCHAR(10)
,@FechaFin VARCHAR(10)
,@Seguimiento INT
,@Estado INT

AS
BEGIN

	MERGE Core.Cronograma	AS	TARGET
	USING(
		SELECT   @IdCronograma
				,@Idproyecto	
				,@Orden	
				,@Nombre 
				,@FechaInicio 
				,@FechaFin 
				,@Seguimiento 
				,@Estado 
				
		)	AS SOURCE	(
				 IdCronograma
				,Idproyecto	
				,Orden	
				,Nombre 
				,FechaInicio 
				,FechaFin 
				,Seguimiento 
				,Estado
		)
	ON (TARGET.IdCronograma = SOURCE.IdCronograma)
	WHEN MATCHED THEN
		UPDATE SET		
			TARGET.Idproyecto		=	SOURCE.Idproyecto
			,TARGET.Orden			=	SOURCE.Orden
			,TARGET.Nombre			=	SOURCE.Nombre
			,TARGET.FechaInicio		=	SOURCE.FechaInicio
			,TARGET.FechaFin		=	SOURCE.FechaFin
			,TARGET.Seguimiento		=	SOURCE.Seguimiento 
			,TARGET.Estado			=	SOURCE.Estado			
	WHEN NOT MATCHED THEN
		INSERT 
		(	 
			 Idproyecto	
			,Orden	
			,Nombre 
			,FechaInicio 
			,FechaFin 
			,Seguimiento 
			,Estado
			,FechaRegistro
		)
		VALUES
		(	
	
			 SOURCE.Idproyecto
			,SOURCE.Orden
			,SOURCE.Nombre
			,SOURCE.FechaInicio
			,SOURCE.FechaFin
			,SOURCE.Seguimiento
			,SOURCE.Estado
			,GETDATE()
		)
	
	OUTPUT
		inserted.IdCronograma;
END





GO
/****** Object:  StoredProcedure [Core].[USP_REG_Insumos]    Script Date: 08/12/2021 14:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--=================================================  
--Author: Alberto Alcarraz Núñez  
--Create Date: 13/08/2021  
--Description: registra los insumos por proyecto  
--Change:    -  
--Example:   [Core].[USP_REG_Insumos] 
  
--=================================================   
CREATE PROC [Core].[USP_REG_Insumos]        
	@IdInsumoObra INT,
	@IdProyecto INT,
	@MaderaTipoA INT,
	@MaderaTipoB INT,
	@Concreto INT,
	@Aluminio INT,
	@PIN3 INT,
	@PIN4 INT,
	@Suspencion INT,
	@PAT1 INT,
	@PAT2 INT,
	@Pernos INT,
	@Abrazaderas INT,
	@Aisladores INT,
	@Monofasicos INT,
	@Bifasicos INT,
	@Trifasicos INT,
	@Transformadores INT,
	@Interruptores INT,
	@Contactores INT,
	@Medidores INT,
	@Fusibles INT,
	@Pararrayos INT,
	@Lotes INT,
	@MaderaSecundarioTipoA INT,
	@ConcretoSecundarioTipoA INT,
	@ConcretoSecundarioTipoB INT,
	@AluminioSecundario INT,
	@Alumbrado INT,
	@Retenidas INT,
	@PuestaTierra INT,
	@GrapaSuspencion INT,
	@GrapaAnclaje INT,
	@PernosSecundarios INT,
	@Conexiones INT,
	@PanelesSolares INT,
	@Celdas INT,
	@Inversor INT,
	@Soporte INT,
	@Estructura INT,
	@Cableado INT,
	@TipoRegistro INT,
	@TipoObra INT
AS  
BEGIN  
  
 MERGE [Core].[InsumosProyecto] AS TARGET  
 USING(  
  SELECT
	 @IdInsumoObra
	,@IdProyecto
	,@MaderaTipoA
	,@MaderaTipoB
	,@Concreto
	,@Aluminio
	,@PIN3
	,@PIN4
	,@Suspencion
	,@PAT1
	,@PAT2
	,@Pernos
	,@Abrazaderas 
	,@Aisladores
	,@Monofasicos
	,@Bifasicos
	,@Trifasicos 
	,@Transformadores 
	,@Interruptores 
	,@Contactores
	,@Medidores 
	,@Fusibles 
	,@Pararrayos 
	,@Lotes
	,@MaderaSecundarioTipoA 
	,@ConcretoSecundarioTipoA 
	,@ConcretoSecundarioTipoB 
	,@AluminioSecundario 
	,@Alumbrado 
	,@Retenidas 
	,@PuestaTierra 
	,@GrapaSuspencion
	,@GrapaAnclaje 
	,@PernosSecundarios
	,@Conexiones 
	,@PanelesSolares 
	,@Celdas
	,@Inversor 
	,@Soporte
	,@Estructura
	,@Cableado
	,@TipoRegistro
	,@TipoObra
      
  ) AS SOURCE (
     IdInsumoObra
	,IdProyecto
	,MaderaTipoA
	,MaderaTipoB
	,Concreto
	,Aluminio
	,PIN3
	,PIN4
	,Suspencion
	,PAT1
	,PAT2
	,Pernos
	,Abrazaderas 
	,Aisladores
	,Monofasicos
	,Bifasicos
	,Trifasicos 
	,Transformadores 
	,Interruptores 
	,Contactores
	,Medidores 
	,Fusibles 
	,Pararrayos 
	,Lotes
	,MaderaSecundarioTipoA 
	,ConcretoSecundarioTipoA 
	,ConcretoSecundarioTipoB 
	,AluminioSecundario 
	,Alumbrado 
	,Retenidas 
	,PuestaTierra 
	,GrapaSuspencion
	,GrapaAnclaje 
	,PernosSecundarios
	,Conexiones 
	,PanelesSolares 
	,Celdas
	,Inversor 
	,Soporte
	,Estructura
	,Cableado
	,TipoRegistro
	,TipoObra
  )  
 ON (TARGET.IdInsumoObra = SOURCE.IdInsumoObra)  
 WHEN MATCHED THEN
	UPDATE SET				
	TARGET.IdProyecto				=	SOURCE.IdProyecto
	,TARGET.MaderaTipoA				=	SOURCE.MaderaTipoA
	,TARGET.MaderaTipoB				=	SOURCE.MaderaTipoB
	,TARGET.Concreto					=	SOURCE.Concreto
	,TARGET.Aluminio					=	SOURCE.Aluminio
	,TARGET.PIN3						=	SOURCE.PIN3
	,TARGET.PIN4						=	SOURCE.PIN4
	,TARGET.Suspencion				=	SOURCE.Suspencion
	,TARGET.PAT1						=	SOURCE.PAT1
	,TARGET.PAT2						=	SOURCE.PAT2
	,TARGET.Pernos					=	SOURCE.Pernos
	,TARGET.Abrazaderas 				=	SOURCE.Abrazaderas 
	,TARGET.Aisladores				=	SOURCE.Aisladores
	,TARGET.Monofasicos				=	SOURCE.Monofasicos
	,TARGET.Bifasicos				=	SOURCE.Bifasicos
	,TARGET.Trifasicos 				=	SOURCE.Trifasicos 
	,TARGET.Transformadores 			=	SOURCE.Transformadores 
	,TARGET.Interruptores 			=	SOURCE.Interruptores 
	,TARGET.Contactores				=	SOURCE.Contactores
	,TARGET.Medidores 				=	SOURCE.Medidores 
	,TARGET.Fusibles 				=	SOURCE.Fusibles 
	,TARGET.Pararrayos 				=	SOURCE.Pararrayos 
	,TARGET.Lotes					=	SOURCE.Lotes
	,TARGET.MaderaSecundarioTipoA 	=	SOURCE.MaderaSecundarioTipoA 
	,TARGET.ConcretoSecundarioTipoA 	=	SOURCE.ConcretoSecundarioTipoA 
	,TARGET.ConcretoSecundarioTipoB 	=	SOURCE.ConcretoSecundarioTipoB 
	,TARGET.AluminioSecundario 		=	SOURCE.AluminioSecundario 
	,TARGET.Alumbrado 				=	SOURCE.Alumbrado 
	,TARGET.Retenidas 				=	SOURCE.Retenidas 
	,TARGET.PuestaTierra 			=	SOURCE.PuestaTierra 
	,TARGET.GrapaSuspencion			=	SOURCE.GrapaSuspencion
	,TARGET.GrapaAnclaje 			=	SOURCE.GrapaAnclaje 
	,TARGET.PernosSecundarios		=	SOURCE.PernosSecundarios
	,TARGET.Conexiones 				=	SOURCE.Conexiones 
	,TARGET.PanelesSolares 			=	SOURCE.PanelesSolares 
	,TARGET.Celdas					=	SOURCE.Celdas
	,TARGET.Inversor 				=	SOURCE.Inversor 
	,TARGET.Soporte					=	SOURCE.Soporte
	,TARGET.Estructura				=	SOURCE.Estructura
	,TARGET.Cableado					=	SOURCE.Cableado
	,TARGET.TipoRegistro				=	SOURCE.TipoRegistro
	,TARGET.TipoObra					=	SOURCE.TipoObra
	




 WHEN NOT MATCHED THEN  
  INSERT   
  ( 
	 IdProyecto
	,MaderaTipoA
	,MaderaTipoB
	,Concreto
	,Aluminio
	,PIN3
	,PIN4
	,Suspencion
	,PAT1
	,PAT2
	,Pernos
	,Abrazaderas 
	,Aisladores
	,Monofasicos
	,Bifasicos
	,Trifasicos 
	,Transformadores 
	,Interruptores 
	,Contactores
	,Medidores 
	,Fusibles 
	,Pararrayos 
	,Lotes
	,MaderaSecundarioTipoA 
	,ConcretoSecundarioTipoA 
	,ConcretoSecundarioTipoB 
	,AluminioSecundario 
	,Alumbrado 
	,Retenidas 
	,PuestaTierra 
	,GrapaSuspencion
	,GrapaAnclaje 
	,PernosSecundarios
	,Conexiones 
	,PanelesSolares 
	,Celdas
	,Inversor 
	,Soporte
	,Estructura
	,Cableado
	,TipoRegistro
	,TipoObra
  )  
  VALUES  
  (   
	 SOURCE.IdProyecto
	,SOURCE.MaderaTipoA
	,SOURCE.MaderaTipoB
	,SOURCE.Concreto
	,SOURCE.Aluminio
	,SOURCE.PIN3
	,SOURCE.PIN4
	,SOURCE.Suspencion
	,SOURCE.PAT1
	,SOURCE.PAT2
	,SOURCE.Pernos
	,SOURCE.Abrazaderas 
	,SOURCE.Aisladores
	,SOURCE.Monofasicos
	,SOURCE.Bifasicos
	,SOURCE.Trifasicos 
	,SOURCE.Transformadores 
	,SOURCE.Interruptores 
	,SOURCE.Contactores
	,SOURCE.Medidores 
	,SOURCE.Fusibles 
	,SOURCE.Pararrayos 
	,SOURCE.Lotes
	,SOURCE.MaderaSecundarioTipoA 
	,SOURCE.ConcretoSecundarioTipoA 
	,SOURCE.ConcretoSecundarioTipoB 
	,SOURCE.AluminioSecundario 
	,SOURCE.Alumbrado 
	,SOURCE.Retenidas 
	,SOURCE.PuestaTierra 
	,SOURCE.GrapaSuspencion
	,SOURCE.GrapaAnclaje 
	,SOURCE.PernosSecundarios
	,SOURCE.Conexiones 
	,SOURCE.PanelesSolares 
	,SOURCE.Celdas
	,SOURCE.Inversor 
	,SOURCE.Soporte
	,SOURCE.Estructura
	,SOURCE.Cableado
	,SOURCE.TipoRegistro
	,SOURCE.TipoObra
  )  
   
 OUTPUT
  inserted.IdInsumoObra;
END  
  
GO
/****** Object:  StoredProcedure [Core].[USP_REG_Programacion]    Script Date: 08/12/2021 14:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_REG_Programacion]  

--================================================= 
CREATE PROC [Core].[USP_REG_Programacion]      

 @IdProyecto	INT
,@IdCoordinador	INT
,@FechaRegistro	DATE
,@Estado INT
,@FechaInicio VARCHAR(10)
,@FechaFin VARCHAR(10)

AS
BEGIN

	MERGE	[Core].[Programacion]	AS	TARGET
	USING(
		SELECT	 @IdProyecto		
				,@IdCoordinador
				,@FechaRegistro		
				,@Estado
				,@FechaInicio
				,@FechaFin
				
		)	AS SOURCE	(
				 IdProyecto		
				,IdCoordinador
				,FechaRegistro		
				,Estado
				,FechaInicio
				,FechaFin
		)
	ON (TARGET.IdProyecto = SOURCE.IdProyecto AND TARGET.IdCoordinador = SOURCE.IdCoordinador)
	WHEN MATCHED THEN
		UPDATE SET								
			TARGET.Estado			=	SOURCE.Estado	
			,TARGET.FechaInicio		=	SOURCE.FechaInicio
			,TARGET.FechaFin		=	SOURCE.FechaFin
	WHEN NOT MATCHED THEN
		INSERT 
		(	IdProyecto		
			,IdCoordinador
			,FechaRegistro		
			,Estado
			,FechaInicio
			,FechaFin
		)
		VALUES
		(	
			 SOURCE.IdProyecto
			,SOURCE.IdCoordinador
			,SOURCE.FechaRegistro
			,SOURCE.Estado
			,SOURCE.FechaInicio
			,SOURCE.FechaFin
		)
	
	OUTPUT
		inserted.IdProgramacion;
	
END





GO
/****** Object:  StoredProcedure [Core].[USP_REG_Proyecto]    Script Date: 08/12/2021 14:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================  
--Author: Alberto Alcarraz Núñez  
--Create Date: 13/08/2021  
--Description: registra un nuevo proyecto  
--Change:    -  
--Example:     [Core].[USP_REG_Proyecto]    
  
--=================================================   
CREATE PROC [Core].[USP_REG_Proyecto]        
 @IdProyecto INT 
,@Codigo VARCHAR(25)  
,@Nombre VARCHAR(MAX)  
,@Transferencia VARCHAR(5)  
,@IdTipoInversion INT
,@IdCicloInversion INT
,@IdNaturaleza INT
,@IdDepartamento INT
,@IdProvincia INT
,@IdDistrito INT
,@Programa VARCHAR(10)  
,@IdModalidad INT
,@Costo VARCHAR(MAX)  
,@Estado INT
,@IdZona INT
,@Asignado INT
,@IdTipoProyecto INT
,@FechaDesde VARCHAR(10)  
,@Fechahasta VARCHAR(10)  
  
AS  
BEGIN  
  
 MERGE [Core].[Proyectos] AS TARGET  
 USING(  
  SELECT
	 @IdProyecto
	,@Codigo
	,@Nombre
	,@Transferencia
	,@IdTipoInversion
	,@IdCicloInversion
	,@IdNaturaleza
	,@IdDepartamento
	,@IdProvincia
	,@IdDistrito
	,@Programa
	,@IdModalidad
	,@Costo
	,@Estado
	,@IdZona
	,@Asignado
	,@IdTipoProyecto
	,@FechaDesde
	,@FechaHasta
      
  ) AS SOURCE (
	 IdProyecto
	,Codigo
	,Nombre
	,Transferencia
	,IdTipoInversion
	,IdCicloInversion
	,IdNaturaleza
	,IdDepartamento
	,IdProvincia
	,IdDistrito
	,Programa
	,IdModalidad
	,Costo
	,Estado
	,IdZona
	,Asignado
	,IdTipoProyecto
	,FechaDesde
	,FechaHasta
  )  
 ON (TARGET.IdProyecto = SOURCE.IdProyecto)  
WHEN MATCHED THEN
	UPDATE SET				
		TARGET.Codigo				=	SOURCE.Codigo  
		,TARGET.Nombre				=	SOURCE.Nombre  
		,TARGET.Transferencia		=	SOURCE.Transferencia  
		,TARGET.IdTipoInversion		=	SOURCE.IdTipoInversion  
		,TARGET.IdCicloInversion	=	SOURCE.IdCicloInversion  
		,TARGET.IdNaturaleza		=	SOURCE.IdNaturaleza  
		,TARGET.IdDepartamento		=	SOURCE.IdDepartamento
		,TARGET.IdProvincia			=	SOURCE.IdProvincia
		,TARGET.IdDistrito			=	SOURCE.IdDistrito
		,TARGET.Programa			=	SOURCE.Programa
		,TARGET.IdModalidad			=	SOURCE.IdModalidad
		,TARGET.Costo				=	SOURCE.Costo
		,TARGET.Estado				=	SOURCE.Estado
		,TARGET.IdZona				=	SOURCE.IdZona
		,TARGET.Asignado			=	SOURCE.Asignado
		,TARGET.IdTipoProyecto		=	SOURCE.IdTipoProyecto
		,TARGET.FechaDesde			=	SOURCE.FechaDesde
		,TARGET.FechaHasta			=	SOURCE.FechaHasta
 WHEN NOT MATCHED THEN  
  INSERT   
  ( 
	 Codigo
	,Nombre
	,Transferencia
	,IdTipoInversion
	,IdCicloInversion
	,IdNaturaleza
	,IdDepartamento
	,IdProvincia
	,IdDistrito
	,Programa
	,IdModalidad
	,Costo
	,Estado
	,IdZona
	,Asignado
	,IdTipoProyecto
	,FechaDesde
	,FechaHasta
  )  
  VALUES  
  (   
	SOURCE.Codigo  
   ,SOURCE.Nombre  
   ,SOURCE.Transferencia  
   ,SOURCE.IdTipoInversion  
   ,SOURCE.IdCicloInversion  
   ,SOURCE.IdNaturaleza  
   ,SOURCE.IdDepartamento
   ,SOURCE.IdProvincia
   ,SOURCE.IdDistrito
   ,SOURCE.Programa
   ,SOURCE.IdModalidad
   ,SOURCE.Costo
   ,SOURCE.Estado
   ,SOURCE.IdZona
   ,SOURCE.Asignado
   ,SOURCE.IdTipoProyecto
   ,SOURCE.FechaDesde
   ,SOURCE.FechaHasta
  )  
   
 OUTPUT
  inserted.IdProyecto;
END  
  
GO
