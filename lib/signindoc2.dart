import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:provider/provider.dart';

class signindoc2 extends StatefulWidget {
  @override
  _signindoc2State createState() => _signindoc2State();
}

class _signindoc2State extends State<signindoc2> {

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Color(0xff9994FA),
          body: SingleChildScrollView(
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                                  "https://i.pinimg.com/originals/cf/4e/c0/cf4ec0f1cd566491fe962ed9d2f68d67.jpg"),
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
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
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
                                  context.read<authentication>().signIn(
                                    email: email.text.trim(),
                                    pass: password.text.trim(),
                                  );
                                }
                            )
                          ],
                        ),
                      ),
                    ),


                  ],
                )),
          )),
    );
  }
}
