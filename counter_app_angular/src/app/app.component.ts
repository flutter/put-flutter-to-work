import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  counter: number = 0;
  isFlutterAppVisible = false;

  incrementCounter(): void {
    this.counter++;
    if( this.counter % 5 == 0 )
      this.openFlutterModal();
  }

  openFlutterModal(){
    this.isFlutterAppVisible = true;
  }
}
