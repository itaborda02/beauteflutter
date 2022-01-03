import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  String get name => 'foo';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: '1:288082576818:android:1a4ca72b28306f59aed0ab',
        apiKey: 'AIzaSyDAmy3xuslu6K4c39imJtnwNRTYE0Ul834',
        projectId: 'flutter-login-a58bc',
        messagingSenderId: '288082576818',
      );

  Future<void> initializeDefault() async {
    var DefaultFirebaseConfig;
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platformOptions,
    );
    print('Initialized default app $app');
  }

  Future<void> initializeSecondary() async {
    FirebaseApp app =
        await Firebase.initializeApp(name: name, options: firebaseOptions);

    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final options = app.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);
    await app.delete();
    print('App $name deleted');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Core example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: initializeDefault,
                child: const Text('Initialize default app'),
              ),
              ElevatedButton(
                onPressed: initializeSecondary,
                child: const Text('Initialize secondary app'),
              ),
              ElevatedButton(
                onPressed: apps,
                child: const Text('Get apps'),
              ),
              ElevatedButton(
                onPressed: options,
                child: const Text('List options'),
              ),
              ElevatedButton(
                onPressed: delete,
                child: const Text('Delete app'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}