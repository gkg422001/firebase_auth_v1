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
    apiKey: 'AIzaSyC8dxsyU_0TU5rJTmIrhO-e40muckxy7uA',
    appId: '1:884427393537:web:3e6a8fc1cf43ab3b800e00',
    messagingSenderId: '884427393537',
    projectId: 'fir-auth-5fde7',
    authDomain: 'fir-auth-5fde7.firebaseapp.com',
    storageBucket: 'fir-auth-5fde7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnUed0DNuTX3HMNmMdN_VEphJlk8P6AtU',
    appId: '1:884427393537:android:8a7cb58ae07bcf01800e00',
    messagingSenderId: '884427393537',
    projectId: 'fir-auth-5fde7',
    storageBucket: 'fir-auth-5fde7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsXCIX7WSqObwiszpBPNWBHqWIbQ7Z5Xs',
    appId: '1:884427393537:ios:dfb2d51675b3cf4a800e00',
    messagingSenderId: '884427393537',
    projectId: 'fir-auth-5fde7',
    storageBucket: 'fir-auth-5fde7.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsXCIX7WSqObwiszpBPNWBHqWIbQ7Z5Xs',
    appId: '1:884427393537:ios:dfb2d51675b3cf4a800e00',
    messagingSenderId: '884427393537',
    projectId: 'fir-auth-5fde7',
    storageBucket: 'fir-auth-5fde7.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC8dxsyU_0TU5rJTmIrhO-e40muckxy7uA',
    appId: '1:884427393537:web:b22032b63506ce69800e00',
    messagingSenderId: '884427393537',
    projectId: 'fir-auth-5fde7',
    authDomain: 'fir-auth-5fde7.firebaseapp.com',
    storageBucket: 'fir-auth-5fde7.appspot.com',
  );
}
