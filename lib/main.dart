import 'package:doctor/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signindoctor.dart';
import 'signinpatient.dart';
import 'authentication.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<authentication>(
          create: (_)=>authentication(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<authentication>().authStateChanges,
        )
      ],
      child: MaterialApp(
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
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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

      body: Center(
        child: Column(

          children: [
            Container(
              height: 400,

              width:  MediaQuery.of(context).size.width,
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
                      image: NetworkImage("https://png.pngtree.com/png-clipart/20190618/original/pngtree-medical-doctors-patient-nursing-png-image_3935494.jpg"),
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
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
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
                      onTap:()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Signupd()),);

                        }
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height:20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 6.0),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 1.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                  color: Color(0xffF0EFFE)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Center(
                        child: Text('Sign in as a Patient',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff9994FA),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat')),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signupp()),);
                      }

                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not Registered?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
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

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      print('signed in');
      return test();
    }
    return Signupd();
  }}