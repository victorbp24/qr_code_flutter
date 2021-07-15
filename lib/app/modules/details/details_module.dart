import 'package:desafio_qr_code/app/modules/details/details_Page.dart';
import 'package:desafio_qr_code/app/modules/details/details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailsStore(produtoModel: i.args!.data)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DetailsPage()),
  ];
}
