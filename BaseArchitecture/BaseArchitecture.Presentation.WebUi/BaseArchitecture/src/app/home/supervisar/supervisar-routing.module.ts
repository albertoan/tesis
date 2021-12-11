import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { SupervisarComponent } from './supervisar.component';

const routes: Routes = [
    {
      path: '',
      component: SupervisarComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SupervisarRoutingModule { }