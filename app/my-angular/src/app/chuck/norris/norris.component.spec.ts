import { ComponentFixture, TestBed } from '@angular/core/testing';

import { norrisComponent } from './norris.component';

describe('norrisComponent', () => {
  let component: norrisComponent;
  let fixture: ComponentFixture<norrisComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ norrisComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(norrisComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
