import 'package:composicao_produtos/modules/estoque/cadastro-estoque_page.dart';
import 'package:composicao_produtos/modules/estoque/estoque_controller.dart';
import 'package:composicao_produtos/modules/estoque/estoque_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EstoqueModule extends Module {
  @override
  List<Bind> get binds => [Bind.lazySingleton((i) => EstoqueController(i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const EstoquePage(),
        ),
        ChildRoute(
          '/cadastro',
          child: (context, args) => CadastroEstoquePage(),
        ),
      ];
}
