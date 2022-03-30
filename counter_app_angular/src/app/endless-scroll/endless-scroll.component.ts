import { Component, ElementRef, EventEmitter, Input, OnDestroy, OnInit, Output, ViewChild } from '@angular/core';

@Component({
  selector: 'app-endless-scroll',
  templateUrl: './endless-scroll.component.html',
  styleUrls: ['./endless-scroll.component.css'],
})
export class EndlessScrollComponent implements OnInit, OnDestroy {
  @Input() options = {};
  @Output() scrolled = new EventEmitter();
  @ViewChild('anchor') anchor!: ElementRef<HTMLElement>;

  private observer: IntersectionObserver | undefined;

  constructor(private host: ElementRef) {}

  ngOnDestroy() {
    this.observer!.disconnect();
  }

  ngOnInit(): void {
    const options = {
      root: null,
      ...this.options,
    };

    this.observer = new IntersectionObserver(([entry]) => {
      entry.isIntersecting && this.scrolled.emit();
    }, options);

    this.observer.observe(this.anchor.nativeElement);
  }

  private isHostScrollable() {
    const style = window.getComputedStyle(this.element);

    return style.getPropertyValue('overflow') === 'auto' || style.getPropertyValue('overflow-y') === 'scroll';
  }

  get element() {
    return this.host.nativeElement;
  }
}
