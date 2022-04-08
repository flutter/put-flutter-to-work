## Getting Started

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

You must run `flutter build ios-framework` every time you make code changes in your Flutter module

When you change the Flutter plugin dependencies in flutter_nps/pubspec.yaml,
`run flutter pub get`
in your Flutter module directory to refresh the list of plugins read by the podhelper.rb script.
Then, run
`pod install` again from your application at /newsfeed_ios.

### Installing swift-format

For the full guide on swift-format visit [swift-format GitHub repository](https://github.com/apple/swift-format#:~:text=swift%2Dformat%20provides%20the%20formatting,and%20invoked%20via%20an%20API.)
