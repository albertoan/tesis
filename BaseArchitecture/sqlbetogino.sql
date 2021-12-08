USE [DB_SISCOSE]
GO
/****** Object:  StoredProcedure [Core].[USP_LIST_ProyectosbyIdProyecto]    Script Date: 08/12/2021 16:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz de Maguiña
--Create Date: 06/12/2021
--Description: Obtiene el listado de Proyectos by Id Proyecto
--Change:	   -
--Example:     [Core].[USP_LIST_ProyectosbyIdProyecto]   22

--================================================= 
ALTER PROC [Core].[USP_LIST_ProyectosbyIdProyecto]     
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
		,Poblacion
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

USE [DB_SISCOSE]
GO
/****** Object:  StoredProcedure [Core].[USP_REG_Proyecto]    Script Date: 08/12/2021 15:56:41 ******/
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
ALTER PROC [Core].[USP_REG_Proyecto]        
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
,@Poblacion	INT
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
	,@Poblacion
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
	,Poblacion
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
		,TARGET.Poblacion			=	SOURCE.Poblacion		
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
	,Poblacion
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
   ,SOURCE.Poblacion
   ,SOURCE.FechaDesde
   ,SOURCE.FechaHasta
  )  
   
 OUTPUT
  inserted.IdProyecto;
END  
  
GO