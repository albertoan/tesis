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
  selector: 'app-personal',
  templateUrl: './personal.component.html',
  styleUrls: ['./personal.component.css']
})
export class PersonalComponent implements OnInit {

    public labelJson: ResponseLabel = new ResponseLabel();
    deviceType: string;
    selectedEmployee: string;
    listEmployee: any [] = [];
    itemType: string;
    totalItems: number;
    configTable: {};
    listPersonal: any[] = [];
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
      this.ListPersonal();
    }

    ListPersonal = () => {
      this.serviceProyecto.ListPersonal().subscribe(
        (data: any) => {
          debugger
          this.listPersonal = data.Value;
          this.totalItems = this.listPersonal.length;
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
          primaryKey: 'Nombre',
          title: 'Nombre',
        },
        {
          primaryKey: 'ApellidoPaterno',
          title: 'Apellido Paterno',
        },
        {
          primaryKey: 'ApellidoMaterno',
          title: 'Apellido Materno',
        },
        {
          primaryKey: 'Correo',
          title: 'Correo',
        },
        {
          primaryKey: '',
          title: 'Acciones',
          property: 'button',
          buttons: [
            {
              type: 'edit2',
              icon: 'fas fa-pencil-alt',
              tooltip: 'Editar'
            }
          ]
        }
      ];
    };



    editDetail = (item) => {
      debugger
      
      this.localStorage.setJsonValue('EditRequestPersonal', item);
      if (item != null && item != '') {
        this.router.navigate(['personal/register']);
      } else return;
  }

    registerProject = () => {
       this.router.navigate(['personal/register']);
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
