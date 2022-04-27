# Newsfeed Android App

This project contains a sample Android application that shows you how to embed a Flutter module into a native Android project.

https://user-images.githubusercontent.com/17708132/163604660-54458b7a-5bc1-454f-93cc-2705a625838c.mov

## Getting Started

**Important:** For instructions on integrating Flutter modules into your existing applications, see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Import a Flutter module into your Android app

First download `flutter-aar` artifact from the [github repository Android CI workflow ](https://github.com/VGVentures/take-flutter-home/actions/workflows/android_workflow.yaml) and add folder to your project at root directory.

Update your `app/build.gradle` file with path of the imported artifact:

```
android {
  // ...
}

repositories {
  maven {
    url 'some/path/android_project/<copied-flutter-aar-artifact-directory-name>'
    // This is relative to the location of the build.gradle file
  }
  maven {
    url 'https://storage.googleapis.com/download.flutter.io'
  }
}

dependencies {
  // ...
  debugImplementation 'com.example.flutter_module:flutter_debug:1.0'
  profileImplementation 'com.example.flutter_module:flutter_profile:1.0'
  releaseImplementation 'com.example.flutter_module:flutter_release:1.0'
}
```

Add opening of the Flutter app to your application as shown in [example](https://github.com/VGVentures/take-flutter-home/blob/2db086b6b708e301c6562ceab37d933de3bd4254/newsfeed_android/app/src/main/java/com/example/newsfeed_android/MainActivity.kt#L93).

Run your Android project.

## Setup

To easily import the Flutter module into an existing Android application, we need to build the Flutter module into a generic Android Archive (AAR). To create an Android AAR file from the Flutter module run:

```sh
cd flutter_nps
flutter build aar
```

You must run `flutter build aar` every time you make code changes in your Flutter module. Then follow the rest of the instructions regarding configuration displayed in the command line.

Open the Android project in Android Studio or IntelliJ and run the app.

## Troubleshooting

### Failed to resolve: com.example.flutter_nps:flutter_debug:1.0

In both `build.gradle` and `app/build.gradle` replace relative path

```
maven {
     url '../../flutter_nps/build/host/outputs/repo'
}
```

with full path:

```
maven {
     url '<your_path>/flutter_nps/build/host/outputs/repo'
}
```
