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
    apiKey: 'AIzaSyCTQaHjH3265bIOLWzdnVfAiEc3qExELiQ',
    appId: '1:939954730010:web:43e044ecb8c7dba1c00da3',
    messagingSenderId: '939954730010',
    projectId: 'wingsandthingspizza-4d6fc',
    authDomain: 'wingsandthingspizza-4d6fc.firebaseapp.com',
    databaseURL: 'https://wingsandthingspizza-4d6fc-default-rtdb.firebaseio.com',
    storageBucket: 'wingsandthingspizza-4d6fc.appspot.com',
    measurementId: 'G-E6PPBM5LVS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuRssZRUsL5hOjrmJN214u0XPsiBAQDU4',
    appId: '1:939954730010:android:18f1e100af250b94c00da3',
    messagingSenderId: '939954730010',
    projectId: 'wingsandthingspizza-4d6fc',
    databaseURL: 'https://wingsandthingspizza-4d6fc-default-rtdb.firebaseio.com',
    storageBucket: 'wingsandthingspizza-4d6fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLku0k9x7nzv72ut6d9t0VYzJsu8qrPwE',
    appId: '1:939954730010:ios:8e6619140c7416e8c00da3',
    messagingSenderId: '939954730010',
    projectId: 'wingsandthingspizza-4d6fc',
    databaseURL: 'https://wingsandthingspizza-4d6fc-default-rtdb.firebaseio.com',
    storageBucket: 'wingsandthingspizza-4d6fc.appspot.com',
    androidClientId: '939954730010-217263fgk1p6qgf5vqrn6dkf70mntk06.apps.googleusercontent.com',
    iosClientId: '939954730010-p4q3v514csamfcqg0vctqgfn22rkcibk.apps.googleusercontent.com',
    iosBundleId: 'com.example.pizzaUserApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLku0k9x7nzv72ut6d9t0VYzJsu8qrPwE',
    appId: '1:939954730010:ios:8e6619140c7416e8c00da3',
    messagingSenderId: '939954730010',
    projectId: 'wingsandthingspizza-4d6fc',
    databaseURL: 'https://wingsandthingspizza-4d6fc-default-rtdb.firebaseio.com',
    storageBucket: 'wingsandthingspizza-4d6fc.appspot.com',
    androidClientId: '939954730010-217263fgk1p6qgf5vqrn6dkf70mntk06.apps.googleusercontent.com',
    iosClientId: '939954730010-p4q3v514csamfcqg0vctqgfn22rkcibk.apps.googleusercontent.com',
    iosBundleId: 'com.example.pizzaUserApp',
  );
}
