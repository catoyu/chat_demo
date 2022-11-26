import 'package:chat_demo/Proceso/autenticacion.dart';
import 'package:chat_demo/UI/chat.dart';
import 'package:chat_demo/UI/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const FlexScheme usedFlexScheme = FlexScheme.deepBlue;

    return MaterialApp(
      title: 'Conecta2 Demo',
      theme: FlexColorScheme.light(
        scheme: usedFlexScheme,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: usedFlexScheme,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'CONECTA2'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Autenticacion().estadoLogin,
        builder: (context, respuesta) {
          if (respuesta.hasData) {
            return chat();
          } else {
            return login();
            //login();
          }
        });
  }
}
