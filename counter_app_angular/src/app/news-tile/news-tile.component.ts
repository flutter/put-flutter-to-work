import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-news-tile',
  templateUrl: './news-tile.component.html',
  styleUrls: ['./news-tile.component.css'],
})
export class NewsTileComponent implements OnInit {
  @Input()
  number!: number;
  image: String | undefined;
  imageName: String = 'assets/templateImage';

  constructor() {}

  ngOnInit(): void {
    this.image = this.imageName + (this.number % 5).toString() + '.png';
  }
}
