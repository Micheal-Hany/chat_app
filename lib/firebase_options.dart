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
    apiKey: 'AIzaSyCZPo01B0yiQ9DMFQqBKNwhJNFGSHl0gE4',
    appId: '1:723195787505:web:e59180f446c68caf7fd150',
    messagingSenderId: '723195787505',
    projectId: 'chat-app-14dc3',
    authDomain: 'chat-app-14dc3.firebaseapp.com',
    storageBucket: 'chat-app-14dc3.appspot.com',
    measurementId: 'G-Y19CNMTGYT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxAd23beiZV2AUYeGKYEW0jfvlrzl-Z2U',
    appId: '1:723195787505:android:c59a2ae3673016427fd150',
    messagingSenderId: '723195787505',
    projectId: 'chat-app-14dc3',
    storageBucket: 'chat-app-14dc3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMtk2JH7VTBrUEErimZXvMn6mB8rznrBM',
    appId: '1:723195787505:ios:188036ced40577757fd150',
    messagingSenderId: '723195787505',
    projectId: 'chat-app-14dc3',
    storageBucket: 'chat-app-14dc3.appspot.com',
    iosClientId: '723195787505-l2rd6vcdtqers696o88vovqreuihplp1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMtk2JH7VTBrUEErimZXvMn6mB8rznrBM',
    appId: '1:723195787505:ios:63b9f8ebf07815e17fd150',
    messagingSenderId: '723195787505',
    projectId: 'chat-app-14dc3',
    storageBucket: 'chat-app-14dc3.appspot.com',
    iosClientId: '723195787505-880ikajmqg1ppvjdg7it5g2hoa3pe0aj.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}