class EstoqueModel {
  final String descricao;
  final int quantidade;
  final double preco;

  EstoqueModel._(
      {required this.descricao, required this.quantidade, required this.preco});

  factory EstoqueModel(
      {required String descricao,
      required int quantidade,
      required double preco}) {
    if (descricao.isEmpty) {
      throw Exception("Descrição is empty");
    }
    if (quantidade < 0) {
      throw Exception("Quantidade is negative");
    }
    if (preco <= 0) {
      throw Exception("Preço is negative or zero");
    }

    return EstoqueModel._(
        descricao: descricao, quantidade: quantidade, preco: preco);
  }
}
