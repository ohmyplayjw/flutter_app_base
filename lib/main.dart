import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'common/data/preference/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyD8iDmjGctGwK-d1z4Fb_K4Ok5M75GH8k8',
    appId: '1:749101739796:web:9f03f3e2830b295c401c01',
    messagingSenderId: '749101739796',
    projectId: 'scoreboardtablet',
    authDomain: 'scoreboardtablet.firebaseapp.com',
    databaseURL: 'https://scoreboardtablet.firebaseio.com',
    storageBucket: 'scoreboardtablet.appspot.com',
    measurementId: 'G-QMJ6G3L3SL',
  ));
  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();

  runApp(ProviderScope(
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ko')],
        fallbackLocale: const Locale('ko'),
        path: 'assets/translations',
        useOnlyLangCode: true,
        child: const App()),
  ));
}
