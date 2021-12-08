import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Insumos, Personal, Proyecto } from 'src/app/shared/models/response/core/proyecto.interface';
import { ToastrService } from 'ngx-toastr';
import { showError } from 'src/app/shared/util';
import { DatePipe } from '@angular/common';
import { ProyectoActividades } from '../../../shared/models/response/core/proyecto.interface';

@Component({
  selector: 'app-register-personal',
  templateUrl: './register-personal.component.html',
  styleUrls: ['./register-personal.component.css']
})
export class RegisterPersonalComponent implements OnInit {

    public labelJson: ResponseLabel = new ResponseLabel();
    personal = new Personal();
    //proyecto = new Proyecto();
    insumos = new Insumos();
    proyectoResponse = new Proyecto();
    listGeneral: any [] = [];
    listInversion: any [] = [];
    listCiclo: any [] = [];
    listNaturaleza: any [] = [];
    listModalidad: any [] = [];
    listDepartamentoResponse: any [] = [];
    listProvinciaResponse: any [] = [];
    listProvinciaResponseOriginal: any [] = [];
    listDistritoResponse: any [] = [];
    listDistritoResponseOriginal: any [] = [];
    tipoProyecto: string;
    SinceDate: string;
    UntilDate: string;

    isNew: boolean = false;
    desdeFechaDate: Date;
    hastaFechaDate: Date;
    nameProyecto: string;
    listSchedules: any[] = [];
    proyectoActividades: ProyectoActividades = new ProyectoActividades();
    contador: number;
    itemCodigo: string;
    idProyecto: string;

    constructor(
      private spinner: NgxSpinnerService,
      private router: Router,
      private localStorage: LocalService,
      public datepipe: DatePipe,
      private toastr: ToastrService,
      private serviceProyecto: GeneralService
    ) { }
  
    ngOnInit(): void {
        this.spinner.show();
        this.personal.IdCoordinador = "0";
        this.personal.Nombre = "";
        this.personal.ApellidoPaterno = "";
        this.personal.ApellidoMaterno = "";
        this.personal.Correo = "";
        this.personal.Telefono = "";
        this.personal.Estado = "";
        this.personal.IdZona = "";
        this.personal.Asignado = "";
        this.personal.Cargo = "";
        var editRes =this.localStorage.getJsonValue('EditRequestPersonal'); 
        this.personal = editRes;       
        //this.loadMaster();
        this.spinner.hide();
    }


    

 
    selectTipoProyecto = (item) => {
      if(item == 1) this.tipoProyecto = '1';
      else if(item == 2) this.tipoProyecto = '2';
      else if(item == 3) this.tipoProyecto = '3';
    }

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

    registerPersonal = () => {

      if( this.personal.Nombre == "" || this.personal.Nombre == undefined ){
        this.toastr.info("Ingrese el Nombre")
        return
      }
      else if( this.personal.ApellidoPaterno == "" || this.personal.ApellidoPaterno == undefined ){
        this.toastr.info("Ingrese el Apellido Paterno")
        return
      }
      else if( this.personal.ApellidoMaterno == "" || this.personal.ApellidoMaterno == undefined ){
        this.toastr.info("Ingrese el Apellido Materno")
        return
      }
      else if( this.personal.Correo == "" || this.personal.Correo == undefined ){
        this.toastr.info("Ingrese el Correo")
        return
      }
      else if( this.personal.Telefono == "" || this.personal.Telefono == undefined ){
        this.toastr.info("Ingrese el Telefono")
        return
      }
      else if( this.personal.Estado == "" || this.personal.Estado == undefined ){
        this.toastr.info("Ingrese el Estado")
        return
      }
      else if( this.personal.IdZona == "" || this.personal.IdZona == undefined ){
        this.toastr.info("Ingrese el Zona")
        return
      }
      else if( this.personal.Asignado == "" || this.personal.Asignado == undefined ){
        this.toastr.info("Ingrese el Asignado")
        return
      }
      else if( this.personal.Cargo == "" || this.personal.Cargo == undefined ){
        this.toastr.info("Ingrese el Cargo")
        return
      }

      
      debugger
      this.serviceProyecto.RegPersonal(this.personal).subscribe(
        (data: any) => {
            this.toastr.success("Se registro correctamente")
            this.router.navigate(['personal']);
        },
        (error: HttpErrorResponse) => {
          showError("Ocurrió un error, verificar log");
          this.spinner.hide();
        }
      );
    }
}
