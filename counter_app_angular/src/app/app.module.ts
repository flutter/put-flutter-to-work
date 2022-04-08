import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MatButtonModule } from '@angular/material/button';
import { EndlessScrollViewComponent } from './endless-scroll-view/endless-scroll-view.component';
import { NewsTileComponent } from './news-tile/news-tile.component';

import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

@NgModule({
  declarations: [AppComponent, EndlessScrollViewComponent, NewsTileComponent],
  imports: [BrowserModule, BrowserAnimationsModule, MatButtonModule, MatProgressSpinnerModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
