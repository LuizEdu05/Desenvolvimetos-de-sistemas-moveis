import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // AppBar escura
        title: const Text(
          'Minha Página',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/25/25231.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Olá, Luiz Eduardo!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              '!Programmer!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thumb_up, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Trabalho de Flutter Chefe',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}