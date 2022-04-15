# Newsfeed Android App

This project contains sample Android application that shows how to embed Flutter project into native Android project.

## Getting Started

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Setup

To easily import the Flutter project into existing Android application we need to build the Flutter module into a generic Android Archive(AAR). To create Android AAR file from the Flutter module run:

```sh
cd flutter_nps
flutter build aar
```

You must run `flutter build aar` every time you make code changes in your Flutter module. Than follow rest of the instructions regarding configuration displayed in the command line.

Open the Android project in Android Studio or IntelliJ and run the app.
