import 'package:composicao_produtos/modules/estoque/estoque_model.dart';

class EstoqueRepository {
  List<EstoqueModel> _listaEstoque = [];
  EstoqueRepository({List<EstoqueModel>? listaEstoque}) {
    if (listaEstoque != null) {
      _listaEstoque = listaEstoque;
    }
  }

  void addEstoque(EstoqueModel value) {
    _listaEstoque.add(value);
  }

  List<EstoqueModel> getListaEstoque() {
    return _listaEstoque;
  }
}
