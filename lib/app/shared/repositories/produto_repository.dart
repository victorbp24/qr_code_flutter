import 'dart:convert';

import 'package:desafio_qr_code/app/shared/interfaces/produto_repository_interface.dart';
import 'package:desafio_qr_code/app/shared/models/produto_model.dart';
import 'package:http/http.dart' as http;

class ProdutoRepository implements IProdutoRepository {
  final String url;

  ProdutoRepository({required this.url});

  @override
  Future<List<ProdutoModel>> getLivros() async {
    var urlParse = Uri.parse(this.url);

    var response = await http.get(urlParse);
    print('GET LIST');

    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
    var decode;
    final List<ProdutoModel> list = [];
    if (response.statusCode == 200) {
      decode = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      for (var json in decode) {
        final model = ProdutoModel.fromJson(json);
        list.add(model);
      }
    }

    return list;
  }
}
