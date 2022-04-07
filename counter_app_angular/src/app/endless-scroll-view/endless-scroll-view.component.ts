import { Component, HostListener, Input, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { NewsService } from '../shared/news/news.service';

@Component({
  selector: 'app-endless-scroll-view',
  templateUrl: './endless-scroll-view.component.html',
  styleUrls: ['./endless-scroll-view.component.css'],
})
export class EndlessScrollViewComponent implements OnInit {
  news$: Observable<number[]> | undefined;

  constructor(private dataService: NewsService) {}

  ngOnInit(): void {
    this.news$ = this.dataService.getNews();
  }

  @HostListener('window:scroll', ['$event'])
  onScroll(event: any) {
    const scrollBottom = event.currentTarget.window.scrollY + event.target.scrollingElement.offsetHeight;
    const viewHeight = event.target.scrollingElement.scrollHeight;

    if (scrollBottom >= viewHeight) {
      this.dataService.loadMoreNews();
    }
  }
}
