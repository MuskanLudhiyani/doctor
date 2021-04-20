import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class appointments extends StatefulWidget {
  @override
  _appointmentsState createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  var data;
  var url = Uri.parse("https://jsonkeeper.com/b/N6OF");

  Future<String> getData() async {
    var response = await http.get(
        url,
        headers: {
          "Accept": "application/json"
        }
    );
    this.setState(() {
      data = jsonDecode(response.body);
    });
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: ListView.builder(


        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(


            child: Row(
              children: <Widget>[
                Column(
                  children: [
                    Container(margin: EdgeInsets.all(10),child: Text(data[index]["name"])),
                    Container(margin: EdgeInsets.all(10),child: Text(data[index]["date"])),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
               Column(
                  children: [
                    Container(margin:EdgeInsets.all(10),child: Text(data[index]["sex"])),
                    Container(margin:EdgeInsets.all(10),child: Text(data[index]["age"]))
                  ],
                ),



              ],
            ),
          );



        },
      ),
    );
  }
}