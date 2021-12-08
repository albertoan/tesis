import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { EditProyectoComponent } from './edit-proyecto.component';

const routes: Routes = [
    {
      path: '',
      component: EditProyectoComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EditProyectoRoutingModule { }