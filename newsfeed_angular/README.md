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

#### Generate web for Flutter Module

**Note**: Current version of Flutter doesn't support creating web project of Flutter module.
To allow generating Flutter web of Flutter module change entry in `.metadata`:

```
- project_type: module
+ project_type: app
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

### Embeding Flutter in Angular project

For Angular project to be able to discover Flutter project copy `/build/web` directory from the project and paste it into `src` directory of Angular project. 

In `src/web/index.html` change <base href="/"> to <base href="./">

**Note**: Flutter files need to be added in `angular.json` for Angular to be able to discover them:
```
...
"assets": [
    "src/favicon.ico",
    "src/assets",
    "src/web"
],
...
```

To display the Flutter application in Html use `<iframe></iframe>` tag with defined `src` pointing to the `index.html` file of your project with `src` folder as your root.
```
<iframe src="./web/index.html"> </iframe>
```