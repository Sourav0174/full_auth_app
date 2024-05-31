// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAgiEzmWpCJ_0Et22Wca6Nv3iaGwJole_s',
    appId: '1:853584392627:web:7dc5b31315df85b0f05bc6',
    messagingSenderId: '853584392627',
    projectId: 'full-auth-app-df43e',
    authDomain: 'full-auth-app-df43e.firebaseapp.com',
    storageBucket: 'full-auth-app-df43e.appspot.com',
    measurementId: 'G-KT45R20M7S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSpkUSC8xM-EId1uehLtst7YTUhTWftzo',
    appId: '1:853584392627:android:13aa20c685b184d4f05bc6',
    messagingSenderId: '853584392627',
    projectId: 'full-auth-app-df43e',
    storageBucket: 'full-auth-app-df43e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQsLXNIlGpW-gFt4fdlbZIB5HO4-kBytw',
    appId: '1:853584392627:ios:5309e755a24ce9dcf05bc6',
    messagingSenderId: '853584392627',
    projectId: 'full-auth-app-df43e',
    storageBucket: 'full-auth-app-df43e.appspot.com',
    iosBundleId: 'com.example.fullAuthApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQsLXNIlGpW-gFt4fdlbZIB5HO4-kBytw',
    appId: '1:853584392627:ios:5309e755a24ce9dcf05bc6',
    messagingSenderId: '853584392627',
    projectId: 'full-auth-app-df43e',
    storageBucket: 'full-auth-app-df43e.appspot.com',
    iosBundleId: 'com.example.fullAuthApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAgiEzmWpCJ_0Et22Wca6Nv3iaGwJole_s',
    appId: '1:853584392627:web:598ef13dcec6ba2cf05bc6',
    messagingSenderId: '853584392627',
    projectId: 'full-auth-app-df43e',
    authDomain: 'full-auth-app-df43e.firebaseapp.com',
    storageBucket: 'full-auth-app-df43e.appspot.com',
    measurementId: 'G-6FXH1WPHJX',
  );

}