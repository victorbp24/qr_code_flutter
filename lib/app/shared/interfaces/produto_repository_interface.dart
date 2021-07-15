import 'package:desafio_qr_code/app/shared/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> getLivros();
}
