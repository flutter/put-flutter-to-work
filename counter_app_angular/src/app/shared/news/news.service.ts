import { Injectable } from '@angular/core';
import { BehaviorSubject, delay, Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class NewsService {
  private _news: BehaviorSubject<number[]> = new BehaviorSubject(Array.from(Array(10).keys()));
  readonly loading$ = new BehaviorSubject<boolean>(false);

  loadMoreNews() {
    this.loading$.next(true);
    let newContent = Array.from(Array(10).keys()).map(
      (item) => item + this._news.value[this._news.value.length - 1] + 1
    );
    var updatedNews = [...this._news.value, ...newContent];
    let delayedObservable = of(updatedNews).pipe(delay(2000));
    delayedObservable.subscribe((data) => {
      this._news.next(data);
      this.loading$.next(false);
    });
  }

  getNews(): Observable<number[]> {
    return this._news;
  }
}
