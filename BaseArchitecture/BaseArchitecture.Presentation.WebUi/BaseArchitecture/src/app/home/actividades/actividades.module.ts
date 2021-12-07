import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { ActividadRoutingModule } from './actividades-routing.module';
import { ActividadComponent } from './actividades.component';

@NgModule({
    declarations: [
      ActividadComponent
    ],
    imports: [
      CommonModule,
      ActividadRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class ActividadModule { }