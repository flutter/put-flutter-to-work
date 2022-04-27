# Newsfeed Angular App

This project contains a sample Angular application that shows how to add a Flutter project into an Angular (web-based) project.

https://user-images.githubusercontent.com/17708132/163605104-f21a539a-c4dc-4059-aca3-670f674ebcbb.mov

## Getting Started

To add an existing Flutter Application into a web-based project you need to build your Flutter project for web.

## Import Flutter module to existing Angular app

To use already created Flutter module download an artifacts from the [github repository Archive workflow ](https://github.com/VGVentures/take-flutter-home/actions/workflows/archive_workflow.yaml) and add them to your project at root directory.

If you want to make the changes in the project follow 'Build' instructions bellow.

## Build

To set up a Flutter web project check out [building a web application with Flutter](https://docs.flutter.dev/get-started/web)

To build the web app run:

```
flutter build web
```

This generates the app, including the assets, and places the files into the `/build/web` directory of the project.

#### Generate web for Flutter Module

**Note**: The current version of Flutter doesn't support creating web projects for Flutter modules.
To allow generating of a Flutter module web project, change this entry in `.metadata`:

```
- project_type: module
+ project_type: app
```

Run:

```
flutter create . --platforms web --org com.example.flutter_nps
```

Remove the automatically generated `widget_test.dart` file

and build the app with:

```
flutter build web
```

### Embedding Flutter in an Angular project

For the Angular project to be able to discover the Flutter project, copy `/build/web` directory from the Flutter project and paste it into the `src` directory of the Angular project.

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

To display the Flutter application in Html use `<iframe></iframe>` tag with a defined `src` pointing to the `index.html` file of your project with the `src` folder as your root.

```
<iframe src="./web/index.html"> </iframe>
```

Move to your Angular project directory and run:

`npm install` or `npm install --legacy-peed-deps` depending on your npm dependencies.

Finally run:

`ng serve`
