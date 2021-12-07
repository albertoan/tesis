import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { EditProyectoRoutingModule } from './edit-proyecto-routing.module';
import { EditProyectoComponent } from './edit-proyecto.component';

@NgModule({
    declarations: [
        EditProyectoComponent
    ],
    imports: [
      CommonModule,
      EditProyectoRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class EditProyectoModule { }