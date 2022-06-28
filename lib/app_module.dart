import 'package:composicao_produtos/modules/estoque/estoque_module.dart';
import 'package:composicao_produtos/modules/estoque/estoque_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => EstoqueRepository())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute('/estoque', module: EstoqueModule())
      ];
}
