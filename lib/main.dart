import 'package:flutter/material.dart';
import 'package:flutter_app_test/data/entity/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_app_test/router/router.dart';
import 'ui/card/products_screen.dart';

void main() {
  runApp(MyApp());
}

final responseData = [
  {
    'id': '0',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HeAGHxsU59NboZMUGVv1brzAkPZDj635WR2ksbN66Sp92AlD&s',
    'title': 'Lorem ipsum',
    'description': 'dolor sit amet'
  },
  {
    'id': '1',
    'image':
        'https://abduzeedo.com/sites/default/files/styles/home_cover/public/originals/06993c70009113.5b9573e708e46.png?itok=Xpr1snbS',
    'title': 'Lorem ipsum',
    'description': 'dolor sit amet'
  },
  {
    'id': '2',
    'image': 'https://miro.medium.com/max/3200/1*QBxc5-QaDrLZV9VPHcqG0Q.png',
    'title': 'Lorem ipsum',
    'description': 'dolor sit amet'
  },
];

var data;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: 'home',
      onGenerateRoute: generateRoutes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String pageDescription =
      'Lorem ipsum dolor sit amet, dolor sit amet Lorem '
      'ipsum dolor sit am ipsum dolor sit amet, dolor sit amet';

  void _onButtonPress() {
    print('Clicked');
  }

  void _navigateToScreen(data) {
    final String id = data['id'];
    print('another screen $id');
    Navigator.pushNamed(context, 'card-view', arguments: id);
  }

  Widget _buildCardsListHorisontal(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('cards').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    data = snapshot;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.length,
      itemBuilder: _createCardItem,
    );
  }

  Widget _createCardItem(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    final card = data[index];
    final cardId = card['id'];
    final title = card['title'];
    final description = card['description'];
    final image = card['image'];

    return Container(
      height: 150,
      width: 200,
      child: GestureDetector(
        onTap: () => _navigateToScreen(card),
        child: Card(
          elevation: 5,
          semanticContainer: true,
          color: Colors.black,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: const Radius.circular(50.0),
                topLeft: const Radius.circular(4),
                bottomRight: const Radius.circular(4),
                bottomLeft: const Radius.circular(50.0)),
          ),
          margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Center(
//                heightFactor: 0,
                    child: Column(
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center),
                    Text(description, style: TextStyle(color: Colors.white54))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
////        leading: Row(
////        children: <Widget>[
////          FloatingActionButton: FloatingActionButton.extended(onPressed: null, label: null)
////        ],
////        ),
//      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
                'https://cdn.dribbble.com/users/65767/screenshots/4935267/peter_deltondo_unfold_crowdrise_gofundme_pricing_illustrations.gif'),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              child:
                  Text(pageDescription, style: TextStyle(color: Colors.white)),
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: _buildCardsListHorisontal(context))
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: FloatingActionButton.extended(
            onPressed: _onButtonPress,
            elevation: 10.0,
            label: Text('Menu'),
            icon: Icon(Icons.menu)),
      ),
    );
  }
}

//class CardsList {
//  final String title;
//  final String description;
//  final String image;
//  final List<Card> listWithCards;
//
//  CardsList.mapCards(Map<String, dynamic> data)
//      : assert(data['title'] != null),
//        assert(data['description'] != null),
//        assert(data['image'] != null),
//        title = data['title'],
//        description = data['description'],
//        image = data['image'];
//
//  listWithCards.add(Card(title, description, image));
//
//}
