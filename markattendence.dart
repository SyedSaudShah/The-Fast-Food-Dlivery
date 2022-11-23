import 'package:flutter/material.dart';

class Markattendence extends StatefulWidget {
  const Markattendence({super.key});

  @override
  State<Markattendence> createState() => _MarkattendenceState();
}

class _MarkattendenceState extends State<Markattendence> {
  String? attendence = 'absent';

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: myWidth / 1.5,
              child: const TextField(
                maxLength: 10,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Student Name',
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
            Container(
              width: myWidth / 1.5,
              child: const TextField(
                maxLength: 10,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Roll No',
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: myHeight / 15,),
                Text('Mark Attendence'),
                RadioListTile(
                  title: Text("Absent"),
                  value: "absent",
                  groupValue: attendence,
                  onChanged: (value) {
                    setState(() {
                      attendence = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Present"),
                  value: "present",
                  groupValue: attendence,
                  onChanged: (value) {
                    setState(() {
                      attendence = value.toString();
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: myHeight / 20),
              width: myWidth / 1.5,
              child: ElevatedButton(
                onPressed: (){},
                child: Text('Save'),
              ),
            )
            // Row(children: [
            //   Text('Mark'),
            //   Spacer(flex: 12,),
            //  RadioListTile(value: 0, groupValue: 'Absent', onChanged: (e){}),
            //  RadioListTile(value: 1, groupValue: 'Present', onChanged: (e){}),
            //  ],)
          ],
        ),
      ),
    ));
  }
}
