import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_qr_code/app/modules/details/details_store.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  const DetailsPage({Key? key, this.title = 'DetailsPage'}) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  final DetailsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              store.produtoModel!.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            QrImage(
              data: store.produtoModel!.title,
              version: QrVersions.auto,
              size: 250.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Autor: ${store.produtoModel!.author}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Linguagem: ${store.produtoModel!.language}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Ano: ${store.produtoModel!.year}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
