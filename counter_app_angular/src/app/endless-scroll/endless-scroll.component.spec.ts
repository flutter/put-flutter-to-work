import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EndlessScrollComponent } from './endless-scroll.component';

describe('EndlessScrollComponent', () => {
  let component: EndlessScrollComponent;
  let fixture: ComponentFixture<EndlessScrollComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EndlessScrollComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EndlessScrollComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
