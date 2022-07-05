import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _resposta;
  final void Function() _onSelected;

  Resposta(this._resposta, this._onSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _onSelected,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                primary: Colors.pink,
                fixedSize: const Size(200, 50)),
            child: Text(_resposta),
          ),
        ],
      ),
    );
  }
}
