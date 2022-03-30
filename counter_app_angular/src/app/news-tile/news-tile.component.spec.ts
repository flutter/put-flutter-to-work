import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewsTileComponent } from './news-tile.component';

describe('NewsTileComponent', () => {
  let component: NewsTileComponent;
  let fixture: ComponentFixture<NewsTileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewsTileComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewsTileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
