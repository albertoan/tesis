import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { RegisterProyectoRoutingModule } from './register-proyecto-routing.module';
import { RegisterProyectoComponent } from './register-proyecto.component';

@NgModule({
    declarations: [
        RegisterProyectoComponent
    ],
    imports: [
      CommonModule,
      RegisterProyectoRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class RegisterProyectoModule { }