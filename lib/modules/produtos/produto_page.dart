import 'package:composicao_produtos/modules/produtos/produto_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({Key? key}) : super(key: key);

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  final ProdutoController _controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1,
        ),
        itemCount: _controller.lista.length,
        itemBuilder: (context, index) {
          if (_controller.lista.isEmpty) {
            return const Center(
              child: Text('Nenhuma materia prima cadastrada'),
            );
          }
          var value = _controller.lista[index];
          return ListTile(
            title: Text(value.nome),
            subtitle: Text('R\$ ${value.preco}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/produto/cadastro');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
