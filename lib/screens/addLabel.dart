import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app/components/roundedbutton.dart';
import 'package:student_app/screens/show_names.dart';

import '../names_list.dart';

class AddLabel extends StatefulWidget {
  @override
  _AddLabelState createState() => _AddLabelState();
}

class _AddLabelState extends State<AddLabel> {
  TextEditingController nameController = TextEditingController();
  NameListController nameListController = Get.put(NameListController());
  Color myColor = Color(0xff209b47);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff209b47),
        title: Text('Add label page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.drive_file_rename_outline,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                RoundedButton(
                  textOnButton: 'Add',
                  onPressed: () async {
                    nameController.text == ''
                        ? Get.snackbar(
                            '⚠ Warning ⚠',
                            'please enter name',
                            duration: Duration(seconds: 3),
                          )
                        : nameAdded();
                  },
                  width: 100,
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              textOnButton: 'Show All Names',
              onPressed: () {
                Get.to(NameList());
              },
            )
          ],
        ),
      ),
    );
  }

  nameAdded() {
    nameListController.addName(nameController.text);
    Get.snackbar(
      'Name Added',
      '${nameController.text} is added to name list',
      duration: Duration(seconds: 3),
    );
    nameController.clear();
  }
}
