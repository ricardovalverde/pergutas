import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/resposta.dart';
import 'package:perguntas/resultado.dart';

class Questionario extends StatelessWidget {
  Questionario(this._questionsSelected, this.responder, {Key? key}) : super(key: key);

  bool get _showQuestion {
    return _questionsSelected < _questionsAndResponses.length;
  }

  final _questionsAndResponses = const [
    {
      'pergunta': 'Qual sua cor favorita?',
      'respostas': [
        {'resposta': 'Azul', 'nota': 8},
        {'resposta': 'Roxo', 'nota': 6},
        {'resposta': 'Amarelo', 'nota': 4},
        {'resposta': 'Preto', 'nota': 10},
        {'resposta': 'Lilás', 'nota': 7},
      ]
    },
    {
      'pergunta': 'Qual seu animal favorito ?',
      'respostas': [
        {'resposta': 'Cavalo', 'nota': 9},
        {'resposta': 'Onça', 'nota': 10},
        {'resposta': 'Jacaré', 'nota': 8},
        {'resposta': 'Águia', 'nota': 7},
        {'resposta': 'Pavão', 'nota': 6},
      ]
    },
    {
      'pergunta': 'Qual seu instrutor favorito ?',
      'respostas': [
        {'resposta': 'Huguinho', 'nota': 10},
        {'resposta': 'Zezinho', 'nota': 5},
        {'resposta': 'Luizinho', 'nota': 6},
        {'resposta': 'Juninho', 'nota': 7},
      ]
    },
  ];
  final int _questionsSelected;
  void Function() responder;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> responses = (_showQuestion
        ? _questionsAndResponses[_questionsSelected]['respostas'] as List<Map<String, Object>>
        : []) ;

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

  List<Resposta> showResponse(List<Map<String, Object>> respostas, void Function()
  responder) {
    return respostas.map((resposta) => Resposta(resposta['resposta'].toString(), responder)).toList();
  }
}
