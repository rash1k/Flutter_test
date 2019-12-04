import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const CARD_VIEW = 'card-view';

  final String id;

  const ProductsScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final String data = ModalRoute.of(context).settings.arguments;
    print('Card view of card $id');

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text('Card view of card $id'),
    ));
  }
}
