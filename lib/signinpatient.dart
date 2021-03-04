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
        backgroundColor: Color(0xff9994FA),


        body: SingleChildScrollView(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                            image: NetworkImage("https://image.freepik.com/free-vector/little-girl-get-temperature-check-new-normal-lifestyle-concept-flat-isolated-white-background_185694-60.jpg"),
                            fit: BoxFit.fill,

                          ),
                        ),
                        height: 250,
                        width: 250,

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

                          controller: email,
                          cursorColor: Color(0xff90E5BF),
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Email",
                              suffixIcon: GestureDetector(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    color: Color(0xff90E5BF),
                                  ),
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 15),
                              fillColor: Color(0xffFFFFFF),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ))),
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
                                  const Radius.circular(10.0),
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
                        borderRadius: BorderRadius.circular(10),
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
                                child: Text('Sign in as a Patient',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff9994FA),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                              onTap:()
                              {


                              }
                          )
                        ],
                      ),
                    ),
                  ),



                ],
              )),
        ));
  }
}