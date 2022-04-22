# Newsfeed Android App

This project contains a sample Android application that shows how to embed Flutter project into a native Android project.

https://user-images.githubusercontent.com/17708132/163604660-54458b7a-5bc1-454f-93cc-2705a625838c.mov


## Getting Started

**Important:** For instructions on integrating Flutter modules into your existing applications, see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Setup

To easily import the Flutter project into an existing Android application, we need to build the Flutter module into a generic Android Archive (AAR). To create an Android AAR file from the Flutter module run:

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

