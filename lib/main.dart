import 'package:flutter/material.dart';
import 'package:flutter_app_test/data/entity/cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  static List<Cards> data = [
    Cards(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HeAGHxsU59NboZMUGVv1brzAkPZDj635WR2ksbN66Sp92AlD&s',
        'Lorem ipsum',
        'dolor sit amet'),
    Cards(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HeAGHxsU59NboZMUGVv1brzAkPZDj635WR2ksbN66Sp92AlD&s',
        'Lorem ipsum',
        'dolor sit amet'),
    Cards(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HeAGHxsU59NboZMUGVv1brzAkPZDj635WR2ksbN66Sp92AlD&s',
        'Lorem ipsum',
        'dolor sit amet'),

//    {
//      'image': 'https://miro.medium.com/max/3200/1*QBxc5-QaDrLZV9VPHcqG0Q.png',
//      'title': 'Lorem ipsum',
//      'description': 'dolor sit amet'
//    },
//    {
//      'image': 'https://abduzeedo.com/sites/default/files/styles/home_cover/public/originals/06993c70009113.5b9573e708e46.png?itok=Xpr1snbS',
//      'title': 'Lorem ipsum',
//      'description': 'dolor sit amet'
//    },
  ];

  void _populateCards() {}

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onButtonPress() {
    print('Clicked');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
        child: SingleChildScrollView(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                  'https://cdn.dribbble.com/users/65767/screenshots/4935267/peter_deltondo_unfold_crowdrise_gofundme_pricing_illustrations.gif'),
              Row(children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                )
              ]),
            ],
          ),
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
