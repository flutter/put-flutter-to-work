import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-news-tile',
  templateUrl: './news-tile.component.html',
  styleUrls: ['./news-tile.component.css'],
})
export class NewsTileComponent implements OnInit {
  @Input()
  newsId: number | undefined;
  image: string | undefined;
  static imageName: string = 'assets/templateImage';

  ngOnInit(): void {
    this.image = NewsTileComponent.imageName + ((this.newsId ?? 0) % 5).toString() + '.png';
  }
}
