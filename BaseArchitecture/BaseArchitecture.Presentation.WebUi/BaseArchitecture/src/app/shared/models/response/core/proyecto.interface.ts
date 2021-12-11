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
	Poblacion?:string;
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
	Longitud: string;
	Latitud: string;
	Actividades?: Actividades[];
	Evidencia?: Evidencia;
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
	IdCronograma?: string;
	Orden?: string;
	Idproyecto?: string;
	Nombre?: string;
	FechaInicio?: string;
	FechaFin?: string;
	Seguimiento?: string;
	Estado?: string;
	FechaRegistro?: string;
}
  
export class Evidencia {
  IdEvidencia?: string;
  Codigo?: string;
  IdProyecto?: string;
  Evidencia?: string;
  AttachedFile?: AttachedFileRequest [];
}

export class RegistroTemperaturaRequest {
	DniEmpleado: string;
	IdTemperature: number;
	Temperature: number;
	Latitude: number;
	Longitude: number;
	MeasurementDateString: Date;
	Usuario: string;
	Accion: string;
	Token: string;
	User: string;
	UserEdit: string;
	EmployedId: string;
	Title: string;
	Status: string;
	CodeAntamina: string;
	CodeLocation: string;
  }

export class AttachedFileRequest
{
  IdProyecto?: string;
  IdAttachedFile?: string;
  Name?: string;
  PathFile: string;  
  FileBase64?: string | ArrayBuffer;
  FileBuffer?: string;
}


export class Personal
{
	IdCoordinador: string;
	Nombre: string;
	ApellidoPaterno: string;
	ApellidoMaterno: string;  
	Correo: string ;
	Telefono: string;
	Estado: string;
	IdZona: string;
	Asignado: string;
	Cargo: string;	
}