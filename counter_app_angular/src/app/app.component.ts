import { CdkAriaLive } from '@angular/cdk/a11y';
import { ChangeDetectorRef, Component } from '@angular/core';
import { windowWhen } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  counter: number = 0;
  isFlutterAppVisible = false;

  ngOnInit(){
    window.addEventListener('message', this.closeFlutterModal.bind(this), false);
  }

  incrementCounter(): void {
    this.counter++;
    if( this.counter % 5 == 0 )
      this.openFlutterModal();
  }

  openFlutterModal() {
    this.isFlutterAppVisible = true;
  }

  closeFlutterModal(event : MessageEvent) {
    if(event.data === 'close'){
      this.isFlutterAppVisible = false;      
    }
  }
}
