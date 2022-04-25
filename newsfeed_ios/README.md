# Newsfeed iOS App

This project contains a sample iOS application that shows how to embed the Flutter module into a native iOS project.

https://user-images.githubusercontent.com/17708132/163604266-3e640917-6860-4592-baa4-2376335a8fc3.mov

## Getting Started

**Important:** For instructions on integrating Flutter modules into your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Import Flutter module to existing iOS app

First download two artifacts from the [github repository Swift CI workflow ](https://github.com/VGVentures/take-flutter-home/actions/workflows/ios_workflow.yaml) and add them to your project at root directory.

<img src="https://user-images.githubusercontent.com/17708132/165085653-216276db-08e4-4182-a984-b0ff213315a2.png" width="600" />
<img src="https://user-images.githubusercontent.com/17708132/165086108-969c9667-58ee-48e5-a261-cf02a942d2ed.png" width="600" />

Add below configuration to your `Podfile` target (on instruction how to setup cocoapods visit [cocoapods installation guide](https://guides.cocoapods.org/using/using-cocoapods.html))

```
  flutter_application_path = './ios-podhelper'
  load File.join(flutter_application_path, 'podhelper.rb')
  install_all_flutter_pods(flutter_application_path)
```

In Xcode project settings > Build Settings > Linking > Runpath Search Paths add `$(PROJECT_DIR)/flutter-framework/Release`.
<img src="https://user-images.githubusercontent.com/17708132/165083434-11e8a3e9-7ea0-47c2-961e-6d85d61161e9.png" height="300" />

Run `pod install` and `pod update`.

Add opening of the Flutter app to your application as shown in [example](https://github.com/VGVentures/take-flutter-home/blob/2db086b6b708e301c6562ceab37d933de3bd4254/newsfeed_ios/newsfeedApp/EndlessList.swift#L37).

Run your iOS app using Xcode.

## Troubleshooting

### Error: 'framework not found FlutterPluginRegistrant'

Usually it's missing path, make sure you added '$(PROJECT_DIR)/flutter-framework/Release' to your Runpath Search Paths.

and run `pod update`

### Error: 'building for iOS Simulator, but linking in dylib built for macOS... for architecture x86_64'

In Xcode project set 'Excluded Architectures' to `arm64` than run `pod install`

## Build

You must run `flutter build ios-framework` every time you make code changes in your Flutter module.

When you change the Flutter plugin dependencies in `flutter_nps/pubspec.yaml`, run `flutter pub get` in your Flutter module directory to refresh the list of plugins read by the podhelper.rb script.

Then, run `pod install` again from your application at `newsfeed_ios/`.

Open the xcworkspace in Xcode and run the app.

### Installing swift-format

For the full guide on swift-format visit [swift-format GitHub repository](https://github.com/apple/swift-format#:~:text=swift%2Dformat%20provides%20the%20formatting,and%20invoked%20via%20an%20API.)
