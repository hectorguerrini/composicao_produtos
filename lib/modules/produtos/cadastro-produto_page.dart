import 'package:composicao_produtos/modules/estoque/estoque_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_controller.dart';

class CadastroProdutoPage extends StatefulWidget {
  const CadastroProdutoPage({Key? key}) : super(key: key);

  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final ProdutoController _controller = Modular.get();

  final TextEditingController _nomeCtrl = TextEditingController(text: '');

  final TextEditingController _precoCtrl = TextEditingController(text: '0.0');

  final List<EstoqueModel> estoque = [];
  static String _displayStringForOption(EstoqueModel option) =>
      option.descricao;
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
                controller: _nomeCtrl,
                decoration: const InputDecoration(labelText: 'Nome Produto'),
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
              Autocomplete<EstoqueModel>(
                displayStringForOption: _displayStringForOption,
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<EstoqueModel>.empty();
                  }
                  return _controller.listaEstoque.where((EstoqueModel option) {
                    return option.descricao
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (EstoqueModel selection) {
                  setState(() {
                    estoque.add(selection);
                  });
                },
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                  itemCount: estoque.length,
                  itemBuilder: (context, index) {
                    if (estoque.isEmpty) {
                      return const Center(
                        child: Text('Nenhuma materia prima adicionada'),
                      );
                    }
                    var value = estoque[index];
                    return ListTile(
                      title: Text(value.descricao),
                      subtitle: Text('R\$ ${value.preco}'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  _controller.addProduto(
                      _nomeCtrl.text, estoque, double.parse(_precoCtrl.text));
                },
                child: const Text('Salvar Produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
