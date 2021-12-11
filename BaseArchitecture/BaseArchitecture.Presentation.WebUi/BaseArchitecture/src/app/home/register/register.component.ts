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
import { Evidencia, Insumos, Proyecto } from 'src/app/shared/models/response/core/proyecto.interface';
import { environment } from '../../../environments/environment';
import { createGuidRandom, dataURLtoFile, SetError, showInfo } from '../../shared/util';
import { AttachedFileRequest, RegistroTemperaturaRequest } from '../../shared/models/response/core/proyecto.interface';
import { ToastrService } from 'ngx-toastr';
import { Path, Siscose } from '../../shared/constant';
import { IndexedDBSaveService } from '../../shared/services/general/indexedDB-save.service';

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
  existeDataDB: boolean = false;

  longitudeRequest: number;
  latitudeRequest: number;

  longitudeRequestLabel: number;
  latitudeRequestLabel: number;

  existeLocation: boolean = false;

  cronogramaRequest: Proyecto = new Proyecto();

  mensajeLocation: string;
  oRegistroTemperaturaRequest: RegistroTemperaturaRequest =
  new RegistroTemperaturaRequest();

  listaMostrar: any [] = [];


  constructor(
    private spinner: NgxSpinnerService,
    private router: Router,
    private localStorage: LocalService,
    private oIndexdDBService: IndexdDBService,
    private serviceProyecto: GeneralService,
    private toastr: ToastrService,
    private oIndexedDBSaveService: IndexedDBSaveService,
  ) { }

  ngOnInit(): void {
    this.spinner.show();
    this.deviceType = ( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) ? 'M':'D';
    this.loadProyectos();
    this.syncData();
    this.ObtenerPosicionActual();
  }

  ObtenerPosicionActual = () => {
    debugger
    var _this = this;
    _this.mensajeLocation = '';
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        function (objPosition) {
          debugger
          _this.oRegistroTemperaturaRequest.Longitude = objPosition.coords.longitude;
            _this.longitudeRequest = objPosition.coords.longitude;
          _this.oRegistroTemperaturaRequest.Latitude = objPosition.coords.latitude;
            _this.latitudeRequest = objPosition.coords.latitude;
        },
        function (objPositionError) {
          debugger
          switch (objPositionError.code) {
            case objPositionError.PERMISSION_DENIED:
              _this.mensajeLocation =
                'No se ha permitido el acceso a la posición del usuario.';
              break;
            case objPositionError.POSITION_UNAVAILABLE:
              _this.mensajeLocation =
                'No se ha podido acceder a la información de su posición.';
              break;
            case objPositionError.TIMEOUT:
              _this.mensajeLocation =
                'El servicio ha tardado demasiado tiempo en responder.';
              break;
            default:
              _this.mensajeLocation = 'Error desconocido.';
          }
          if (_this.mensajeLocation != '') showInfo(_this.mensajeLocation);
        },
        {
          maximumAge: 75000,
          timeout: 15000,
        }
      );
    } else {
      _this.mensajeLocation =
        'Su navegador no soporta la API de geolocalización.';
    }
  };

  syncData=()  =>{
    if (navigator.onLine) {
      this.oIndexdDBService
        .fetchAllData(DBName.siscose, ObjectStoreName.saveStore)
        .then((resp: any) => {
          if (resp.length > 0) 
          { 
            this.existeDataDB = true;
            this.enviarSincronizar()
          }
        });

        this.oIndexdDBService
        .fetchAllData(DBName.siscose, ObjectStoreName.fileStore)
        .then((resp: any) => {
          if (resp.length > 0) 
          { 
            // this.existeDataDB = true;
            // this.syncS3(res)
          }
        });
    }
  }

  enviarSincronizar = async () => {
    let _this = this;
    this.spinner.show();
    this.oIndexedDBSaveService
      .obtenerIndexedDB()
      .then(() => {
        setTimeout(() => {
          showInfo("La sincronización se ejecutará en segundo plano");
          _this.spinner.hide();
        }, 5000);
     
      })
      .catch(() => {
        showError("Ocurrió un error, verificar log");
      });
  };

  view = (value) => {
      if( value == 2 ) this.viewCommentary = true;
      else this.viewCommentary = false;
  }

  typeaheadOnSelectEmployee = (e: TypeaheadMatch): void => {

    this.longitudeRequestLabel =  this.longitudeRequest;
    this.latitudeRequestLabel =  this.latitudeRequest;

    this.existeLocation = true;
    
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

    if(this.proyectoInsumosRequest.MaderaTipoA == undefined || this.proyectoInsumosRequest.MaderaTipoA == '') {
      this.toastr.info("Ingrese MaderaTipoA")
      return
    }

    if(this.proyectoInsumosRequest.MaderaTipoB == undefined || this.proyectoInsumosRequest.MaderaTipoB == '') {
      this.toastr.info("Ingrese MaderaTipoB")
      return
    }

    if(this.proyectoInsumosRequest.Concreto == undefined || this.proyectoInsumosRequest.Concreto == '') {
      this.toastr.info("Ingrese Concreto")
      return
    }

    if(this.proyectoInsumosRequest.Aluminio == undefined || this.proyectoInsumosRequest.Aluminio == '') {
      this.toastr.info("Ingrese Aluminio")
      return
    }

    if(this.proyectoInsumosRequest.PIN3 == undefined || this.proyectoInsumosRequest.PIN3 == '') {
      this.toastr.info("Ingrese PIN3")
      return
    }

    if(this.proyectoInsumosRequest.PIN4 == undefined || this.proyectoInsumosRequest.PIN4 == '') {
      this.toastr.info("Ingrese PIN4")
      return
    }

    if(this.proyectoInsumosRequest.Suspencion == undefined || this.proyectoInsumosRequest.Suspencion == '') {
      this.toastr.info("Ingrese Suspension")
      return
    }

    if(this.proyectoInsumosRequest.PAT1 == undefined || this.proyectoInsumosRequest.PAT1 == '') {
      this.toastr.info("Ingrese PAT1")
      return
    }

    if(this.proyectoInsumosRequest.PAT2 == undefined || this.proyectoInsumosRequest.PAT2 == '') {
      this.toastr.info("Ingrese PAT2")
      return
    }

    if(this.proyectoInsumosRequest.Pernos == undefined || this.proyectoInsumosRequest.Pernos == '') {
      this.toastr.info("Ingrese Pernos")
      return
    }

    if(this.proyectoInsumosRequest.Abrazaderas == undefined || this.proyectoInsumosRequest.Abrazaderas == '') {
      this.toastr.info("Ingrese Abrazaderas")
      return
    }

    if(this.proyectoInsumosRequest.Aisladores == undefined || this.proyectoInsumosRequest.Aisladores == '') {
      this.toastr.info("Ingrese Aisladores")
      return
    }

    if(this.proyectoInsumosRequest.Monofasicos == undefined || this.proyectoInsumosRequest.Monofasicos == '') {
      this.toastr.info("Ingrese Monofasicos")
      return
    }

    if(this.proyectoInsumosRequest.Bifasicos == undefined || this.proyectoInsumosRequest.Bifasicos == '') {
      this.toastr.info("Ingrese Bifasicos")
      return
    }

    if(this.proyectoInsumosRequest.Trifasicos == undefined || this.proyectoInsumosRequest.Trifasicos == '') {
      this.toastr.info("Ingrese Trifasicos")
      return
    }

    if(this.proyectoInsumosRequest.Transformadores == undefined || this.proyectoInsumosRequest.Transformadores == '') {
      this.toastr.info("Ingrese Transformadores")
      return
    }

    if(this.proyectoInsumosRequest.Interruptores == undefined || this.proyectoInsumosRequest.Interruptores == '') {
      this.toastr.info("Ingrese Interruptores")
      return
    }

    if(this.proyectoInsumosRequest.Contactores == undefined || this.proyectoInsumosRequest.Contactores == '') {
      this.toastr.info("Ingrese Contactores")
      return
    }

    if(this.proyectoInsumosRequest.Medidores == undefined || this.proyectoInsumosRequest.Medidores == '') {
      this.toastr.info("Ingrese Medidores")
      return
    }

    if(this.proyectoInsumosRequest.Fusibles == undefined || this.proyectoInsumosRequest.Fusibles == '') {
      this.toastr.info("Ingrese Fusibles")
      return
    }

    if(this.proyectoInsumosRequest.Pararrayos == undefined || this.proyectoInsumosRequest.Pararrayos == '') {
      this.toastr.info("Ingrese Pararrayos")
      return
    }

    if(this.EvidenciaCommentary == undefined || this.EvidenciaCommentary == '') {
      this.toastr.info("Ingrese sus comentarios")
      return
    }

    if(this.answerActionRequest.AttachedFile == undefined || this.answerActionRequest.AttachedFile.length == 0) {
      this.toastr.info("Debe cargar al menos un archivo")
      return
    }



    // this.answerActionRequest.AttachedFile.forEach((element) => {
    //   var params = fileS3.ParamsBucket(
    //     environment.BucketSite,
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
    
    this.proyectoInsumosRequest.IdProyecto = this.idProyecto;
    this.proyectoInsumosRequest.TipoObra = this.itemType;
    this.proyectoInsumosRequest.TipoRegistro = "2";
    this.proyectoInsumosRequest.Longitud = this.longitudeRequest.toString();
    this.proyectoInsumosRequest.Latitud = this.latitudeRequest.toString();
    this.proyectoInsumosRequest.Actividades = this.listProyectosCronograma;
    this.proyectoInsumosRequest.Evidencia = this.answerActionRequest;
    this.proyectoInsumosRequest.Evidencia.AttachedFile.forEach(element => {
      element.IdProyecto = this.idProyecto;
      element.FileBase64 = "";
      element.FileBuffer = "";
    });

    this.spinner.show();
    this.serviceProyecto.RegInformeCoordinador(this.proyectoInsumosRequest).subscribe(
      (data: any) => {
          
          this.ListCumplimientobyProyecto();
          this.toastr.success("Se registro correctamente")
          this.spinner.hide();
      },
      (error: HttpErrorResponse) => {
        if(navigator.onLine) {
          this.spinner.hide();
          showError("Ocurrió un error, verificar log"+ ' ' + error.error.UniqueIdentifier);
          console.log(error);
        } else {
          this.spinner.hide();
          let responseProyectoInsumosRequest = {
            codResponseCheckListEdit: 'ResponseInformeCoordinador',
            body: encrypt(JSON.stringify(this.proyectoInsumosRequest)),
            url:
              environment.serverUriApi + Path.Siscose + Siscose.RegInformeCoordinador,
          };
          this.oIndexdDBService.addStore(responseProyectoInsumosRequest).catch(console.log);
          this.toastr.success("Se registro correctamente")
        }
      }
    );
  }

  ListCumplimientobyProyecto = () => { 

    this.cronogramaRequest.IdProyecto = this.idProyecto;
    this.serviceProyecto.ListCumplimientobyProyecto(this.cronogramaRequest).subscribe(
      (data: any) => {

        this.listaMostrar = data.Value;
        debugger
          
      },
      (error: HttpErrorResponse) => {
 
          this.spinner.hide();
          showError("Ocurrió un error, verificar log"+ ' ' + error.error.UniqueIdentifier);
          console.log(error);
      }
    );
  }



  loadCronograma = () => { 
    this.oIndexdDBService
    .fetchData(
      DBName.siscose,
      ObjectStoreName.dataStore,
      KeyObjectSoreName.GetProyectoInformeCronograma
    )
    .then((resp: any) => {
      let body: any [] = JSON.parse(decrypt(resp.body));
      this.listProyectosCronogramaOriginal = body;
      this.spinner.hide();
    })
    .catch(() => {
      showError("Ocurrió un error, verificar log");
    });
  }

  fileUpload = async (fileInput: any) => {
    let _this = this;
    const file = fileInput.target.files.item(0);
    //carga offline
    var reader = new FileReader();
    reader.readAsDataURL(fileInput.target.files[0]);
    reader.onload = function () {

      let IdAttachedFile = createGuidRandom();
      if(_this.answerActionRequest.AttachedFile == undefined)  {
        _this.answerActionRequest.AttachedFile  =  new Array<AttachedFileRequest>();
      }    

      _this.answerActionRequest.AttachedFile.push(
        {
            IdProyecto: _this.idProyecto,
            IdAttachedFile: IdAttachedFile,
            Name: file.name,
            PathFile:  environment.Bucket.concat(
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
    };
  };
}
