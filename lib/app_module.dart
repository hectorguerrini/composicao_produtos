import 'package:composicao_produtos/modules/estoque/estoque_module.dart';
import 'package:composicao_produtos/modules/estoque/estoque_repository.dart';
import 'package:composicao_produtos/modules/produtos/produto_module.dart';
import 'package:composicao_produtos/modules/produtos/produto_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => EstoqueRepository()),
        Bind.singleton((i) => ProdutoRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute('/estoque', module: EstoqueModule()),
        ModuleRoute('/produto', module: ProdutoModule())
      ];
}
