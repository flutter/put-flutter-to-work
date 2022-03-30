import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EndlessScrollViewComponent } from './endless-scroll-view.component';

describe('EndlessScrollViewComponent', () => {
  let component: EndlessScrollViewComponent;
  let fixture: ComponentFixture<EndlessScrollViewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EndlessScrollViewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EndlessScrollViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
