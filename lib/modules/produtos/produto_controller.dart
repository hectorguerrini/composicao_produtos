import 'package:composicao_produtos/modules/estoque/estoque_model.dart';
import 'package:composicao_produtos/modules/produtos/produto_model.dart';
import 'package:composicao_produtos/modules/produtos/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core.dart';
import '../estoque/estoque_repository.dart';

class ProdutoController {
  final ProdutoRepository _repository;
  final EstoqueRepository _estoqueRepository;
  ProdutoController(this._repository, this._estoqueRepository) {
    getLista();
    getListaEstoque();
  }
  List<ProdutoModel> lista = [];
  List<EstoqueModel> listaEstoque = [];

  void getLista() {
    lista = _repository.getListaProduto();
  }

  void getListaEstoque() {
    listaEstoque = _estoqueRepository.getListaEstoque();
  }

  void addProduto(String nome, List<EstoqueModel> materiaPrima, double preco) {
    try {
      var value =
          ProdutoModel(nome: nome, materiaPrima: materiaPrima, preco: preco);
      _repository.addProduto(value);
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
