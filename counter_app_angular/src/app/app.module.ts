import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MatButtonModule } from '@angular/material/button';
import { EndlessScrollComponent } from './endless-scroll/endless-scroll.component';
import { EndlessScrollViewComponent } from './endless-scroll-view/endless-scroll-view.component';
import { NewsTileComponent } from './news-tile/news-tile.component';

@NgModule({
  declarations: [AppComponent, EndlessScrollComponent, EndlessScrollViewComponent, NewsTileComponent],
  imports: [BrowserModule, BrowserAnimationsModule, MatButtonModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
