import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { RegisterPersonalRoutingModule } from './register-personal-routing.module';
import { RegisterPersonalComponent } from './register-personal.component';

@NgModule({
    declarations: [
        RegisterPersonalComponent
    ],
    imports: [
      CommonModule,
      RegisterPersonalRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class RegisterPersonalModule { }