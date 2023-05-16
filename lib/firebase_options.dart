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
    apiKey: 'AIzaSyC-5hzpQNPRmgIYIxhCCdU4YoTMY9DuHhI',
    appId: '1:976206450178:web:0aa1ebcbd59ab9f416e11b',
    messagingSenderId: '976206450178',
    projectId: 'phopes0515',
    authDomain: 'phopes0515.firebaseapp.com',
    storageBucket: 'phopes0515.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0HktimsrXrIjLS_PvJxKG9gsS1s7A7cU',
    appId: '1:976206450178:android:60c0244ce158565216e11b',
    messagingSenderId: '976206450178',
    projectId: 'phopes0515',
    storageBucket: 'phopes0515.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOc8w9Q1wQgTxrKnuTcq8Jek4hk3n34SI',
    appId: '1:976206450178:ios:7626ff6bbfb7b24e16e11b',
    messagingSenderId: '976206450178',
    projectId: 'phopes0515',
    storageBucket: 'phopes0515.appspot.com',
    iosClientId: '976206450178-q6io7l8a00uklqpuvbo3n1chul2f8807.apps.googleusercontent.com',
    iosBundleId: 'com.example.phopesCjw',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOc8w9Q1wQgTxrKnuTcq8Jek4hk3n34SI',
    appId: '1:976206450178:ios:8e6d70593b89f0fa16e11b',
    messagingSenderId: '976206450178',
    projectId: 'phopes0515',
    storageBucket: 'phopes0515.appspot.com',
    iosClientId: '976206450178-u3skk2nnp4fve7mriifbh32njlv80a8s.apps.googleusercontent.com',
    iosBundleId: 'com.example.phopesCjw.RunnerTests',
  );
}
