import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/login_page.dart';

/// Clase principal de la aplicación
/// Se encarga de inicializar la app y definir el tema principal.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

/// Estado de la clase `MyApp`.
///
/// Se encarga de gestionar el estado y cargar los datos desde un archivo JSON.
class _MyAppState extends State<MyApp> {
  Map<String, dynamic>? _jsonStrings;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  /// Carga el archivo JSON desde la carpeta de assets.
  ///
  /// Esta función lee el archivo JSON y actualiza el estado de la aplicación
  /// con las cadenas de texto.
  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/es.json');
    setState(() {
      _jsonStrings = jsonDecode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_jsonStrings == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      locale: const Locale('es', 'ES'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: _jsonStrings!['app_title'],
      theme: ThemeData(
        //Aquí se declara la fuente para toda la aplicación
        fontFamily: 'FontRoboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 60, 196, 255)),
        useMaterial3: true,
      ),
      home: MyHomePage( jsonStrings: _jsonStrings!),
    );
  }
}
