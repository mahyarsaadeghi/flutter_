import 'package:flutter/material.dart';
// import 'Drawer.dart';
import 'package:flutter/rendering.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/animation.dart';

bool _radio;
Widget alert;

String dropValue;

class Plate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Plate();
}

class _Plate extends State<Plate> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<int> animation;

  WebSocketChannel channel;

  ScrollController _myScrollController = new ScrollController();
  bool _showAppbar = true;
  bool _isScrollingDown = false;
  bool _show = true;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = IntTween(begin: 1, end: 255).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
    try {
      channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

      channel.stream.listen((data) {
        setState(() {
          alert = Text('tamam');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: alert,
                );
              });
        });
      });
    } catch (e) {
      print('here is error: ' + e.toString());
    }

    myScroll();
  }

  void dispose() {
    super.dispose();
    _myScrollController.removeListener(() {});
    channel.sink.close();
  }

  void sendData(String data) {
    alert = AlertDialog(
      title: Text('dsan'),
      // content: SpinKitWave(color: Color.fromARGB(255, 255, 45, 54)),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
    channel.sink.add(data);
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _myScrollController.addListener(() {
      if (_myScrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
        }
      }
      if (_myScrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }

  Widget widgetPlate(BuildContext context) {
    Widget plate = Card(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "Printing -",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  ),
                  margin: EdgeInsets.all(8.0),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                  child: Text(
                    "Octopus-PrintrBot-Simple-Metal-PLA...",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 10),
                  ),
                )
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 1.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Color.fromARGB(255, 255, 25, 0),
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    "blur1.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, animation.value,
                                  animation.value - 20, animation.value - 90)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
                          child: SizedBox(
                            height: 0.7,
                            width: 320.0,
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "Remainng",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 240, 220),
                                  fontSize: 15),
                            )),
                            Expanded(
                              child: Text(
                                "01:22:07",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
                          child: SizedBox(
                            height: 0.7,
                            width: 320.0,
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "Layer",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 240, 220),
                                  fontSize: 15),
                            )),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "7",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18),
                                  ),
                                  Text(
                                    " of",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14),
                                  ),
                                  Text(
                                    " 756",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(10.0),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Printer Tempretaure",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      "Printer Tempretaure",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                )
              ],
            ),
            Container(
              child: LinearProgressIndicator(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              margin: EdgeInsets.all(10.0),
            ),
            Container(
              child: Text(
                "210",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10.0),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "START",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 9.5),
                    ),
                    color: Color.fromARGB(255, 6, 190, 188),
                  ),
                  margin: EdgeInsets.only(left: 8.0, right: 5.0),
                )),
                Expanded(
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "STOP",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 9.5),
                      ),
                      color: Color.fromARGB(255, 6, 190, 188),
                    ),
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "PAUSE",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 9.5),
                    ),
                    color: Color.fromARGB(255, 6, 190, 188),
                  ),
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                )),
                Expanded(
                  child: Container(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 7.9),
                        ),
                        color: Color.fromARGB(255, 6, 190, 188),
                      ),
                      margin: EdgeInsets.only(left: 5.0, right: 8.0)),
                ),
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      elevation: 4.0,
      color: Color.fromARGB(255, 45, 52, 61),
    );

    Widget plateSetting = Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Printer Controls",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
              margin: EdgeInsets.all(8.0),
            ),
            Divider(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 1.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: RadioListTile(
                      value: null,
                      activeColor: Color.fromARGB(255, 255, 255, 255),
                      groupValue: null,
                      onChanged: (c) {
                        print(c.toString());
                      },
                      title: Text(
                        "salam",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12),
                      ),
                    ),
                  ),
                  Flexible(
                    child: RadioListTile(
                      value: null,
                      activeColor: Color.fromARGB(255, 255, 255, 255),
                      groupValue: null,
                      onChanged: (c) {
                        print(c.toString());
                      },
                      title: Text(
                        "salam",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                      child: Flexible(
                    child: RadioListTile(
                      value: null,
                      activeColor: Color.fromARGB(255, 255, 255, 255),
                      groupValue: null,
                      onChanged: (c) {
                        print(c.toString());
                      },
                      title: Text(
                        "salam",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Color.fromARGB(255, 6, 190, 188),
                              height: 70,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 25,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Container(
                              child: SizedBox(),
                              width: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              width: 30,
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                "0.5\nmm",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              color: Color.fromARGB(255, 6, 190, 255),
                            ),
                            Container(
                              child: SizedBox(),
                              width: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              width: 30,
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                "0.5\nmm",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              color: Color.fromARGB(255, 6, 190, 255),
                            ),
                            Container(
                              child: SizedBox(),
                              width: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              width: 30,
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                "0.5\nmm",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              color: Color.fromARGB(255, 6, 190, 255),
                            ),
                            Container(
                              child: SizedBox(),
                              width: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              width: 30,
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                "0.5\nmm",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              color: Color.fromARGB(255, 6, 190, 255),
                            ),
                            Container(
                              child: SizedBox(),
                              width: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              width: 30,
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                "0.5\nmm",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              color: Color.fromARGB(255, 6, 190, 255),
                            ),
                            Container(
                              child: SizedBox(),
                              width: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              color: Color.fromARGB(255, 6, 190, 188),
                              height: 70,
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 4.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            color: Color.fromARGB(255, 6, 190, 188),
                            height: 70,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Container(
                            child: SizedBox(),
                            width: 4,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              "0.5\nmm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            color: Color.fromARGB(255, 6, 190, 255),
                          ),
                          Container(
                            child: SizedBox(),
                            width: 4,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              "0.5\nmm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            color: Color.fromARGB(255, 6, 190, 255),
                          ),
                          Container(
                            child: SizedBox(),
                            width: 4,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              "0.5\nmm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            color: Color.fromARGB(255, 6, 190, 255),
                          ),
                          Container(
                            child: SizedBox(),
                            width: 4,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              "0.5\nmm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            color: Color.fromARGB(255, 6, 190, 255),
                          ),
                          Container(
                            child: SizedBox(),
                            width: 4,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              "0.5\nmm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            color: Color.fromARGB(255, 6, 190, 255),
                          ),
                          Container(
                            child: SizedBox(),
                            width: 4,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Container(
                            color: Color.fromARGB(255, 6, 190, 188),
                            height: 70,
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: LinearProgressIndicator(),
                  margin: EdgeInsets.only(left: 20, bottom: 10.0, right: 20),
                ),
                Container(
                  child: RaisedButton(
                    child: Text("OFF"),
                    onPressed: () {
                      print('calling websocket');
                      sendData("my dataaa for the websocket");
                    },
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Extrude Filament",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
              margin: EdgeInsets.all(8.0),
            ),
            Container(
              child: Divider(
                color: Color.fromARGB(255, 255, 255, 255),
                height: 1.0,
              ),
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Filament Amount",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),
              ),
              margin: EdgeInsets.all(8.0),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: DropdownButton(
                        hint: dropValue == null
                            ? Text(
                                "Amount",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14),
                              )
                            : Text(dropValue,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14)),
                        isExpanded: true,
                        items: <String>['10 mm', '20 mm', '30 mm', '40 mm']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropValue = value;
                          });
                          print(value);
                        }),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {
                      print(null);
                    },
                    color: Color.fromARGB(255, 6, 190, 188),
                    child: Text(
                      "Extrude",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12),
                    ),
                  )),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {
                      print(null);
                    },
                    color: Color.fromARGB(255, 6, 190, 188),
                    child: Text(
                      "RETRACT",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12),
                    ),
                  )),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
            ),
            SizedBox(
              height: 10,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      elevation: 4.0,
      color: Color.fromARGB(255, 45, 52, 61),
    );

    return Column(
      children: <Widget>[
        plate,
        plateSetting,
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _showAppbar
            ? AppBar(
                backgroundColor: Color.fromARGB(255, 35, 42, 52),
              )
            : null,
        // drawer: CustomisedDrawer(),
        backgroundColor: Color.fromARGB(255, 35, 42, 52),
        body: Container(
          child: SingleChildScrollView(
            controller: _myScrollController,
            child: widgetPlate(context),
          ),
          margin: EdgeInsets.only(top: 20.0),
        ));
  }
}
