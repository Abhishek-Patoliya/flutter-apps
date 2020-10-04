import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import './image_screen.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];



void main() => runApp(MaterialApp(home: Demo()));

class Demo extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Demo> {
  _launchURL() async {
    const url = 'https://wa.me/918000053398';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

      }_launchURL0() async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL1() async {
    const url = 'https://www.youtube.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = 'https://www.facebook.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL3() async {
    const url = 'https://www.instagram.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL4() async {
    const url = 'https://www.paytm.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL5() async {
    const url = 'https://www.amazon.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL6() async {
    const url = 'https://www.flipkart.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: CarouselSlider(
                    items: imgList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: GestureDetector(
                                  child: Image.network(
                                    i,
                                    fit: BoxFit.fill,
                                  ),

                                  // child: Image.network(i, fit: BoxFit.fill),
                                  onTap: () {
                                    Navigator.push<Widget>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ImageScreen(i),
                                      ),
                                    );
                                  }));
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Divider(
                  color: Colors.redAccent,
                  thickness: 2.0,
                ),
                Container(
                  height: 200,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    children: List.generate(50, (index) {
                      return Container(
                        child: Card(
                          child: Image.asset(
                              'assets/images/drawer_header_background.png'),
                        ),
                      );
                    }),
                  ),
                ),
                Divider(
                  color: Colors.redAccent,
                  thickness: 2.0,
                ),
                Container(
                  height: 44.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[

                      //1

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

          onPressed: _launchURL,


                        child: Text("WhatsApp"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),
 RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL0,
                        child: Text("Google"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),

                     //2

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL1,
                        child: Text("Youtube"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),

                      //3


                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL2,
                        child: Text("Facebook"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),

                      //4


                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL3,
                        child: Text("Instagram"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL4,
                        child: Text("Paytm"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL5,
                        child: Text("Amazon"),
                      ),
                      Padding(padding: EdgeInsets.all(5.00)),

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),

                        onPressed: _launchURL6,
                        child: Text("Flipkart"),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.redAccent,
                  thickness: 2.0,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }


}
