import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { ResponseLabel } from 'src/app/shared/models/general/label.interface';
import { LocalService } from 'src/app/shared/services/general/local.service';
import { TypeaheadMatch } from 'ngx-bootstrap/typeahead/public_api';
import { IndexdDBService } from 'src/app/shared/services/general/indexDB.service';
import { GeneralService } from 'src/app/shared/services/general/general.service';
import { decrypt, encrypt, showError } from 'src/app/shared/util';
import { HttpErrorResponse } from '@angular/common/http';
import { DBName, KeyObjectSoreName, ObjectStoreName } from 'src/app/shared/constant';
import { Evidencia, Insumos } from 'src/app/shared/models/response/core/proyecto.interface';
import { environment } from '../../../environments/environment.prod';
import { createGuidRandom } from '../../shared/util';
import { AttachedFileRequest } from '../../shared/models/response/core/proyecto.interface';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  public labelJson: ResponseLabel = new ResponseLabel();
  deviceType: string;
  selectedEmployee: string;
  listEmployee: any [] = [];
  itemCode: string;
  itemType: string;
  listProyectosCode: any [] = [];
  proyectoInsumos = new Insumos();
  listProyectosOriginalCode: any [] = [];
  listProyectosCronograma: any [] = [];
  @ViewChild('inputFile') inputFile: ElementRef;
  answerActionRequest: Evidencia = new Evidencia();

  listaTemporal: any [] = [];

  constructor(
    private spinner: NgxSpinnerService,
    private router: Router,
    private localStorage: LocalService,
    private oIndexdDBService: IndexdDBService,
    private serviceProyecto: GeneralService
  ) { }

  ngOnInit(): void {
    this.spinner.show();
    this.deviceType = ( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) ? 'M':'D';
    this.loadProyectos();
  }

  typeaheadOnSelectEmployee = (e: TypeaheadMatch): void => {
    this.itemCode = e.value;
    this.itemType = e.item.TipoObra;
    this.listProyectosCode = this.listProyectosOriginalCode.filter(x => x.Codigo == this.itemCode);
    this.proyectoInsumos = this.listProyectosCode[0];
  };

  loadProyectos = () => { 
    this.oIndexdDBService
    .fetchData(
      DBName.siscose,
      ObjectStoreName.dataStore,
      KeyObjectSoreName.GetProyectoInforme
    )
    .then((resp: any) => {
      let body: any [] = JSON.parse(decrypt(resp.body));
      this.listProyectosOriginalCode = body;
      this.loadCronograma();
    })
    .catch(() => {
      showError("Ocurrió un error, verificar log");
    });
  }

  loadCronograma = () => { 
    this.oIndexdDBService
    .fetchData(
      DBName.siscose,
      ObjectStoreName.dataStore,
      KeyObjectSoreName.GetProyectoInformeCronograma
    )
    .then((resp: any) => {
      debugger
      let body: any [] = JSON.parse(decrypt(resp.body));
      this.listProyectosCronograma = body;
      this.spinner.hide();
    })
    .catch(() => {
      showError("Ocurrió un error, verificar log");
    });
  }

  fileUpload = async (fileInput: any) => {
    debugger
    let _this = this;
    const file = fileInput.target.files.item(0);
    //carga offline
    var reader = new FileReader();
    reader.readAsDataURL(fileInput.target.files[0]);
    reader.onload = function () {

      let IdAttachedFile = createGuidRandom();
      
      if(_this.answerActionRequest.AttachedFile === undefined)      
        _this.answerActionRequest.AttachedFile  =  new Array<AttachedFileRequest>();

      _this.answerActionRequest.AttachedFile.push(
        {
            IdAttachedFile: IdAttachedFile,
            Name: file.name,
            PathFile:  environment.Bucket.concat(
                      '/',
                      file.name    
                    ),
            FileBase64: reader.result,
            FileBuffer: fileInput.target.files[0]
        }
      );
     _this.inputFile.nativeElement.value = '';
    };
  };


}
