import '../estoque/estoque_model.dart';

class ProdutoModel {
  final String nome;
  final List<EstoqueModel> materiaPrima;
  final double preco;

  ProdutoModel._(
      {required this.nome, required this.materiaPrima, required this.preco});

  factory ProdutoModel(
      {required String nome,
      required List<EstoqueModel> materiaPrima,
      required double preco}) {
    if (nome.isEmpty) {
      throw Exception("Nome is empty");
    }
    if (materiaPrima.isEmpty) {
      throw Exception("Materia Prima is empty");
    }
    if (preco <= 0) {
      throw Exception("Preço is negative or zero");
    }
    return ProdutoModel._(nome: nome, materiaPrima: materiaPrima, preco: preco);
  }
}
