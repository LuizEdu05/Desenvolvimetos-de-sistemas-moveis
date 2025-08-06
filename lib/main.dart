import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _historico = [];

  void _salvarTexto() {
    final texto = _controller.text.trim();
    if (texto.isNotEmpty) {
      setState(() {
        _historico.insert(0, texto);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Minha Página',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Parte superior: avatar + texto + row
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage('https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Olá, Luiz Eduardo!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        '!Programmer!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Caixa de input
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Digite algo...',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Botão salvar
            ElevatedButton(
              onPressed: _salvarTexto,
              child: const Text('Salvar'),
            ),

            const SizedBox(height: 24),

            // Histórico
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Histórico:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

            // Lista de histórico
            Expanded(
              child: _historico.isEmpty
                  ? const Text(
                      'Nenhuma entrada salva.',
                      style: TextStyle(color: Colors.white70),
                    )
                  : ListView.builder(
                      itemCount: _historico.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.grey[800],
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(
                              _historico[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}