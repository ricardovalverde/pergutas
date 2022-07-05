import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/resposta.dart';
import 'package:perguntas/resultado.dart';

class Questionario extends StatelessWidget {
  Questionario(this._questionsSelected, this.responder, {Key? key}) : super(key: key);

  bool get _showQuestion {
    return _questionsSelected < _questionsAndResponses.length;
  }

  final List<Map<String, Object>> _questionsAndResponses = [
    {
      'pergunta': 'Qual sua cor favorita?',
      'resposta': ['Azul', 'Roxo', 'Amarelo', 'Preto']
    },
    {
      'pergunta': 'Qual seu animal favorito ?',
      'resposta': ['Cavalo', 'Leão', 'Onça', 'Águia']
    },
    {
      'pergunta': 'Qual seu instrutor favorito ?',
      'resposta': ['Huguinho', 'Zezinho', 'Joãozinho', 'Luizinho']
    },
  ];
  final int _questionsSelected;
  void Function() responder;

  @override
  Widget build(BuildContext context) {
    List<String> responses =
        _showQuestion ? _questionsAndResponses[_questionsSelected]['resposta'] as List<String> : [];

    return _showQuestion
        ? Column(
            children: [
              Questao(_convertToString(
                  _questionsAndResponses[_questionsSelected]['pergunta'] as Object)),
              ...showResponse(responses, responder)
            ],
          )
        : const Resultado();
  }

  String _convertToString(Object list) => list.toString();

  List<Resposta> showResponse(List<String> respostas, void Function() responder) {
    return respostas.map((resposta) => Resposta(resposta, responder)).toList();
  }
}
