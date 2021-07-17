import 'package:flutter_modular/flutter_modular.dart';

import 'features/presenter/home/home_controller.dart';
import 'features/presenter/home/home_page.dart';
import 'features/presenter/sobre/sobre_page.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => HomePage()),
        ChildRoute("/sobre", child: (_, __) => SobrePage()),
      ];
}
