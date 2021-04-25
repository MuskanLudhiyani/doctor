import 'package:flutter/material.dart';
import 'package:doctor/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:doctor/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:doctor/database.dart';
class searchd extends StatefulWidget {
  @override
  _searchdState createState() => _searchdState();
}

class _searchdState extends State<searchd> {
  @override
  List<doctor>appoints=[];
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<doctor>>.value(
      value: DatabaseService().doctorlist,
      initialData: [],
      builder: (context, patient) {

        return plist(context);
      },
    );
  }

  Widget plist(BuildContext context) {
    final appoints = Provider.of<List<doctor>>(context);
    if (appoints.isEmpty || appoints == null) {
      return CircularProgressIndicator();
    }
    return  new Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appoints.length,
                  itemBuilder: (context, index) {
                    if (controller.text.isEmpty) {
                      return ListTile(
                        title:
                        Text('${appoints[index].name} '),
                      );
                    } else if (appoints[index]
                        .name
                        .toLowerCase()
                        .contains(controller.text) ||
                        appoints[index]
                            .name
                            .toLowerCase()
                            .contains(controller.text)||
                    appoints[index].speciality.toLowerCase().contains(controller.text)) {
                      return ListTile(
                        title:
                        Text('${appoints[index].name} '),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


