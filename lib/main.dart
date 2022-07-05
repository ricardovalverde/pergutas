import 'package:flutter/material.dart';
import './questionario.dart';

main() => runApp(const _PerguntaApp());

class _PerguntaAppState extends State<_PerguntaApp> {
  void _responder() {
    setState(() {
      _positionSelected++;
    });
  }

  int _positionSelected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue.shade50,
            appBar: AppBar(
              title: const Text("Perguntas"),
              centerTitle: true,
            ),
            body: Questionario(_positionSelected, _responder)));
  }
}

class _PerguntaApp extends StatefulWidget {
  const _PerguntaApp({Key? key}) : super(key: key);

  @override
  State<_PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
