import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { RegisterPersonalComponent } from './register-personal.component';

const routes: Routes = [
    {
      path: '',
      component: RegisterPersonalComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegisterPersonalRoutingModule { }