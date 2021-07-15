import 'package:desafio_qr_code/app/shared/models/produto_model.dart';
import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;
abstract class _DetailsStoreBase with Store {

  
  ProdutoModel ? produtoModel;

  _DetailsStoreBase({this.produtoModel});

  
}