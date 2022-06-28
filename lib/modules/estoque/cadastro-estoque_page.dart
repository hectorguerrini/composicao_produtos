import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'estoque_controller.dart';

class CadastroEstoquePage extends StatelessWidget {
  CadastroEstoquePage({Key? key}) : super(key: key);
  final EstoqueController _controller = Modular.get();
  final TextEditingController _descricaoCtrl = TextEditingController(text: '');
  final TextEditingController _quantidadeCtrl =
      TextEditingController(text: '0');
  final TextEditingController _precoCtrl = TextEditingController(text: '0.0');
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _descricaoCtrl,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _quantidadeCtrl,
                decoration: const InputDecoration(labelText: 'Quantidade'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _precoCtrl,
                decoration: const InputDecoration(labelText: 'Preço'),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  _controller.addEstoque(
                      _descricaoCtrl.text,
                      int.parse(_quantidadeCtrl.text),
                      double.parse(_precoCtrl.text));
                },
                child: const Text('Estoque'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
