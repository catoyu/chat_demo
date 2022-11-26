import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UI/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCfuCdnwFqZlWlNd9KTk7UyneU4XeUuzMc",
          authDomain: "chat-demo-3c662.firebaseapp.com",
          projectId: "chat-demo-3c662",
          storageBucket: "chat-demo-3c662.appspot.com",
          messagingSenderId: "106507247405",
          appId: "1:106507247405:web:555b1135c61b2461777da4",
          measurementId: "G-NEDNZB0DL9"));
  runApp(const MyApp());
}
