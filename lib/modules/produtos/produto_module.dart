import 'package:composicao_produtos/modules/produtos/produto_controller.dart';
import 'package:composicao_produtos/modules/produtos/produto_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro-produto_page.dart';

class ProdutoModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind.lazySingleton((i) => ProdutoController(i(), i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ProdutoPage(),
        ),
        ChildRoute(
          '/cadastro',
          child: (context, args) => CadastroProdutoPage(),
        ),
      ];
}
