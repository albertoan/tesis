import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { RegisterProyectoComponent } from './register-proyecto.component';

const routes: Routes = [
    {
      path: '',
      component: RegisterProyectoComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegisterProyectoRoutingModule { }