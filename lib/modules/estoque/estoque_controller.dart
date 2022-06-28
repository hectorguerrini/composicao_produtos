import 'package:composicao_produtos/modules/estoque/estoque_model.dart';
import 'package:composicao_produtos/modules/estoque/estoque_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core.dart';

class EstoqueController {
  final EstoqueRepository _repository;

  EstoqueController(this._repository) {
    getLista();
  }

  List<EstoqueModel> lista = [];

  void getLista() {
    lista = _repository.getListaEstoque();
  }

  void addEstoque(String descricao, int quantidade, double preco) {
    try {
      var value = EstoqueModel(
          descricao: descricao, quantidade: quantidade, preco: preco);
      _repository.addEstoque(value);
      scaffoldKey.currentState?.showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Item cadastrado'),
        duration: Duration(seconds: 2),
      ));

      Modular.to.navigate('/');
    } on Exception catch (e) {
      scaffoldKey.currentState?.showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
