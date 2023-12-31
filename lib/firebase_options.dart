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
    apiKey: 'AIzaSyDwDrj0J5OhlCNKCMDDlxu4d8hH-mWiRyc',
    appId: '1:560969011623:web:757acbb64435f9df1a6682',
    messagingSenderId: '560969011623',
    projectId: 'trashfix-b1fbe',
    authDomain: 'trashfix-b1fbe.firebaseapp.com',
    storageBucket: 'trashfix-b1fbe.appspot.com',
    measurementId: 'G-YKQHH1ZBVE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT51sMJ_FbbugH080I7zffcAQRbhFKnvs',
    appId: '1:560969011623:android:9387f72057fc19441a6682',
    messagingSenderId: '560969011623',
    projectId: 'trashfix-b1fbe',
    storageBucket: 'trashfix-b1fbe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbsNXDlELOQXOfwp90GY1iD8ZDuqjMwwg',
    appId: '1:560969011623:ios:3fa4d344884aeeae1a6682',
    messagingSenderId: '560969011623',
    projectId: 'trashfix-b1fbe',
    storageBucket: 'trashfix-b1fbe.appspot.com',
    iosBundleId: 'com.example.trashfix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbsNXDlELOQXOfwp90GY1iD8ZDuqjMwwg',
    appId: '1:560969011623:ios:807caa97f5eea8b91a6682',
    messagingSenderId: '560969011623',
    projectId: 'trashfix-b1fbe',
    storageBucket: 'trashfix-b1fbe.appspot.com',
    iosBundleId: 'com.example.trashfix.RunnerTests',
  );
}
