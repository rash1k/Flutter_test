import 'package:flutter/material.dart';
import 'package:flutter_app_test/data/entity/cards.dart';

void main() {
  runApp(MyApp());
}

final responseData = [
  {
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HeAGHxsU59NboZMUGVv1brzAkPZDj635WR2ksbN66Sp92AlD&s',
    'title': 'Lorem ipsum',
    'description': 'dolor sit amet'
  },
  {
    'image': 'https://miro.medium.com/max/3200/1*QBxc5-QaDrLZV9VPHcqG0Q.png',
    'title': 'Lorem ipsum',
    'description': 'dolor sit amet'
  },
  {
    'image':
        'https://abduzeedo.com/sites/default/files/styles/home_cover/public/originals/06993c70009113.5b9573e708e46.png?itok=Xpr1snbS',
    'title': 'Lorem ipsum',
    'description': 'dolor sit amet'
  },
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  static List<Cards> data = [
    Cards(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HeAGHxsU59NboZMUGVv1brzAkPZDj635WR2ksbN66Sp92AlD&s',
        'Lorem ipsum',
        'dolor sit amet'),
  ];

  Widget _createCardItem(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    final title = responseData[index]['title'];
    final description = responseData[index]['description'];
    final image = responseData[index]['image'];

    return Container(
      height: 150,
      width: 200,
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
        margin: EdgeInsets.fromLTRB(20, 50, 20, 70),
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
    );
  }

  void _onButtonPress() {
    print('Clicked');
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
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ListView.builder(
//                itemExtent: 100,
                  itemCount: responseData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _createCardItem),
            )
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
