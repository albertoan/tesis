import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { HeadersInterface } from 'src/app/shared/models/request/common/headers-request.interface';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { HttpErrorResponse } from '@angular/common/http';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { Subject } from 'rxjs';


declare var anychart: any;

@Component({
  selector: 'app-reportes',
  templateUrl: './reportes.component.html',
  styleUrls: ['./reportes.component.css']
})
export class ReportesComponent implements OnInit {

    public labelJson: ResponseLabel = new ResponseLabel();
    reporteData: any [] = [];
    reporteData1: any [] = [];
    reporteData2: any [] = [];
    reporteData3: any [] = [];
    reporteData4: any [] = [];


    constructor(
      private spinner: NgxSpinnerService,
      private serviceProyecto: GeneralService,
    ) { }
  
    ngOnInit(): void {
      this.spinner.show();
      this.loadReport();

    }

    


    loadReport = () => {
      this.serviceProyecto.RptCantidadPoblacionPorDepartamento().subscribe(
        (data: any) => {
          data.Value.forEach(element => {
            var obj = [
              element.Departamento,
              element.Poblacion,
            ]
            this.reporteData.push(obj);
          });
          var chart = anychart.bar();
          var series = chart.bar(this.reporteData);
          series.normal().fill("#00cc99", 0.3);
          chart.title("Población beneficiada por Departamento");
          chart.xAxis().title("Departamentos");
          chart.yAxis().title("Población");
          chart.container("container");
          chart.draw();
          this.loadReport2();
          this.spinner.hide();
        },
        (error: HttpErrorResponse) => {
        this.spinner.hide();
        console.log(error);
        }
    );
  }

  loadReport2 = () => {
    this.serviceProyecto.RptCantidadProyectosPorCicloInversion().subscribe(
      (data: any) => {
        data.Value.forEach(element => {
          var obj = [
            element.CicloInversion,
            element.CantidadProyecto,
          ]
          this.reporteData1.push(obj);
        });
        var chart = anychart.bar();
        var series = chart.bar(this.reporteData1);
        series.normal().fill("#00cc99", 0.3);
        chart.title("Cantidad de Proyectos por Fase");
        chart.xAxis().title("Fase");
        chart.yAxis().title("Cantidad");
        chart.container("container1");
        chart.draw();
        this.loadReport3();
        this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
      this.spinner.hide();
      console.log(error);
      }
    );
  }

  loadReport3 = () => {
    this.serviceProyecto.RptCantidadProyectosPorTipoProyecto().subscribe(
      (data: any) => {
        data.Value.forEach(element => {
          var obj = [
            element.TipoProyecto,
            element.CantidadProyecto,
          ]
          this.reporteData2.push(obj);
        });
        var chart = anychart.bar();
        var series = chart.bar(this.reporteData2);
        series.normal().fill("#00cc99", 0.3);
        chart.title("Cantidad de Proyectos por Tipo");
        chart.xAxis().title("Tipo Proyecto");
        chart.yAxis().title("Cantidad");
        chart.container("container2");
        chart.draw();
        this.loadReport4();
        this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
      this.spinner.hide();
      console.log(error);
      }
    );
  }

  loadReport4 = () => {
    this.serviceProyecto.RptCostoPorDepartamento().subscribe(
      (data: any) => {
        data.Value.forEach(element => {
          var obj = [
            element.Departamento,
            element.Costo,
          ]
          this.reporteData3.push(obj);
        });
        var chart = anychart.bar();
        var series = chart.bar(this.reporteData3);
        series.normal().fill("#00cc99", 0.3);
        chart.title("Inversión por Departamento");
        chart.xAxis().title("Departamento");
        chart.yAxis().title("Inversión");
        chart.container("container3");
        chart.draw();
        this.loadReport5();
        this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
      this.spinner.hide();
      console.log(error);
      }
    );
  }

  loadReport5 = () => {
    this.serviceProyecto.RptCostoPorTipoProyecto().subscribe(
      (data: any) => {
        data.Value.forEach(element => {
          var obj = [
            element.TipoProyecto,
            element.Costo,
          ]
          this.reporteData4.push(obj);
        });
        var chart = anychart.bar();
        var series = chart.bar(this.reporteData4);
        series.normal().fill("#00cc99", 0.3);
        chart.title("Inversión por Tipo Proyecto");
        chart.xAxis().title("Tipo Proyecto");
        chart.yAxis().title("Inversión");
        chart.container("container4");
        chart.draw();
        this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
      this.spinner.hide();
      console.log(error);
      }
    );
  }

  


 
}
