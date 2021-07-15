import 'package:desafio_qr_code/app/shared/models/produto_model.dart';
import 'package:desafio_qr_code/app/shared/repositories/produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<ProdutoModel> ? list;

  @action
  Future<void> getListLivros() async {
    ProdutoRepository repository = ProdutoRepository(url: 'https://libgen.rs/json.php?ids=1,2,3,4,5,6,7,8,9,10&fields=Title,Author,Year,Language');
  
    list = await repository.getLivros();
  
  }

  HomeStoreBase(){
    getListLivros();
  }
}