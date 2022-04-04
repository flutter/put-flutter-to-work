import { Type } from '@angular/core';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';
import { NewsService } from './shared/news/news.service';

describe('AppComponent', () => {
  let fixture: ComponentFixture<AppComponent>;
  let app: AppComponent;
  let mockNewsService: NewsService;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AppComponent],
    }).compileComponents();

    mockNewsService = TestBed.inject(NewsService);
    fixture = TestBed.createComponent(AppComponent);
    app = fixture.componentInstance;
  });

  it('should create the app.', () => {
    expect(app).toBeTruthy();
  });

  it('should display header and title when initialized', () => {
    const compiled = fixture.debugElement.nativeElement as HTMLElement;

    expect(compiled.querySelector('.header')?.textContent).toContain('newsfeed');
    expect(compiled.querySelector('.title')?.textContent).toContain('Lorem ipsum');
  });

  it('should display endless scroll view component', () => {
    const compiled = fixture.debugElement.nativeElement as HTMLElement;

    expect(compiled.querySelector('#app-endless-scroll-view')).toBeDefined();
  });
});
