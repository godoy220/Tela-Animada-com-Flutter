import 'package:flutter/material.dart';
import 'screens/galeria_screen.dart';

void main() {
  runApp(const GaleriaApp());
}

class GaleriaApp extends StatelessWidget {
  const GaleriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria de Animações',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Requisito 4: Habilitar Material Design 3 com ColorScheme.fromSeed
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: const GaleriaScreen(),
    );
  }
}