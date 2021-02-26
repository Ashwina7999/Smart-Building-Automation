// import 'package:flutter/material.dart';
// import 'package:custom_switch/custom_switch.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // ignore: unused_import
// import 'package:firebase_core/firebase_core.dart';

// class FanLight extends StatefulWidget {
//   @override
//   _FanLightState createState() => _FanLightState();
// }

// class _FanLightState extends State<FanLight> {
//   final databaseReference = FirebaseFirestore.instance;
//   String block_name = '';
//   var fan;
//   var light;
//   var original_fan;
//   var original_light;

//   void getData(List args) async {
//     DocumentSnapshot response =
//         await databaseReference.collection('test').doc(args[0]).get();
//     List res = [];
//     response.data().forEach((key, value) => {
//           if (key == args[1]) {res.add(value)},
//         });
//     fan = res[0][args[args.length - 1]]['LIGHT'];
//     light = res[0][args[args.length - 1]]['FAN'];
//     original_fan = fan;
//     original_light = light;
//     fan = fan.keys.toList();
//     light = light.keys.toList();
//     if (block_name != args[0]) {
//       setState(() {
//         block_name = args[0];
//       });
//     }
//     fan.sort();
//     light.sort();
//   }

//   Card status(String url, String text, int numb) {
//     bool isToggle = false;
//     if (numb == 1) {
//       isToggle = true;
//     }

//     return Card(
//       margin: EdgeInsets.symmetric(
//         horizontal: 20.0,
//         vertical: 3.0,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25.0),
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(url),
//           backgroundColor: Colors.white,
//           radius: 15.0,
//         ),
//         title: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
//         ),
//         trailing: Transform.scale(
//           scale: 0.70,
//           child: CustomSwitch(
//             value: isToggle,
//             activeColor: Colors.green,
//             onChanged: (v) {
//               print(v);
//               setState(() {
//                 isToggle = v;
//               });
//             },
//           ),
//         ),
//       ),
//       elevation: 5,
//     );
//   }

//   bool isToggle = false;
//   @override
//   Widget build(BuildContext context) {
//     List args = ModalRoute.of(context).settings.arguments as List;
//     getData(args);

//     print('$args this is status page');
//     print('$fan is working');

//     if (fan == null || light == null) {
//       // print(listData);
//       // return CircularProgressIndicator();
//       return Container(width: 0.0, height: 0.0);
//     } else {
//       return Scaffold(
//         backgroundColor: Color(0xffF5F5F5),
//         body: Stack(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(bottom: 0.0),
//               // height: size.height * .3,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     alignment: Alignment.topCenter,
//                     image: AssetImage('assets/images/fan_light.png')),
//               ),
//             ),
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(150.0, 50.0, 0.0, 50.0),
//                 child: Text(
//                   args[2],
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//             ListView(
// // shrinkWrap: true,

// //   itemExtent: 50,
//               padding: EdgeInsets.only(top: 130, left: 10.0),
//               children: <Widget>[
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 10.0),
//                 //   child: Text(
//                 //     'LIGHT',
//                 //     style: TextStyle(
//                 //       decoration: TextDecoration.underline,
//                 //       decorationColor: Colors.orange,
//                 //       decorationThickness: 3,
//                 //       fontWeight: FontWeight.w600,
//                 //       fontSize: 18.0,
//                 //     ),
//                 //   ),
//                 // ),
//                 Text(
//                   "LIGHT",
//                   style: TextStyle(
//                     shadows: [
//                       Shadow(color: Colors.black, offset: Offset(0, -5))
//                     ],
//                     fontWeight: FontWeight.w600,
//                     fontSize: 17.0,
//                     color: Colors.transparent,
//                     decoration: TextDecoration.underline,
//                     decorationColor: Colors.orange,
//                     decorationThickness: 4,
//                     decorationStyle: TextDecorationStyle.dashed,
//                   ),
//                 ),

//                 ...fan.map((e) =>
//                     status('assets/images/light.png', e, original_fan[e])),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 15.0),
//                 //   child: Text('FAN',
//                 //       style: TextStyle(
//                 //           decoration: TextDecoration.underline,
//                 //           fontWeight: FontWeight.w600,
//                 //           fontSize: 18.0)),
//                 // ),

//                 Padding(
//                   padding: const EdgeInsets.only(top: 15.0),
//                   child: Text(
//                     "FAN",
//                     style: TextStyle(
//                       shadows: [
//                         Shadow(color: Colors.black, offset: Offset(0, -5))
//                       ],
//                       fontWeight: FontWeight.w600,
//                       fontSize: 17.0,
//                       color: Colors.transparent,
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.orange,
//                       decorationThickness: 4,
//                       decorationStyle: TextDecorationStyle.dashed,
//                     ),
//                   ),
//                 ),
//                 ...light.map((e) => status(
//                       'assets/images/fan.png',
//                       e,
//                       original_light[e],
//                     )),
//                 Container(
//                   height: 20.0,
//                 ),
//                 // status('LIGHT-1', isToggle),
//                 // status('LIGHT-2', isToggle),
//                 // status('LIGHT-3', isToggle),
//                 // Card(
//                 //   margin: EdgeInsets.symmetric(horizontal: 15.0),
//                 //   shape: RoundedRectangleBorder(
//                 //     borderRadius: BorderRadius.circular(20.0),
//                 //   ),
//                 //   child: ListTile(
//                 //     leading: CircleAvatar(
//                 //       backgroundImage: AssetImage('assets/images/light.png'),
//                 //       backgroundColor: Colors.white,
//                 //     ),
//                 //     title: Text(
//                 //       'LIGHT-1',
//                 //       textAlign: TextAlign.center,
//                 //       style: TextStyle(fontWeight: FontWeight.w600),
//                 //     ),
//                 //     trailing: CustomSwitch(
//                 //       value: isToggle,
//                 //       activeColor: Colors.blue,
//                 //       onChanged: (v) {
//                 //         print(v);
//                 //         setState(() {
//                 //           isToggle = v;
//                 //         });
//                 //       },
//                 //     ),
//                 //   ),
//                 //   elevation: 5,
//                 // ),
//               ],
//             )
//           ],
//         ),
//       );
//     }
//   }
// }





import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class FanLight extends StatefulWidget {
  @override
  _FanLightState createState() => _FanLightState();
}

class _FanLightState extends State<FanLight> {
  final databaseReference = FirebaseFirestore.instance;
  String block_name = '';
  var fan;
  var light;
  var original_fan;
  var original_light;

  void getData(List args) async {
    DocumentSnapshot response = await databaseReference.collection('test').doc(args[0]).get();
    List res = [];
    response.data().forEach((key, value) => {
      if (key == args[1]) 
      {
        res.add(value)
      },
    });
    fan = res[0][args[args.length - 1]]['LIGHT'];
    light = res[0][args[args.length - 1]]['FAN'];
    original_fan = fan;
    original_light = light;
    fan = fan.keys.toList();
    light = light.keys.toList();
    if (block_name != args[0]) {
      setState(() {
        block_name = args[0];
      });
    }
    fan.sort();
    light.sort();
  }

  @override
  bool isToggle = false;
  Widget build(BuildContext context) {
    
    List args = ModalRoute.of(context).settings.arguments as List;
    getData(args);

    print('$args this is status page');
    print('$fan is working');

    var size = MediaQuery.of(context).size;
    var width = size.width as double;
    print(width);

    if (fan == null || light == null) 
    {
      // print(listData);
      // return CircularProgressIndicator();
      return Container(width: 0.0, height: 0.0);
    } 
    else 
    {
      return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              _purple(size),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          args[2],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height / 11,
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 260.0, bottom: 10.0),
                            child: Text(
                              "LIGHT",
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black, offset: Offset(0, -5)
                                  ),
                                ],
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.orange,
                                decorationThickness: 4,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                          ),
                          ...fan.map((e) => _time('assets/images/light.png', e, original_fan[e])),
                        ],
                      ),
                    ),

                                       Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 260.0, bottom: 10.0),
                            child: Text(
                              "FAN",
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black, offset: Offset(0, -5)
                                  ),
                                ],
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.orange,
                                decorationThickness: 4,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                          ),
                          ...light.map((e) => _time('assets/images/fan.png',e,original_light[e],)),
                        ],
                      ),
                    ),

                    Container(
                      height: 20.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

Widget _time(String url, String text, int numb) {
  bool isToggle = false;
    if (numb == 1) {
      isToggle = true;
    }
  return Container(
    child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 3.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(url),
              backgroundColor: Colors.white,
            radius: 15.0,
          ),
          title: Text(
            text,
            textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
            ),
            trailing: Transform.scale(
              scale: 0.70,
              child: CustomSwitch(
                value: isToggle,
                activeColor: Colors.green,
                onChanged: (v) {
                  print(v);
                  // setState(() {
                  //   isToggle = v;
                  // });
                },
              ),
            ),
          ),
        elevation: 5,
      ),
    ),
  );
}

Widget _purple(size) {
  return Container(
      height: size.height * .3,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/images/fan_light.png'),
        ),
    ),
  );
}