import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { IndexdDBService } from 'src/app/shared/services/general/indexDB.service';
import { ToastrService } from 'ngx-toastr';
import { DatePipe } from '@angular/common';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { HeadersInterface } from '../../../shared/models/request/common/headers-request.interface';
import { LocalService } from '../../../shared/services/general/local.service';
import { TypeaheadMatch } from 'ngx-bootstrap/typeahead/public_api';
import { ProyectoActividades } from '../../../shared/models/response/core/proyecto.interface';

@Component({
  selector: 'app-programar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.css']
})
export class RegistrarComponent implements OnInit {

  public labelJson: ResponseLabel = new ResponseLabel();
  deviceType: string;
  selectedEmployee: string;
  listEmployee: any [] = [];
  itemType: string;
  totalItems: number;
  itemCodigo: string;
  idProyecto: string;
  selectedCode: string;
  configTable: {};
  listProyectos: any[] = [];
  listProyectosCode: any[] = [];
  isNew: boolean = false;
  headers: HeadersInterface[] = new Array<HeadersInterface>();
  desdeFechaDate: Date;
  hastaFechaDate: Date;
  nameProyecto: string;
  listSchedules: any[] = [];
  proyectoActividades: ProyectoActividades = new ProyectoActividades();
  contador: number;

  constructor(
    private spinner: NgxSpinnerService,
    public datepipe: DatePipe,
    private localStorage: LocalService,
    private toastr: ToastrService,
    private router: Router,
    private oIndexdDBService: IndexdDBService,
    private serviceProyecto: GeneralService
  ) { }

  ngOnInit(): void {
    this.contador = 0;
    this.createHeadersTable();
    this.loadStart();
    this.deviceType = ( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) ? 'M':'D';
    this.ListProyectos();
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

  typeaheadOnSelectCode = (e: TypeaheadMatch): void => {
    this.itemCodigo = e.item.Codigo;
    this.idProyecto = e.item.IdProyecto;
  };

  newRow = () => {
    this.isNew = true;
  }

  saveRow = () => {
    let startDate = new Date(this.desdeFechaDate);
    let endDate = new Date(this.hastaFechaDate);

    if (!(startDate < endDate)) {
      this.toastr.info("Intervalo de fechas incorrecto.");
      return false;
    }
    else {
      this.contador = this.contador + 1;
      this.listSchedules.push(
        {
          IdCronograma: 0,
          Idproyecto: this.idProyecto,
          Orden: this.listSchedules.length + 1,
          Nombre: this.nameProyecto,
          FechaInicio: this.datepipe.transform(this.desdeFechaDate, 'dd/MM/yyyy'),
          FechaFin: this.datepipe.transform(this.hastaFechaDate, 'dd/MM/yyyy'),
          Seguimiento: 0,
          Estado: 1,
        }
      );
      this.removeRow();
      // this.dataSchedulesChange.emit(this.listSchedules);
    }
  }

  removeRow = () =>{
    this.desdeFechaDate = null;
    this.hastaFechaDate = null;
    this.nameProyecto = null;
    this.isNew = false;
  }

  deleteRow = (Orden: number) => {
    this.listSchedules = this.listSchedules.filter((x) => x.Orden != Orden);
  }

  ListProyectoCodigo = () => {
    this.serviceProyecto.ListProyectoCodigo().subscribe(
      (data: any) => {
        this.listProyectosCode = data.Value;
      },
      (error: HttpErrorResponse) => {
        this.spinner.hide();
      }
    );
  }

  ListProyectos = () => {
    this.serviceProyecto.ListProyectos().subscribe(
      (data: any) => {
        this.listProyectos = data.Value;
        this.totalItems = this.listProyectos.length;
        this.ListProyectoCodigo();
        this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
        this.spinner.hide();
      }
    );
  }

  createHeadersTable = () => {
    this.headers = [
      {
        primaryKey: 'Codigo',
        title: 'Código',
      },
      {
        primaryKey: 'Nombre',
        title: 'Nombre',
      },
      {
        primaryKey: '',
        title: 'Acciones',
        property: 'button',
        buttons: [
        {
          type: 'edit',
          icon: 'fas fa-search',
          tooltip: 'Consultar'
      }
        ]
      }
    ];
  };

  viewDetail = (item) => {
    this.localStorage.setJsonValue('RequestProyecto', item);
    if (item != null && item != '') {
      this.router.navigate(['cartera/detail']);
    } else return;
  }

  registrarActividades = () => {
    this.proyectoActividades.IdProyecto = this.idProyecto;
    this.proyectoActividades.ProyectoActividadesRequest = this.listSchedules;
    this.serviceProyecto.RegCronograma(this.proyectoActividades).subscribe(
      (data: any) => {
        
        this.spinner.hide();
        // this.router.navigate(['cartera/register']);
      },
      (error: HttpErrorResponse) => {
        this.spinner.hide();
      }
    );
    
  }    
}
