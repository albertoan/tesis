import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { ComponentsModule } from "src/app/component/component.module";
import { SharedModule } from "src/app/shared/shared.module";
import { SupervisarRoutingModule } from './supervisar-routing.module';
import { SupervisarComponent } from './supervisar.component';

@NgModule({
    declarations: [
        SupervisarComponent
    ],
    imports: [
      CommonModule,
      SupervisarRoutingModule,
      FormsModule,
      ComponentsModule,
      SharedModule,
    ]
  })
  export class SupervisarModule { }