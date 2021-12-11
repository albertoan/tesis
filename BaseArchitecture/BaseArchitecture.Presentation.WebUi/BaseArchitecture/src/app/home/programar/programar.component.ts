import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { TypeaheadMatch } from 'ngx-bootstrap/typeahead/public_api';
import { HeadersInterface } from 'src/app/shared/models/request/common/headers-request.interface';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { HttpErrorResponse } from '@angular/common/http';
import { encrypt, showError, decrypt, FormatString } from 'src/app/shared/util';
import { DBName, KeyObjectSoreName, ObjectStoreName } from 'src/app/shared/constant';
import { IndexdDBService } from 'src/app/shared/services/general/indexDB.service';
import { Proyecto, Programacion } from 'src/app/shared/models/response/core/proyecto.interface';
import { ToastrService } from 'ngx-toastr';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-programar',
  templateUrl: './programar.component.html',
  styleUrls: ['./programar.component.css']
})
export class ProgramarComponent implements OnInit {
  public labelJson: ResponseLabel = new ResponseLabel();
  deviceType: string;
  selectedCode: string;
  selectedPersonal: string;
  listEmployee: any [] = [];
  itemCodigo: string;
  nombreCompleto: string;
  totalItems: number;
  configTable: {};
  listProyectosCode: any[] = [];
  headers: HeadersInterface[] = new Array<HeadersInterface>();
  listDepartamento: any[] = [];
  listProvincia: any[] = [];
  listDistrito: any[] = [];
  listPersonalOriginal: any[] = [];
  listPersonal: any[] = [];
  listZonas: any[] = [];
  listProyecto: any[] = [];
  listProgramacion: any[] = [];
  Departamento: string;
  Provincia: string;
  Distrito: string;
  Zona: string;
  SinceDate: string;
  UntilDate: string;
  idProyecto: string;
  idCoordinador: string;
  proyecto = new Proyecto();

  constructor(
    private spinner: NgxSpinnerService,
    public datepipe: DatePipe,
    private toastr: ToastrService,
    private oIndexdDBService: IndexdDBService,
    private serviceProyecto: GeneralService
  ) { }

  ngOnInit(): void {
    this.Departamento = "";
    this.selectedPersonal = "";
    this.createHeadersTable();
    this.loadStart();
    this.saveDataIndex();
    this.deviceType = ( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) ? 'M':'D';
  }

  loadStart = () => {
    this.configTable = {
      paging: true,
      searching: false,
      ordering: true,
      lengthChange: true,
      lengthMenu: [5, 10, 15, 20, 25],
      serverSide: false,
      filterColumn: true
    };
  }

  createHeadersTable = () => {
    this.headers = [
      {
        primaryKey: 'Codigo',
        title: 'Código Proyecto',
      },
      {
        primaryKey: 'Nombre',
        title: 'Proyecto',
      },
      {
        primaryKey: 'NombreCompleto',
        title: 'Coordinador',
      },
      {
        primaryKey: 'FechaRegistro',
        title: 'Fecha',
      },
      // {
      //   primaryKey: 'Estado',
      //   title: 'Estado',
      // },
      {
        primaryKey: 'Asignado',
        title: 'Estado',
      },
    ];
  };

  ListProyectoCodigo = () => {
    this.serviceProyecto.ListProyectoCodigo().subscribe(
      (data: any) => {
        this.listProyectosCode = data.Value;
        this.loadDepartamento();
      },
      (error: HttpErrorResponse) => {
        this.spinner.hide();
      }
    );
  }

  typeaheadOnSelectCode = (e: TypeaheadMatch): void => {
    this.itemCodigo = e.item.Codigo;
    this.idProyecto = e.item.IdProyecto;
    let proy = this.listProyecto.filter(x => x.Codigo == this.itemCodigo);
    this.proyecto = proy[0];
    this.Departamento = this.proyecto.IdDepartamento;
    this.Provincia = this.proyecto.IdProvincia;
    this.Distrito = this.proyecto.IdDistrito;
    this.Zona = this.proyecto.IdZona;
    this.listPersonal = this.listPersonalOriginal.filter(x => x.IdZona == this.Zona);
  };

  typeaheadOnSelectEmployee = (value): void => {
    // this.nombreCompleto = e.item.NombreCompleto;
    this.idCoordinador = value;
  };

  loadProyecto = () =>{
    this.oIndexdDBService
      .fetchData(
        DBName.siscose,
        ObjectStoreName.dataStore,
        KeyObjectSoreName.GetProyecto
      )
      .then((resp: any) => {
        let body: any [] = JSON.parse(decrypt(resp.body));
        this.listProyecto = body;
        this.loadProgramacion();
      })
      .catch(() => {
        showError("Ocurrió un error, verificar log");
      });
}

  loadDepartamento = () =>{
    this.oIndexdDBService
      .fetchData(
        DBName.siscose,
        ObjectStoreName.dataStore,
        KeyObjectSoreName.GetDepartamento
      )
      .then((resp: any) => {
        let body: any [] = JSON.parse(decrypt(resp.body));
        this.listDepartamento = body;
        this.loadProvincia();
      })
      .catch(() => {
        showError("Ocurrió un error, verificar log");
      });
  }

  loadProvincia = () =>{
    this.oIndexdDBService
      .fetchData(
        DBName.siscose,
        ObjectStoreName.dataStore,
        KeyObjectSoreName.GetProvincia
      )
      .then((resp: any) => {
        let body: any [] = JSON.parse(decrypt(resp.body));
        this.listProvincia = body;
        this.loadDistrito();
      })
      .catch(() => {
        showError("Ocurrió un error, verificar log");
      });
  }

  loadDistrito = () =>{
    this.oIndexdDBService
      .fetchData(
        DBName.siscose,
        ObjectStoreName.dataStore,
        KeyObjectSoreName.GetDistrito
      )
      .then((resp: any) => {
        let body: any [] = JSON.parse(decrypt(resp.body));
        this.listDistrito = body;
        this.loadPersonal();
      })
      .catch(() => {
        showError("Ocurrió un error, verificar log");
      });
  }

  loadPersonal = () =>{
    this.oIndexdDBService
    .fetchData(
      DBName.siscose,
      ObjectStoreName.dataStore,
      KeyObjectSoreName.GetPersonal
    )
    .then((resp: any) => {
      let body: any [] = JSON.parse(decrypt(resp.body));
      this.listPersonalOriginal = body;
      this.listPersonal = this.listPersonalOriginal;
      this.loadProyecto();
    })
    .catch(() => {
      showError("Ocurrió un error, verificar log");
    });
  }

  loadProgramacion = () => {
    this.serviceProyecto.ListProgramacion().subscribe(
      (data: any) => {
        this.listProgramacion = data.Value;
        this.totalItems = this.listProgramacion.length;
        this.loadZonas();
      },
      (error: HttpErrorResponse) => {
        this.spinner.hide();
      }
    );
  }

  loadZonas = () => { 
    this.oIndexdDBService
    .fetchData(
      DBName.siscose,
      ObjectStoreName.dataStore,
      KeyObjectSoreName.GetZonas
    )
    .then((resp: any) => {
      let body: any [] = JSON.parse(decrypt(resp.body));
      this.listZonas = body;
      this.spinner.hide();
    })
    .catch(() => {
      showError("Ocurrió un error, verificar log");
    });
  }

  registerProgramacion = () => {

    if( this.selectedCode == "" || this.selectedCode == undefined ){
      this.toastr.info("Ingrese el Código")
      return
    }

    if( this.SinceDate == "" || this.SinceDate == undefined ){
      this.toastr.info("Ingrese la fecha inicio")
      return
    }

    if( this.UntilDate == "" || this.UntilDate == undefined ){
      this.toastr.info("Ingrese la fecha fin")
      return
    }

    let startDate = new Date(this.SinceDate);
    let endDate = new Date(this.UntilDate);

    if (!(startDate < endDate)) {
      this.toastr.info("Intervalo de fechas incorrecto.");
      return false;
    }
    else {
      let programacion = new Programacion();
      programacion.IdProyecto = this.idProyecto;
      programacion.IdCoordinador = this.idCoordinador;
      programacion.FechaRegistro = new Date();
      programacion.FechaInicio = this.datepipe.transform(this.SinceDate, 'dd/MM/yyyy');
      programacion.FechaFin =  this.datepipe.transform(this.UntilDate, 'dd/MM/yyyy');
      programacion.Estado = "1";

      this.serviceProyecto.RegProgramacion(programacion).subscribe(
        (data: any) => {
            this.selectedCode = "";
            this.proyecto.Nombre = "";
            this.selectedPersonal = "";
            this.SinceDate = "";
            this.UntilDate = "";
            this.Departamento = "";
            this.saveDataIndex();
            this.toastr.success("Se registro correctamente")
        },
        (error: HttpErrorResponse) => {
          showError("Ocurrió un error, verificar log");
          this.spinner.hide();
        }
      );
    }
  }

  saveDataIndex = () =>{
    this.spinner.show();
    this.serviceProyecto.ListUBIGEO().subscribe(
      (data) => {
        let departamento = {
          codDepartamento: 'GetDepartamento',
          body: encrypt(JSON.stringify(data.Value.ListDepartamentoResponse)),
        };
        this.oIndexdDBService.addData(departamento, KeyObjectSoreName.GetDepartamento).catch(console.log);

        let provincia = {
          codProvincia: 'GetProvincia',
          body: encrypt(JSON.stringify(data.Value.ListProvinciaResponse)),
        };
        this.oIndexdDBService.addData(provincia,KeyObjectSoreName.GetProvincia).catch(console.log);

        let distrito = {
          codDistrito: 'GetDistrito',
          body: encrypt(JSON.stringify(data.Value.ListDistritoResponse)),
        };
        this.oIndexdDBService.addData(distrito, KeyObjectSoreName.GetDistrito).catch(console.log);

        let proyecto = {
          codProyecto: 'GetProyecto',
          body: encrypt(JSON.stringify(data.Value.ListProyectoResponse)),
        };
        this.oIndexdDBService.addData(proyecto, KeyObjectSoreName.GetProyecto).catch(console.log);

        let personal = {
          codPersonal: 'GetPersonal',
          body: encrypt(JSON.stringify(data.Value.ListPersonalResponse)),
        };
        this.oIndexdDBService.addData(personal, KeyObjectSoreName.GetPersonal).catch(console.log);

        let zonas = {
          codPersonal: 'GetZonas',
          body: encrypt(JSON.stringify(data.Value.ListZonasResponse)),
        };
        this.oIndexdDBService.addData(zonas, KeyObjectSoreName.GetZonas).catch(console.log);


        this.ListProyectoCodigo();
      },
      (error: HttpErrorResponse) => {
        console.log(error);
      }
    )
  }
}
