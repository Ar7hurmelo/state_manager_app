import 'package:flutter_modular/flutter_modular.dart';

import 'ui/pages/free_page.dart';

class FreeModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child("/", child: (_) => FreePage());
  }
}
