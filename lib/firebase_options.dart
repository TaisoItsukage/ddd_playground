// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCIf4iI5MjwYpY06RH_qFSG6QWkXbGQ_1E',
    appId: '1:1003290424432:web:421f820d9bfbe8e19e30b5',
    messagingSenderId: '1003290424432',
    projectId: 'ddd-playground-ec',
    authDomain: 'ddd-playground-ec.firebaseapp.com',
    storageBucket: 'ddd-playground-ec.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCszzPblLiKPYbmr4-1r9uIM-pnXCwaxWY',
    appId: '1:1003290424432:android:2e09449e539b45819e30b5',
    messagingSenderId: '1003290424432',
    projectId: 'ddd-playground-ec',
    storageBucket: 'ddd-playground-ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVCqIAwEOzH1ZIubTG8cRTUYQzq2EBEqI',
    appId: '1:1003290424432:ios:662109ba5e15f18b9e30b5',
    messagingSenderId: '1003290424432',
    projectId: 'ddd-playground-ec',
    storageBucket: 'ddd-playground-ec.appspot.com',
    iosClientId:
        '1003290424432-r7rvc2rrhsvr3m3b94qk54tdcesbtuph.apps.googleusercontent.com',
    iosBundleId: 'com.example.dddPlayground',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVCqIAwEOzH1ZIubTG8cRTUYQzq2EBEqI',
    appId: '1:1003290424432:ios:662109ba5e15f18b9e30b5',
    messagingSenderId: '1003290424432',
    projectId: 'ddd-playground-ec',
    storageBucket: 'ddd-playground-ec.appspot.com',
    iosClientId:
        '1003290424432-r7rvc2rrhsvr3m3b94qk54tdcesbtuph.apps.googleusercontent.com',
    iosBundleId: 'com.example.dddPlayground',
  );
}
