import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/core/auth.guard';
import { LayoutComponent } from './layout.component';
import { RegistrarModule } from '../actividades/registrar/registrar.module';

const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      {
        path: 'welcome',
        loadChildren: () =>
          import('src/app/home/index/index.module').then((m) => m.IndexModule),
          canActivate: [AuthGuard],
      },
      {
        path: 'registrar',
        loadChildren: () =>
          import('src/app/home/register/register.module').then(
            (m) => m.RegisterModule
          ),
          canActivate: [AuthGuard],
      },
      {
        path: 'personal',
        loadChildren: () =>
          import('src/app/home/personal/personal.module').then(
            (m) => m.PersonalModule
          ),
          canActivate: [AuthGuard],
      },
      {
        path: 'personal/register',
        loadChildren: () =>
          import('src/app/home/personal/register-personal/register-personal.module').then(
            (m) => m.RegisterPersonalModule
          ),
      },
      

      {
        path: 'programar',
        loadChildren: () =>
          import('src/app/home/programar/programar.module').then(
            (m) => m.ProgramarModule
          ),
          canActivate: [AuthGuard],
      },
      {
        path: 'cartera',
        loadChildren: () =>
          import('src/app/home/cartera/cartera.module').then(
            (m) => m.CarteraModule
          ),
          canActivate: [AuthGuard],
      },

      {
        path: 'informes',
        loadChildren: () =>
          import('src/app/home/supervisar/supervisar.module').then(
            (m) => m.SupervisarModule
          ),
          canActivate: [AuthGuard],
      },

      {
        path: 'reportes',
        loadChildren: () =>
          import('src/app/home/reportes/reportes.module').then(
            (m) => m.ReportesModule
          ),
          canActivate: [AuthGuard],
      },

      {
        path: 'cartera/detail',
        loadChildren: () =>
          import('src/app/home/cartera/proyecto/proyecto.module').then(
            (m) => m.ProyectoModule
          ),
      },
      {
        path: 'cartera/register',
        loadChildren: () =>
          import('src/app/home/cartera/register-proyecto/register-proyecto.module').then(
            (m) => m.RegisterProyectoModule
          ),
      },
      {
        path: 'cartera/edit',
        loadChildren: () =>
          import('src/app/home/cartera/edit-proyecto/edit-proyecto.module').then(
            (m) => m.EditProyectoModule
          ),
      },
      {
        path: 'actividades',
        loadChildren: () =>
          import('src/app/home/actividades/actividades.module').then(
            (m) => m.ActividadModule
          ),
      },
      {
        path: 'actividades/registrar',
        loadChildren: () =>
          import('src/app/home/actividades/registrar/registrar.module').then(
            (m) => m.RegistrarModule
          ),
      },
      // { path: '', redirectTo: '/login', pathMatch: 'full' },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class LayoutRoutingModule {}
