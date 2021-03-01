import 'package:flutter/material.dart';

import 'dart:convert' as convert;



class Signupp extends StatefulWidget {
  @override
  _SignuppState createState() => _SignuppState();
}
class _SignuppState extends State<Signupp> {

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F2),
        appBar: PreferredSize(
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(9.0, 65.0, 9.0, 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Color(0xff5C6278),
                      ),
                      Text('Signup',
                          style:
                          TextStyle(fontSize: 20.0, color: Color(0xff5C6278),))
                    ],
                  ),
                )),
            preferredSize: Size.fromHeight(120)),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Container(
                    width: 240,
                    child: Text(
                      'I hope each new day brings you closer to a full and speedy recovery!',
                      textAlign: TextAlign.center,

                      style: TextStyle(fontSize: 25.0,
                        fontStyle: FontStyle.italic,
                        color: Color(0xff51D8DE),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Color(0xffFFFFFF),
                        primaryColorDark: Color(0xffFFFFFF),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                            controller: email,
                            cursorColor: Color(0xff90E5BF),
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "Email",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    child: Text(
                                      " ",
                                      style: TextStyle(
                                        color: Color(0xff90E5BF),
                                      ),
                                    ),
                                  ),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                                fillColor: Color(0xffFFFFFF),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(100.0),
                                  ),
                                ))),
                      ),
                    ),
                  ),


                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Color(0xffFFFFFF),
                        primaryColorDark: Color(0xffFFFFFF),
                      ),
                      child: TextField(
                          obscureText: true,
                          controller: password,
                          cursorColor: Color(0xff90E5BF),
                          decoration: InputDecoration(
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 15),
                              hintText: "Password",


                              fillColor: Color(0xffFFFFFF),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(100.0),
                                ),
                              ))),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Color(0xff5C6278),
                          borderRadius: BorderRadius.circular(100.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              child: Center(
                                child: Text('Sign In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                              onTap: () {
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                ],
              )),
        ));
  }
}