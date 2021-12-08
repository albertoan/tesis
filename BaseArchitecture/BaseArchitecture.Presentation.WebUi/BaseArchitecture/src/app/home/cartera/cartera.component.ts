import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { HeadersInterface } from 'src/app/shared/models/request/common/headers-request.interface';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Base64toBlob } from 'src/app/shared/util';
import { FileNameExcel, MediaType } from 'src/app/shared/constant';

@Component({
  selector: 'app-cartera',
  templateUrl: './cartera.component.html',
  styleUrls: ['./cartera.component.css']
})
export class CarteraComponent implements OnInit {

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
      private router: Router,
      private localStorage: LocalService,
      private serviceProyecto: GeneralService
    ) { }
  
    ngOnInit(): void {
      this.spinner.show();
      this.createHeadersTable();
      this.loadStart();
      this.deviceType = ( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) ? 'M':'D';
      this.ListProyectos();
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
          title: 'Código',
        },
        {
          primaryKey: 'InversionDescripcion',
          title: 'Tipo de Inversión',
        },
        {
          primaryKey: 'CicloDescripcion',
          title: 'Ciclo de Inversión',
        },
        {
          primaryKey: 'NaturalezaDescripcion',
          title: 'Naturaleza',
        },
        {
          primaryKey: 'Nombre',
          title: 'Nombre',
        },
        {
          primaryKey: 'Departamento',
          title: 'Departamento',
        },
        {
          primaryKey: 'Costo',
          title: 'Costo',
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
        },
        {
          type: 'edit2',
          icon: 'fas fa-pencil-alt',
          tooltip: 'Editar'
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

    editDetail = (item) => {
      debugger
      
      this.localStorage.setJsonValue('EditRequestProyecto', item);
      if (item != null && item != '') {
        this.router.navigate(['cartera/edit']);
      } else return;
  }

    registerProject = () => {
       this.router.navigate(['cartera/register']);
  }

  exportExcel = () => {
    this.serviceProyecto.ListProyectosRpt().subscribe(
      (data : any) => {
        let blob = Base64toBlob(data.Value, MediaType.ExcelContentType);
        const link = document.createElement('a');
        const objectUrl = URL.createObjectURL(blob);
        link.href = objectUrl;
        link.download = FileNameExcel.ListProjectExcel;
        link.click();
        URL.revokeObjectURL(objectUrl);
        this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
        this.spinner.hide();
        console.log(error);
      }
    );
  }

}
