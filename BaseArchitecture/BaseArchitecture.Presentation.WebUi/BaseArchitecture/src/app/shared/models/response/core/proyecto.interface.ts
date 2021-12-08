export class Proyecto {
    IdProyecto: string;
    Codigo: string;
    Nombre: string;
    Transferencia: string;
    IdTipoInversion: string;
    InversionDescripcion: string;
    IdCicloInversion: string;
    CicloDescripcion: string;
    IdNaturaleza: string;
    NaturalezaDescripcion: string;
    IdDepartamento: string;
    Departamento: string;
    IdProvincia: string;
    Provincia: string;
    IdDistrito: string;
    IdZona: string;
    Distrito: string;
    Programa: string;
    Costo: string;
    IdModalidad: string;
    Modalidad: string;
    Asignado: string;
	FechaVisita: string;
    NombresCompleto: string;
    IdTipoProyecto: string;
    Estado: string;
	FechaDesde?: string;
	FechaHasta?: string;	
	Insumos: Insumos;
	ProyectoActividadesRequest: Actividades [];
  }

export class Insumos {
  	IdInsumoObra: string;
	Codigo?: string;
	IdProyecto: string;
	MaderaTipoA: string;
	MaderaTipoB: string;
	Concreto: string;
	Aluminio: string;
	PIN3: string;
	PIN4: string;
	Suspencion: string;
	PAT1: string;
	PAT2: string;
	Pernos: string;
	Abrazaderas: string;
	Aisladores: string;
	Monofasicos: string;
	Bifasicos: string;
	Trifasicos: string;
	Transformadores: string;
	Interruptores: string;
	Contactores: string;
	Medidores: string;
	Fusibles: string;
	Pararrayos: string;
	Lotes: string;
	MaderaSecundarioTipoA: string;
	ConcretoSecundarioTipoA: string;
	ConcretoSecundarioTipoB: string;
	AluminioSecundario: string;
	Alumbrado: string;
	Retenidas: string;
	PuestaTierra: string;
	GrapaSuspencion: string;
	GrapaAnclaje: string;
	PernosSecundarios: string;
	Conexiones: string;
	PanelesSolares: string;
	Celdas: string;
	Inversor: string;
	Soporte: string;
	Estructura: string;
	Cableado: string;
  	TipoRegistro: string;
	TipoObra: string;
}

export class ProyectoId {
    IdProyecto: string;
}

export class Programacion {
    IdProyecto: string;
    IdCoordinador: string;
    FechaRegistro: Date;
    FechaInicio: string;
    FechaFin: string;
    Estado: string;
}

export class ProyectoActividades {
    IdProyecto: string;
	ProyectoActividadesRequest: Actividades [];
}
  
export class Actividades {
	IdCronograma: string;
	Orden: string;
	Idproyecto: string;
	Nombre: string;
	FechaInicio: string;
	FechaFin: string;
	Seguimiento: string;
	Estado: string;
	FechaRegistro: string;
}
  
export class Evidencia {
  IdEvidencia: string;
  Codigo?: string;
  IdProyecto: string;
  Evidencia: string;
  AttachedFile: AttachedFileRequest [];
}

export class AttachedFileRequest
{
  IdAttachedFile: string;
  Name: string;
  PathFile: string;  
  FileBase64?: string | ArrayBuffer;
  FileBuffer?: string;
}