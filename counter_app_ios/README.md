## Getting Started

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Rebuild

You must run `flutter build ios-framework` every time you make code changes in your Flutter module

When you change the Flutter plugin dependencies in `flutter_nps/pubspec.yaml`,
`run flutter pub get`
in your Flutter module directory to refresh the list of plugins read by the podhelper.rb script.
Then, run
`pod install` again from your application at /counter_app_ios.

## Clound firestore configuration

To enable sending customer satisfaction score to cloud firestore you need to obtain Firebase credentials from already existing Firebase project. (To setup new Firebase project visit [official guide](https://console.firebase.google.com/).

Provide application specific configuration to `flutter_nps/firebase_config.dart`. Where to find the credentials you can follow [Firebase setup part](https://github.com/VGVentures/take-flutter-home/tree/main#firebase-setup-optional).


## Troubleshooting

### Cloud firestore

Message: `CocoaPods could not find compatible versions for pod "cloud_firestore"`
Resolution: in `/flutter_nps` after running `flutter build ios-framework` make sure that `.ios/Podfile` `platform :ios, '10.0'` and `ios/Pods/Local Podspecs` versions in all the `*.json` files match

Make sure that `<your_ios_native_app>/Podfile` version also matches.

```
"platforms": {
    "ios": "10.0"
  },
```


### Installing swift-format

For the full guide on swift-format visit [swift-format GitHub repository](https://github.com/apple/swift-format#:~:text=swift%2Dformat%20provides%20the%20formatting,and%20invoked%20via%20an%20API.)
