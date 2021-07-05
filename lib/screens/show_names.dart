import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/components/roundedbutton.dart';
import 'package:student_app/names_list.dart';
import 'package:student_app/screens/addLabel.dart';

class NameList extends StatefulWidget {
  const NameList({Key? key}) : super(key: key);

  @override
  _NameListState createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  NameListController nameListController = Get.put(NameListController());
  late List myFinalList;

  getList() {
    myFinalList = nameListController.myList;
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff209b47),
        title: Text('Name List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myFinalList.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No name added yet 😎',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff209b47),
                      ),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      'Add Names first ✍',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff209b47),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                      textOnButton: 'Add Name',
                      onPressed: () {
                        Get.to(AddLabel());
                      },
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: myFinalList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(myFinalList[index]),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xff209b47),
                      radius: 24.0,
                      child: Text(
                        (++index).toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
