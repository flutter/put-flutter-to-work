import { fakeAsync, TestBed, tick } from '@angular/core/testing';

import { NewsService } from './news.service';

describe('DataService', () => {
  let service: NewsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(NewsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });

  it('should return initial value on subscribe', () => {
    let initialData = Array.from(Array(10).keys());

    let serviceData$ = service.getNews();

    serviceData$.subscribe((result) => expect(result).toEqual(initialData));
  });

  it('should return 10 more items on load more', fakeAsync(() => {
    let initialData = Array.from(Array(10).keys());
    let loadedMoreData = Array.from(Array(20).keys());
    let fakeServiceDelay = 2000;

    let serviceData$ = service.getNews();
    service.loadMoreNews();
    tick(fakeServiceDelay + 1);

    serviceData$.subscribe((result) => expect(result).toEqual(loadedMoreData));
  }));
});
