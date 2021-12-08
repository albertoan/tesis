import { Component, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { IndexdDBService } from 'src/app/shared/services/general/indexDB.service';
import { ToastrService } from 'ngx-toastr';
import { DatePipe } from '@angular/common';
import { HeadersInterface } from '../../shared/models/request/common/headers-request.interface';
import { HttpErrorResponse } from '@angular/common/http';
import { LocalService } from '../../shared/services/general/local.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-programar',
  templateUrl: './actividades.component.html',
  styleUrls: ['./actividades.component.css']
})
export class ActividadComponent implements OnInit {

  public labelJson: ResponseLabel = new ResponseLabel();
  deviceType: string;
  selectedEmployee: string;
  listEmployee: any [] = [];
  itemType: string;
  totalItems: number;
  configTable: {};
  listProyectos: any[] = [];
  headers: HeadersInterface[] = new Array<HeadersInterface>();

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

  ListProyectos = () => {
    this.serviceProyecto.ListProyectos().subscribe(
      (data: any) => {
        this.listProyectos = data.Value;
        this.totalItems = this.listProyectos.length;
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

  registerActivity = () => {
    this.router.navigate(['actividades/registrar']);
  }    
}
