import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent implements OnInit {
  counter: number = 0;
  isFlutterAppVisible = false;

  ngOnInit(): void {
    window.addEventListener('message', this.closeFlutterModal.bind(this), false);
  }

  incrementCounter(): void {
    this.counter++;
    if (this.counter % 5 == 0) {
      this.openFlutterModal();
    }
  }

  openFlutterModal(): void {
    this.isFlutterAppVisible = true;
  }

  closeFlutterModal(event: MessageEvent): void {
    if (event.data === 'close') {
      this.isFlutterAppVisible = false;
    }
  }
}
