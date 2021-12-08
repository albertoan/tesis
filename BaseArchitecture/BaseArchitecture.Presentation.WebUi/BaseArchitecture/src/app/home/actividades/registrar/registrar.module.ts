import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { RegistrarRoutingModule } from './registrar-routing.module';
import { RegistrarComponent } from './registrar.component';

@NgModule({
    declarations: [
      RegistrarComponent
    ],
    imports: [
      CommonModule,
      RegistrarRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class RegistrarModule { }