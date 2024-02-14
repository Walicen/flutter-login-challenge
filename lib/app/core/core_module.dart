import 'package:flutter_modular/flutter_modular.dart';

import 'http/custom_http.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<CustomHttp>(CustomHttpImpl.new);
  }
}
