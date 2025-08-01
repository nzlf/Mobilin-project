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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCm4eCr0lfe60kmzjcFAxH4GVtsMGSx6z4',
    appId: '1:937771714517:android:ec3f3a37a06208e7e45f5c',
    messagingSenderId: '937771714517',
    projectId: 'mobilin-project-4726a',
    storageBucket: 'mobilin-project-4726a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXkfaEcT7aywUrmscZx8fwOrfo_vy0QS8',
    appId: '1:937771714517:ios:b81b53534dc1da97e45f5c',
    messagingSenderId: '937771714517',
    projectId: 'mobilin-project-4726a',
    storageBucket: 'mobilin-project-4726a.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static Future<void> initializeApp({required FirebaseOptions options}) async {}

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCeaUmcV8-4SA0h_Y53_mIUZ3zunHXEAT0',
    appId: '1:937771714517:web:02eff06b66a9bbdde45f5c',
    messagingSenderId: '937771714517',
    projectId: 'mobilin-project-4726a',
    authDomain: 'mobilin-project-4726a.firebaseapp.com',
    storageBucket: 'mobilin-project-4726a.firebasestorage.app',
    measurementId: 'G-HX1G4SGEWV',
  );

}