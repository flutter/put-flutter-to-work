import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-endless-scroll-view',
  templateUrl: './endless-scroll-view.component.html',
  styleUrls: ['./endless-scroll-view.component.css'],
})
export class EndlessScrollViewComponent implements OnInit {
  news: number[] = Array.from(Array(10).keys());

  constructor() {}

  ngOnInit(): void {}

  onScroll() {
    //TODO: get data after 2 seconds
  }
}
