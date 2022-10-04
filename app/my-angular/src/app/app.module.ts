import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ChuckModule } from './chuck/chuck.module'

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    ChuckModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
