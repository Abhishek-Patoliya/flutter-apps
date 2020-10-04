import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Api Failed to load album');
  }
}

class Album {
  final int id;
  final String email;
final String title;



  Album({this.email, this.id,this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        email: json['email'],
      title:json['title'],
    );
  }
}

class ListViewGridView extends StatefulWidget {
  @override
  _ListViewGridViewState createState() => _ListViewGridViewState();
}

class _ListViewGridViewState extends State<ListViewGridView>
    with TickerProviderStateMixin {
  TabController tabController;

  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);

//    2 button

    var tabBarItem = TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.list),
        ),
        Tab(
          icon: Icon(Icons.grid_on),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.green,
    );

//    ListView Builder

    var listItem = ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Card(
            elevation: 5.0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),

//   Click Event

          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                child: CupertinoAlertDialog(
                  title: Column(
                    children: <Widget>[
                      Text("ListView"),
                      Icon(
                        Icons.favorite,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                  content: Text("Selected Item $index"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"))
                  ],
                ));
          },
        );
      },
    );

    //gridview

    var gridView = GridView.builder(
        itemCount: 20,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              elevation: 5.0,
              child: Container(
                alignment: Alignment.center,
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                child: CupertinoAlertDialog(
                  title: Column(
                    children: <Widget>[
                      Text("GridView"),
                      Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: Text("Selected Item $index"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"))
                  ],
                ),
              );
            },
          );
        });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(tabBarItem.preferredSize.height - 50),
            child: tabBarItem,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            listItem,
            gridView,
          ],
        ),
      ),
    );
  }
}
