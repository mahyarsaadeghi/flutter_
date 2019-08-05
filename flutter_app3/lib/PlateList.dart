import 'package:flutter/material.dart';

//import 'Plate.dart';

class PlateList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlateList();
}

class _PlateList extends State<PlateList> {
  bool openSearshBarChecker = false;
//  bool open = false;
  TextEditingController textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      customListtile(
        name: "qhbj",
      ),
      customListtile(
        name: "lp[hy",
      ),
      customListtile(
        name: "ehsufs",
      ),
      customListtile(
        name: "qhbnsiuhfen",
      ),
      customListtile(
        name: "uerhe",
      ),
      customListtile(
        name: "nesfri",
      ),
      customListtile(
        name: "nsfi",
      ),
      customListtile(
        name: "awjdoi",
      ),
      customListtile(
        name: "sbedfb",
      ),
      customListtile(
        name: "otigjb",
      ),
      customListtile(
        name: "pkdorpf",
      ),
    ];

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool i) {
        return [
          SliverAppBar(
              title: openSearshBarChecker
                  ? AnimatedContainer(
//                      color: Colors.red,
                      curve: Curves.easeIn,
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      width: openSearshBarChecker ? MediaQuery.of(context).size.width : 0,
                      child: TextField(
                        autofocus: true,
//                expands: true,
                        decoration: InputDecoration(
                          hintText: 'Search',
                        ),
                        maxLines: 1,
                        controller: textFieldController,
                      ),
                    )
                  : Text(''),
              centerTitle: true,
              leading: openSearshBarChecker
                  ? IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          openSearshBarChecker = false;
                        });
                      },
                    )
                  : Text(''),
              snap: true,
              elevation: 8,
              floating: true,
              actions: openSearshBarChecker
                  ? null
                  : <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {
                          setState(() {
                            openSearshBarChecker = true;
                          });
                        },
                      ),
                    ])
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            children[0],
            children[1],
            children[2],
            children[3],
            children[4],
            children[5],
            children[6],
            children[7],
            children[8],
            children[9],
          ],
        ),
      ),
    );
  }
}

class customListtile extends StatefulWidget {
  final String name;

  const customListtile({Key key, this.name}) : super(key: key);

  @override
  customListTileState createState() => customListTileState(name);
}

class customListTileState extends State<customListtile> {
//  Widget customListtile(String name) {
//    return Column(
//      children: <Widget>[
//        RaisedButton(
//          onPressed: () {
////              Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>Plate()));
//            print('asjfsd');
//          },
//          color: Color.fromARGB(255, 255, 255, 255),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  Container(
//                      child: Image.asset(
//                        'blur1.jpg',
//                        fit: BoxFit.cover,
//                      ),
//                      margin: EdgeInsets.all(4.0),
//                      height: 80,
//                      width: 80
//                  ),
//                  SizedBox(
//                    width: 8.0,
//                  ),
//                  Container(
//                    child: Text(
//                      name,
//                      style:
//                      TextStyle(color: Color.fromARGB(255, 35, 42, 52)),
//                    ),
//                    margin: EdgeInsets.only(bottom: 45.0),
//                  )
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    child: Directionality(
//                      textDirection: TextDirection.rtl,
//                      child: IconButton(
//                        icon: Icon(
//                          Icons.delete,
//                          color: Colors.red,
//                          size: 30,
//                        ),
//                        onPressed: () {
//                          print("hi");
//                        },
//                      ),
//                    ),
//                    alignment: Alignment.centerRight,
//                  ),
//                  Container(
//                    child: Directionality(
//                      textDirection: TextDirection.rtl,
//                      child: IconButton(
//                        icon: Icon(
//                          Icons.edit,
//                          color: Colors.cyan,
//                          size: 30,
//                        ),
//                        onPressed: () {
//                          print("hi");
//                        },
//                      ),
//                    ),
//                    alignment: Alignment.centerRight,
//                  ),
//                  Container(color: Color.fromARGB(255, 0, 0, 0),
//                    width: 1, height: 75,),
//                  IconButton(
//                    onPressed: () {
//                      print('sd');
//                    },
//                    icon: Icon(Icons.keyboard_arrow_right),
//                  )
//                ],
//              )
//            ],
//          ),
//        ),
//        Divider(
//          height: 1,
//        )
//      ],
//    );
//  }
  final String name;

  customListTileState(this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>Plate()));
            print('asjfsd');
          },
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      child: Image.asset(
                        'blur1.jpg',
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(color: Color.fromARGB(255, 35, 42, 52)),
                    ),
                    margin: EdgeInsets.only(bottom: 45.0),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          print("hi");
                        },
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.cyan,
                          size: 30,
                        ),
                        onPressed: () {
                          print("hi");
                        },
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 1,
                    height: 75,
                  ),
                  IconButton(
                    onPressed: () {
                      print('sd');
                    },
                    icon: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
