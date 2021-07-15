import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.list == null || store.list!.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    "My books",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: store.list!.length,
                          
                          itemBuilder: (context, index) {
                            final model = store.list![index];
                            return Container(
                              child: Column(
                                children: [
                                  Text(
                                    model.title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  QrImage(
                                    data: model.title,
                                    version: QrVersions.auto,
                                    size: 200.0,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    child: TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                        ),
                                        onPressed: () {
                                          Modular.to.pushNamed('/details',
                                              arguments: model);
                                        },
                                        child: Text(
                                          'VER MAIS',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
