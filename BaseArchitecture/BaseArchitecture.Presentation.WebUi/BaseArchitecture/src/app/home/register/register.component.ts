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
import { createGuidRandom, dataURLtoFile, SetError } from '../../shared/util';
import { AttachedFileRequest } from '../../shared/models/response/core/proyecto.interface';
import { ToastrService } from 'ngx-toastr';

declare var fileS3: any

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
  idProyecto: string;
  listProyectosCode: any [] = [];
  proyectoInsumos = new Insumos();
  proyectoInsumosRequest = new Insumos();
  listProyectosOriginalCode: any [] = [];
  listProyectosCronograma: any [] = [];
  listProyectosCronogramaOriginal: any [] = [];
  @ViewChild('inputFile') inputFile: ElementRef;
  answerActionRequest: Evidencia = new Evidencia();
  EvidenciaCommentary: string;
  listaTemporal: any [] = [];
  viewCommentary: boolean;

  constructor(
    private spinner: NgxSpinnerService,
    private router: Router,
    private localStorage: LocalService,
    private oIndexdDBService: IndexdDBService,
    private serviceProyecto: GeneralService,
    private toastr: ToastrService,
  ) { }

  ngOnInit(): void {
    this.spinner.show();
    this.deviceType = ( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) ? 'M':'D';
    this.loadProyectos();
  }

  view = (value) => {
      debugger
      if( value == 2 ) this.viewCommentary = true;
      else this.viewCommentary = false;
  }

  typeaheadOnSelectEmployee = (e: TypeaheadMatch): void => {
    debugger
    this.itemCode = e.value;
    this.itemType = e.item.TipoObra;
    this.idProyecto = e.item.IdProyecto;
    this.listProyectosCode = this.listProyectosOriginalCode.filter(x => x.Codigo == this.itemCode);
    this.proyectoInsumos = this.listProyectosCode[0];
    this.listProyectosCronograma = this.listProyectosCronogramaOriginal.filter(x => x.Idproyecto == this.idProyecto);
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

  registerInformation = () => { 
    
    
    debugger


    this.proyectoInsumosRequest.Actividades = this.listProyectosCronograma;

    
    this.proyectoInsumosRequest.Evidencia = this.answerActionRequest;
    this.proyectoInsumosRequest.Evidencia.AttachedFile.forEach(element => {
      element.FileBase64 ="";
      element.FileBuffer ="";
    });
    // this.

    this.serviceProyecto.RegInformeCoordinador(this.proyectoInsumosRequest).subscribe(
      (data: any) => {
          debugger
          this.toastr.success("Se registro correctamente")
         
      },
      (error: HttpErrorResponse) => {
        showError("Ocurrió un error, verificar log");
        this.spinner.hide();
      }
    );


    // this.answerActionRequest.AttachedFile.forEach((element) => {

    //   var params = fileS3.ParamsBucket(
    //     environment.bucketSite,
    //     element.PathFile,
    //     dataURLtoFile(element.FileBase64, element.Name)
    //   );

    //   fileS3.UploadS3(params, (err, data) => {
    //     if (err) {
    //       this.toastr.error('Credenciales expirada, cerrando sesión');
    //       console.log(err);
    //       SetError();
    //       // SignOff();
    //       return false;
    //     } else return true;
    //   });
    // });

  }

  loadCronograma = () => { 
    debugger
    this.oIndexdDBService
    .fetchData(
      DBName.siscose,
      ObjectStoreName.dataStore,
      KeyObjectSoreName.GetProyectoInformeCronograma
    )
    .then((resp: any) => {
      debugger
      let body: any [] = JSON.parse(decrypt(resp.body));
      this.listProyectosCronogramaOriginal = body;
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
      debugger
      if(_this.answerActionRequest.AttachedFile == undefined)  {
        _this.answerActionRequest.AttachedFile  =  new Array<AttachedFileRequest>();
      }    
        
      debugger

      _this.answerActionRequest.AttachedFile.push(
        {
            IdProyecto: _this.idProyecto,
            IdAttachedFile: IdAttachedFile,
            Name: file.name,
            PathFile:  environment.bucket.concat(
                      '/',
                      IdAttachedFile
                      ,'/',
                      file.name    
                    ),
            FileBase64: reader.result,
            FileBuffer: fileInput.target.files[0]
        }
      );
     _this.inputFile.nativeElement.value = '';
     debugger
    //  _this.answerActionRequest.AttachedFile = _this.answerActionRequest.AttachedFile;
    };



  };


}
