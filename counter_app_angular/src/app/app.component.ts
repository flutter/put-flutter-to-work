import { Component, OnInit } from '@angular/core';
import { filter, first } from 'rxjs';
import { NewsService } from './shared/news/news.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent implements OnInit {
  isFlutterAppVisible = true;

  constructor(private newsService: NewsService) {}

  ngOnInit(): void {
    window.addEventListener('message', this.closeFlutterModal.bind(this), false);
    this.newsService.loading$
      .pipe(
        filter((value) => value == true),
        first()
      )
      .subscribe(() => (this.isFlutterAppVisible = true));
  }

  closeFlutterModal(event: MessageEvent): void {
    if (event.data === 'close') {
      this.isFlutterAppVisible = false;
    }
  }
}
