import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { norrisComponent } from './norris/norris.component';



@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [
    norrisComponent
  ],
  exports : [
    norrisComponent
  ],
})

export class ChuckModule { }
