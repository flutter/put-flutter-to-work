import { ComponentFixture, fakeAsync, TestBed, tick } from '@angular/core/testing';
import { NewsService } from '../shared/news/news.service';

import { EndlessScrollViewComponent } from './endless-scroll-view.component';

describe('EndlessScrollViewComponent', () => {
  let component: EndlessScrollViewComponent;
  let fixture: ComponentFixture<EndlessScrollViewComponent>;
  let mockNewsService: NewsService;

  let scrollHeight = 100;
  let scrollPositionFromTop = 100;
  let scrollingViewHeight = 200;
  var htmlWindowData: any;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EndlessScrollViewComponent],
    }).compileComponents();
    mockNewsService = TestBed.inject(NewsService);
    htmlWindowData = {
      currentTarget: { window: { scrollY: scrollHeight } },
      target: { scrollingElement: { scrollHeight: scrollingViewHeight, offsetHeight: scrollPositionFromTop } },
    };
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EndlessScrollViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should build app news tiles from news service', fakeAsync(() => {
    expect(fixture.debugElement.nativeElement.querySelectorAll('app-news-tile').length).toEqual(10);

    mockNewsService.loadMoreNews();
    tick(2001);
    fixture.detectChanges();

    expect(fixture.debugElement.nativeElement.querySelectorAll('app-news-tile').length).toEqual(20);
  }));

  it('should call loadMoreNews onScroll at the bottom', fakeAsync(() => {
    let spy = spyOn(mockNewsService, 'loadMoreNews').and.returnValue();

    component.onScroll(htmlWindowData);

    expect(spy).toHaveBeenCalledTimes(1);
  }));

  it('should not call loadMoreNews onScroll when not reached bottom', fakeAsync(() => {
    htmlWindowData.target.scrollingElement.offsetHeight = 50;

    let spy = spyOn(mockNewsService, 'loadMoreNews').and.returnValue();

    component.onScroll(htmlWindowData);

    expect(spy).not.toHaveBeenCalled();
  }));
});
