import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Imagens Aleatórias One Piece'),
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
  final Random _random = Random();
  final int _totalImages = 294; // Número total de imagens
  String _currentImage =
      'assets/images/One Piece_001.jpg'; // Começa com a primeira imagem
  int _counter = 0;

  void _changeImage() {
    setState(() {
      int randomIndex = _random.nextInt(_totalImages) + 1;
      String imageNumber = randomIndex.toString().padLeft(
        3,
        '0',
      ); // Garante 3 dígitos (ex: 001, 002...)
      _currentImage = 'assets/images/One Piece_$imageNumber.jpg';
      _counter++; // Incrementa o contador de apertos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _currentImage,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Você apertou o botão $_counter vezes',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeImage,
              child: const Text('Trocar Imagem'),
            ),
          ],
        ),
      ),
    );
  }
}
