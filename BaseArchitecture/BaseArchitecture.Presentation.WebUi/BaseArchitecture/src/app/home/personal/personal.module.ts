import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { PersonalRoutingModule } from './personal-routing.module';
import { PersonalComponent } from './personal.component';

@NgModule({
    declarations: [
      PersonalComponent
    ],
    imports: [
      CommonModule,
      PersonalRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class PersonalModule { }