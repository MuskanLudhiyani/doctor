import 'package:doctor/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signindoctor.dart';
import 'signinpatient.dart';
import 'authentication.dart';
import 'package:provider/provider.dart';
import 'signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocOn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DocOn'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Color(0xff9994FA),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://png.pngtree.com/png-clipart/20190618/original/pngtree-medical-doctors-patient-nursing-png-image_3935494.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 220,
                  width: 220,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffF0EFFE),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        child: Center(
                          child: Text('Sign in as a Doctor',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff9994FA),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signind()),
                          );
                        })
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Padding(
            //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            //   child: Container(
            //     margin: const EdgeInsets.only(bottom: 6.0),
            //     height: 50,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(
            //             color: Colors.transparent,
            //             style: BorderStyle.solid,
            //             width: 1.0),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.white,
            //             blurRadius: 2.0,
            //             spreadRadius: 0.0,
            //             offset:
            //                 Offset(2.0, 2.0), // shadow direction: bottom right
            //           )
            //         ],
            //         color: Color(0xffF0EFFE)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         GestureDetector(
            //             child: Center(
            //               child: Text('Sign in as a Patient',
            //                   style: TextStyle(
            //                       fontSize: 20,
            //                       color: Color(0xff9994FA),
            //                       fontWeight: FontWeight.bold,
            //                       fontFamily: 'Montserrat')),
            //             ),
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(builder: (context) => Signinp()),
            //               );
            //             })
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not Registered?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
