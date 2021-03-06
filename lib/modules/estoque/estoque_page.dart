import 'package:composicao_produtos/modules/estoque/estoque_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({Key? key}) : super(key: key);

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  final EstoqueController _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
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
            title: Text(value.descricao),
            subtitle: Text('Qtde:${value.quantidade} R\$ ${value.preco}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/estoque/cadastro');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
