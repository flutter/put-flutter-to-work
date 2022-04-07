import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewsTileComponent } from './news-tile.component';

describe('NewsTileComponent', () => {
  let component: NewsTileComponent;
  let fixture: ComponentFixture<NewsTileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [NewsTileComponent],
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewsTileComponent);
    component = fixture.componentInstance;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should set correct image on ngInit', () => {
    const numberInputs = [0, 1, 2, 3, 4, 5, 6];
    const fileNameResults = [
      'assets/templateImage0.png',
      'assets/templateImage1.png',
      'assets/templateImage2.png',
      'assets/templateImage3.png',
      'assets/templateImage4.png',
      'assets/templateImage0.png',
      'assets/templateImage1.png',
    ];

    numberInputs.forEach((input) => {
      component.newsId = input;
      component.ngOnInit();

      expect(component.image).toEqual(fileNameResults[input]);
    });
  });
});
