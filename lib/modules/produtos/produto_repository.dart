import 'produto_model.dart';

class ProdutoRepository {
  List<ProdutoModel> _listProdutos = [];

  ProdutoRepository({List<ProdutoModel>? listaProdutos}) {
    if (listaProdutos != null) {
      _listProdutos = listaProdutos;
    }
  }

  void addProduto(ProdutoModel value) {
    _listProdutos.add(value);
  }

  List<ProdutoModel> getListaProduto() {
    return _listProdutos;
  }
}
