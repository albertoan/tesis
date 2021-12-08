import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { retry, catchError } from 'rxjs/operators';
import { Authentication, Path, Security,Siscose } from '../../constant';
import { Observable } from 'rxjs';
import { AutorizacionService } from './autorizacion.service';
import { LoginRequest } from '../../models/request/authentication/authentication-request.interface';
import { LoginResponse } from '../../models/response/authentication/authentication-response.interface';
import { AccessResponse } from '../../models/response/authentication/authentication-response.interface';
import { Proyecto, Programacion, ProyectoId, ProyectoActividades, Insumos } from '../../models/response/core/proyecto.interface';

@Injectable({ providedIn: 'root' })
export class GeneralService {
  urlWebApi: string;

  constructor(
    private http: HttpClient,
    private autorizacionService: AutorizacionService
  ) {
    this.urlWebApi = environment.serverUriApi;
  }

  Login(loginModel: LoginRequest): Observable<LoginResponse> {
    return this.http
      .get<LoginResponse>(
        this.urlWebApi + Path.Authentication + Authentication.Login,
        {
          observe: 'body',
          params: { loginRequest: JSON.stringify(loginModel) },
        }
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  Access(): Observable<AccessResponse> {
    return this.http
      .get<AccessResponse>(this.urlWebApi + Path.Security + Security.Access)
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListProyectos(): Observable<any> {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListProyectos
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListMaster(): Observable<any> {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListMaster
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListUBIGEO = (): Observable<any> => {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListUBIGEO
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  };

  GetProyectoById(proyecto): Observable<ProyectoId> {
    return this.http
      .get<Proyecto>(
        this.urlWebApi + Path.Siscose + Siscose.GetProyectoById,
        {
          observe: 'body',
          params: { proyectoRequest: JSON.stringify(proyecto) },
        }
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  GetListProyectoByIdProyecto(proyecto): Observable<any> {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.GetListProyectoByIdProyecto,
        {
          observe: 'body',
          params: { proyectoRequest: JSON.stringify(proyecto) },
        }
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListProyectoCodigo(): Observable<any> {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListProyectoCodigo
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListProgramacion(): Observable<any> {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListProgramacion
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  RegProgramacion(programacion: Programacion): Observable<any> {
    return this.http
      .post<any>(
        this.urlWebApi + Path.Siscose + Siscose.RegProgramacion,
        programacion
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  RegProyecto(proyecto: Proyecto): Observable<any> {
    return this.http
      .post<any>(
        this.urlWebApi + Path.Siscose + Siscose.RegProyecto,
        proyecto
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  RegInformeCoordinador(proyectoInsumosRequest: Insumos): Observable<any> {
    return this.http
      .post<any>(
        this.urlWebApi + Path.Siscose + Siscose.RegInformeCoordinador,
        proyectoInsumosRequest
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListProyectoInforme = (): Observable<any> => {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListProyectoInforme
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  };
  
  ListProyectoCronograma = (): Observable<any> => {
    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListProyectoCronograma
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  };

  RegCronograma(proyectoActividades: ProyectoActividades): Observable<any> {
    return this.http
      .post<any>(
        this.urlWebApi + Path.Siscose + Siscose.RegCronograma,
        proyectoActividades
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListMenu(userEdit: string): Observable<any> {

    var objeto = {
      userEdit: userEdit
    }

    return this.http
      .get<any>(
        this.urlWebApi + Path.Siscose + Siscose.ListMenu,
        {
          observe: 'body',
          params: { cargoRequest: JSON.stringify(objeto) },
        }
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  }

  ListProyectosRpt = (): Observable<any> => {
    return this.http
      .get<any>(
        environment.serverUriApi +  Path.Siscose + Siscose.ListProyectosRpt,
        {
          observe: 'body',
        }
      )
      .pipe(retry(0), catchError(this.autorizacionService.errorHandl));
  };
}
