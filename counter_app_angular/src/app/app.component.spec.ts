import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let fixture: ComponentFixture<AppComponent>;
  let app: AppComponent;
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AppComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(AppComponent);
    app = fixture.componentInstance;
  });

  it('should create the app.', () => {
    expect(app).toBeTruthy();
  });

  it(`should have 0 as initial counter value.`, () => {
    expect(app.counter).toEqual(0);
  });

  it('should change from 0 to 1 on button click.', () => {
    fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement as HTMLElement;
    expect(compiled.querySelector('.counter')?.textContent).toContain('0');

    let button = fixture.debugElement.nativeElement.querySelector('button');

    button.click();
    fixture.detectChanges();

    expect(compiled.querySelector('.counter')?.textContent).toContain('1');
  });

  it('should open flutter modal when counter is incremented from 4 to 5.', () => {
    app.counter = 4;
    const spy = spyOn(app, 'openFlutterModal');

    let button = fixture.debugElement.nativeElement.querySelector('button');
    button.click();

    expect(spy).toHaveBeenCalled();
  });

  it('isFlutterAppVisible should be true when openFlutterModal is called.', () => {
    app.isFlutterAppVisible = false;
    app.openFlutterModal();

    expect(app.isFlutterAppVisible).toBeTrue();
  });
});
