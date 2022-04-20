# Newsfeed iOS App

This project contains a sample iOS application that shows how to embed the Flutter module into a native iOS project.

https://user-images.githubusercontent.com/17708132/163604266-3e640917-6860-4592-baa4-2376335a8fc3.mov

## Getting Started

**Important:** For instructions on integrating Flutter modules into your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Build

You must run `flutter build ios-framework` every time you make code changes in your Flutter module.

When you change the Flutter plugin dependencies in `flutter_nps/pubspec.yaml`, run `flutter pub get` in your Flutter module directory to refresh the list of plugins read by the podhelper.rb script.

Then, run `pod install` again from your application at `newsfeed_ios/`.

Open the xcworkspace in Xcode and run the app.

### Installing swift-format

For the full guide on swift-format visit [swift-format GitHub repository](https://github.com/apple/swift-format#:~:text=swift%2Dformat%20provides%20the%20formatting,and%20invoked%20via%20an%20API.)
