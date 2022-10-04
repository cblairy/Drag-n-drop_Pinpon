import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-norris',
  templateUrl: './norris.component.html',
  styleUrls: ['./norris.component.css']
})
export class norrisComponent implements OnInit {

  constructor() {
  
   }

  ngOnInit(): void {
  }

  title = 'Ramos!';
  phrase = '=B'

}
