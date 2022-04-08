import { Component, OnInit } from '@angular/core';
import { filter, Observable, Subscription, take } from 'rxjs';
import { NewsService } from './shared/news/news.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent implements OnInit {
  isFlutterAppVisible = false;
  subscription$: Subscription | undefined;

  constructor(private newsService: NewsService) {}

  ngOnInit(): void {
    window.addEventListener('message', this.closeFlutterModal.bind(this), true);
    this.subscription$ = this.newsService.loading$
      .pipe(
        filter((value) => value == true),
        take(1)
      )
      .subscribe(() => (this.isFlutterAppVisible = true));
  }

  closeFlutterModal(event: MessageEvent): void {
    if (event.data === 'close') {
      this.isFlutterAppVisible = false;
    }
  }

  ngOnDestory() {
    this.subscription$?.unsubscribe();
  }
}
