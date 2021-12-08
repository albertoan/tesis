import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Proyecto, ProyectoId } from 'src/app/shared/models/response/core/proyecto.interface';

declare var anychart: any;
declare var GaugeChart: any;

@Component({
  selector: 'app-proyecto',
  templateUrl: './proyecto.component.html',
  styleUrls: ['./proyecto.component.css']
})
export class ProyectoComponent implements OnInit {

    public labelJson: ResponseLabel = new ResponseLabel();
    proyecto = new ProyectoId();
    proyectoResponse = new Proyecto();

    constructor(
      private spinner: NgxSpinnerService,
      private router: Router,
      private localStorage: LocalService,
      private serviceProyecto: GeneralService
    ) { }
  
    ngOnInit(): void {
        this.spinner.show();
        this.proyecto.IdProyecto = this.localStorage.getJsonValue('RequestProyecto').IdProyecto;
        this.GetProyectoById(this.proyecto);
    }

    GetProyectoById = (proyecto) => {
      this.serviceProyecto.GetProyectoById(proyecto).subscribe(
        (data: any) => {
          this.proyectoResponse = data.Value;
          this.proyectoResponse.ProyectoActividadesRequest = data.Value.ProyectoActividadesResponse;
          var IdDepartamento = this.proyectoResponse.IdDepartamento;
          
          let avanceArray = this.proyectoResponse.CicloDescripcion.split('.');
          let avance = avanceArray[0];
          let avanceBarra = 0;

          switch(avance) { 
            case "1": { 
               avanceBarra = 20;
               break; 
            } 
            case "2": { 
              avanceBarra = 40;
               break; 
            } 
            case "3": { 
              avanceBarra = 60;
              break; 
            } 
            case "4": { 
              avanceBarra = 80;
              break; 
            } 
            case "5": { 
              avanceBarra = 99;
              break; 
            } 
         } 
          
          let element = document.querySelector('#gaugeArea')
          let gaugeOptions = {
            hasNeedle: true,
            needleColor: 'gray',
            needleUpdateSpeed: 1000,
            arcColors: ['rgb(44, 151, 222)', 'lightgray'],
            arcDelimiters: [avanceBarra],
            arcOverEffect: true,
            arcLabels: [avance],
            arcPadding: '',
            arcPaddingColor: 'lightgray',
            rangeLabel: ['0','5'],  
            labelsFont: '',  
            // centralLabel: '50',
          }
          GaugeChart.gaugeChart(element, 300, gaugeOptions).updateNeedle(avanceBarra)

          this.LoadMap(IdDepartamento);
          this.spinner.hide();
        },
        (error: HttpErrorResponse) => {
          this.spinner.hide();
        }
      );
    }

    LoadMap = (IdDepartamento) => {
      anychart.onDocumentReady(()=> {
        var map = anychart.map();      
        var dataSet = anychart.data.set(
            [
            {"id":"PE.3341","value":0},
            {"id":"PE.AM","value":1},
            {"id":"PE.AN","value":2},
            {"id":"PE.AP","value":3},
            {"id":"PE.AR","value":4},
            {"id":"PE.AY","value":5},
            {"id":"PE.CJ","value":6},
            {"id":"PE.LR","value":7},
            {"id":"PE.CS","value":8},
            {"id":"PE.HV","value":9},
            {"id":"PE.HC","value":10},
            {"id":"PE.IC","value":11},
            {"id":"PE.JU","value":12},
            {"id":"PE.LL","value":13},
            {"id":"PE.LB","value":14},
            {"id":"PE.148","value":15},
            {"id":"PE.LO","value":16},
            {"id":"PE.MD","value":17},
            {"id":"PE.MQ","value":18},
            {"id":"PE.PA","value":19},
            {"id":"PE.PI","value":20},
            {"id":"PE.CL","value":21},
            {"id":"PE.SM","value":22},
            {"id":"PE.TA","value":23},
            {"id":"PE.TU","value":24},
            {"id":"PE.UC","value":25}
            ]);
      
        dataSet.mc.forEach(element => {
          if(element.value == IdDepartamento){
            dataSet.mc[IdDepartamento].fill = '#addd8e'
          }
        });

        var series = map.choropleth(dataSet);
        map.unboundRegions().fill('#eee');
        series.geoIdField('id');
        series.hovered().fill('#addd8e');
        map.geoData(anychart.maps['peru']);
        map.container('container');
        map.draw();
      });
    }

    
}
