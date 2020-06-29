import 'package:flutter/material.dart';

void main() {
  runApp(

    GridViewList(),
    
    //LongList(items: List<String>.generate(100, (index) => "Item $index"),)

  //   ItemList(
  //   items: List<ListItem>.generate(100, (index) => index % 6 == 0 
  //   //count =100
  //   ? HeadingItem("Heading $index")//if even>> separate 5
  //   : PersonItem("First name $index", "Last name $index")//else odd
  //   ),
  // )

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple List'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: HorizontalList(),
          // ListView(
          //   scrollDirection: Axis.horizontal,//horizontallist view

          //   children: <Widget>[
          //     ListTile(
          //       leading: Icon(Icons.map),
          //       title: Text('Map'),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.photo),
          //       title: Text('Album'),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.alarm),
          //       title: Text('Alarm'),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal List View'),
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 30,
                width: 100,
                color: Colors.blue,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.black,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.purple,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<ListItem> items; //add data to list from constructor//all are implements listitem

  ItemList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lists'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];//array[0] >> first name, last name, heading
              return ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubTitle(context),
                onTap: (){},
              );
            }),
      ),
    );
  }
}

abstract class ListItem {
  //custom listtile as widget
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildSubTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headline3,);
  }
}

class PersonItem implements ListItem {
  final String firstName;
  final String lastName;

  PersonItem(this.firstName, this.lastName);

  @override
  Widget buildSubTitle(BuildContext context) => Text(lastName);

  @override
  Widget buildTitle(BuildContext context) => Text(firstName); //constructor
}

class LongList extends StatelessWidget{

  final List <String> items;

  LongList({
    Key key, 
    @required this.items
  }): super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
      title : Text('Long List')
    ),
    body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text('${items[index]}'),
        );
      }),
    ),
    );
  }

}

class GridViewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title:  Text('Grid View'),
          ),
          body: GridView.count(
            scrollDirection: Axis.horizontal,//Row
            crossAxisCount: 3,
          children: List.generate(100, (index) {
            return Center(
              child: Text('Item $index'),

            );
          })
          ),
          
      )
    );
  }

}