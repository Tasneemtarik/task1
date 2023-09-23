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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB2QhD_fMTlM3aTU5evMQaowbcq1EECse8',
    appId: '1:478630748214:web:5ac4393a560bb26fae7897',
    messagingSenderId: '478630748214',
    projectId: 'chat-2876f',
    authDomain: 'chat-2876f.firebaseapp.com',
    storageBucket: 'chat-2876f.appspot.com',
    measurementId: 'G-KXJ3LCJRC8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUDav_cde-0ttJAKFszWFWr2wZnxmwIao',
    appId: '1:478630748214:android:58d2ba2d0ef4f9f6ae7897',
    messagingSenderId: '478630748214',
    projectId: 'chat-2876f',
    storageBucket: 'chat-2876f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmXXO6NItGPppXDr0YujFdY8p8t73wmmA',
    appId: '1:478630748214:ios:cf587949f23b52a6ae7897',
    messagingSenderId: '478630748214',
    projectId: 'chat-2876f',
    storageBucket: 'chat-2876f.appspot.com',
    iosBundleId: 'com.example.task1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmXXO6NItGPppXDr0YujFdY8p8t73wmmA',
    appId: '1:478630748214:ios:cf587949f23b52a6ae7897',
    messagingSenderId: '478630748214',
    projectId: 'chat-2876f',
    storageBucket: 'chat-2876f.appspot.com',
    iosBundleId: 'com.example.task1',
  );
}
