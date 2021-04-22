import 'package:flutter/material.dart';
import 'signupdoctor.dart';
import 'signuppatient.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              GestureDetector(
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

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (signupdoctor())),
                    );
                  }
              ),


              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://image.freepik.com/free-vector/sad-cute-kid-girl-cough-use-masker_97632-1577.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 250,
                      width: 250,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (signuppatient())),
                    );
                  }
              ),
            ],
          )
        ],
      ),
    );
  }
}
