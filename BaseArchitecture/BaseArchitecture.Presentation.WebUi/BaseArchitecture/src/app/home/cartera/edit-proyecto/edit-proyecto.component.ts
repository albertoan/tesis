import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Insumos, Proyecto } from 'src/app/shared/models/response/core/proyecto.interface';
import { ToastrService } from 'ngx-toastr';
import { showError } from 'src/app/shared/util';
import { DatePipe } from '@angular/common';
import { ProyectoActividades } from '../../../shared/models/response/core/proyecto.interface';

@Component({
  selector: 'app-editar-proyecto',
  templateUrl: './edit-proyecto.component.html',
  styleUrls: ['./edit-proyecto.component.css']
})
export class EditProyectoComponent implements OnInit {

    public labelJson: ResponseLabel = new ResponseLabel();
    proyecto = new Proyecto();
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
        this.proyecto.Transferencia = "NO";
        this.proyecto.IdTipoInversion = "";
        this.proyecto.IdCicloInversion = "";
        this.proyecto.IdNaturaleza = "";
        this.proyecto.IdModalidad = "";
        this.proyecto.IdDepartamento = "";
        this.proyecto.IdProvincia = "";
        this.proyecto.IdDistrito = "";
        this.proyecto.IdZona = "";
        this.proyecto.IdTipoProyecto = "";
        this.loadMaster();
    }

    loadMaster = () => {
      this.serviceProyecto.ListMaster().subscribe(
        (data: any) => {
          this.listGeneral = data.Value;
          this.listInversion = this.listGeneral.filter(x => x.IdTipo == '100');
          this.listCiclo = this.listGeneral.filter(x => x.IdTipo == '200');
          this.listNaturaleza = this.listGeneral.filter(x => x.IdTipo == '300');
          this.listModalidad = this.listGeneral.filter(x => x.IdTipo == '400');
          this.loadUbigeo();
        },
        (error: HttpErrorResponse) => {
          this.spinner.hide();
        }
      );
    }

    loadUbigeo = () => {
      this.serviceProyecto.ListUBIGEO().subscribe(
        (data: any) => {
          this.listDepartamentoResponse = data.Value.ListDepartamentoResponse;
          this.listProvinciaResponseOriginal = data.Value.ListProvinciaResponse;
          this.listDistritoResponseOriginal = data.Value.ListDistritoResponse;
          this.spinner.hide();
        },
        (error: HttpErrorResponse) => {
          this.spinner.hide();
        }
      );
    }

    loadProvincia = (item) => {
      this.listProvinciaResponse = this.listProvinciaResponseOriginal.filter(x => x.IdDepartamento == item);
    }

    loadDistrito = (item) => {
      this.listDistritoResponse = this.listDistritoResponseOriginal.filter(x => x.IdProvincia == item);
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

    registerProject = () => {

      if( this.proyecto.Codigo == "" || this.proyecto.Codigo == undefined ){
        this.toastr.info("Ingrese el Código")
        return
      }

      else if( this.proyecto.Nombre == "" || this.proyecto.Nombre == undefined ){
        this.toastr.info("Ingrese el Nombre del proyecto")
        return
      }

      else if( this.proyecto.Transferencia == "" || this.proyecto.Transferencia == undefined ){
        this.toastr.info("Seleccione una transferencia")
        return
      }

      else if( this.proyecto.IdTipoInversion == "" || this.proyecto.IdTipoInversion == undefined ){
        this.toastr.info("Seleccione un tipo de Inversion")
        return
      }

      else if( this.proyecto.IdCicloInversion == "" || this.proyecto.IdCicloInversion == undefined ){
        this.toastr.info("Seleccione un Ciclo de Inversion")
        return
      }
    
      else if( this.proyecto.IdNaturaleza == "" || this.proyecto.IdNaturaleza == undefined ){
        this.toastr.info("Seleccione un tipo de Naturaleza")
        return
      }

      else if( this.proyecto.IdModalidad == "" || this.proyecto.IdModalidad == undefined ){
        this.toastr.info("Seleccione una Modalidad")
        return
      }

      else if( this.proyecto.IdDepartamento == "" || this.proyecto.IdDepartamento == undefined ){
        this.toastr.info("Seleccione un Departamento")
        return
      }

      else if( this.proyecto.IdProvincia == "" || this.proyecto.IdProvincia == undefined ){
        this.toastr.info("Seleccione una Provincia")
        return
      }

      else if( this.proyecto.Programa == "" || this.proyecto.Programa == undefined ){
        this.toastr.info("Ingrese un Programa")
        return
      }

      else if( this.proyecto.IdZona == "" || this.proyecto.IdZona == undefined ){
        this.toastr.info("Seleccione una Zona")
        return
      }

      else if( this.SinceDate == "" || this.SinceDate == undefined ){
        this.toastr.info("Ingrese una fecha de Inicio")
        return
      }

      else if( this.UntilDate == "" || this.UntilDate == undefined ){
        this.toastr.info("Ingrese una fecha de Fin")
        return
      }

      else if( this.proyecto.IdTipoProyecto == "" || this.proyecto.IdTipoProyecto == undefined ){
        this.toastr.info("Seleccione un tipo de proyecto")
        return
      }

      else if( this.proyecto.Costo == "" || this.proyecto.Costo == undefined ){
        this.toastr.info("Ingrese el costo")
        return
      }

      this.proyecto.Estado = "1";
      this.proyecto.Insumos = this.insumos;
      this.proyecto.Insumos.TipoRegistro = "1";
      this.proyecto.Insumos.TipoObra = this.tipoProyecto;
      this.proyecto.ProyectoActividadesRequest = this.listSchedules;
      if(this.insumos.Alumbrado)  this.insumos.Alumbrado = "1"; else this.insumos.Alumbrado = "0";
      if(this.insumos.Retenidas) this.insumos.Retenidas = "1"; else this.insumos.Retenidas = "0"
      if(this.insumos.PuestaTierra) this.insumos.PuestaTierra = "1"; else this.insumos.PuestaTierra = "0"
      this.serviceProyecto.RegProyecto(this.proyecto).subscribe(
        (data: any) => {
            this.toastr.success("Se registro correctamente")
            this.router.navigate(['cartera']);
        },
        (error: HttpErrorResponse) => {
          showError("Ocurrió un error, verificar log");
          this.spinner.hide();
        }
      );
    }
}
