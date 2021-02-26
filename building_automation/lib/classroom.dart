import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class ClassRoom extends StatefulWidget {
  @override
  _ClassRoomState createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  final databaseReference = FirebaseFirestore.instance;
  String block_name = '';
  List floor_data = [];

  void getData(List args) async {
    DocumentSnapshot response =
        await databaseReference.collection('test').doc(args[0]).get();
    List res = [];
    response.data().forEach((key, value) => {
          if (key == args[1]) {res.add(value.keys.toList())},
        });
    res = res[0];
    floor_data = res;
    if (block_name != args[0]) {
      setState(() {
        block_name = args[0];
        floor_data = res;
      });
      floor_data.sort();
    }
  }

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments as List;
    getData(args);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/new1.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    args[0],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height / 11,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 3,
                      children: <Widget>[
                        ...floor_data
                            .map((e) => _floors(e, args[0], args[1], context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _floors(String class_name, String block_name, String floor_name,
    BuildContext context) {
  return Container(
    height: 500,
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/status',
            arguments: [block_name, floor_name, class_name]);
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: Text(
            class_name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    ),
  );
}