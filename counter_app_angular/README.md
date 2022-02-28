# Counter App Angular

This project contains sample Angular application that shows how to embed Flutter project into Angular (web-based) project.

## Setup

To add existing Flutter Application into web-based project you need to build your Flutter project for web.

### Building Flutter project for web
To setup Flutter web project go check out the [Building a web application with Flutter](https://docs.flutter.dev/get-started/web)

To get the required web app build run:

```
flutter build web
```

This generates the app, including the assets, and places the files into the `/build/web` directory of the project.

### Generate web for Flutter Module

**Note**: Current version of Flutter doesn't support creating web project of Flutter module.
To allow generating Flutter web of Flutter module change entry in `.metadata`:

```
~~project_type: module~~
project_type: app
```

Run:
```
flutter create . --platforms web --org com.example.flutter_nps
```

Remove automatically generated `widget_test.dart` file

and build app with:

```
flutter build web
```


## Further Angular help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.