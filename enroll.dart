import 'package:attendence/student.dart';
import 'package:attendence/studentlofin.dart';
import 'package:flutter/material.dart';

class Enroll extends StatefulWidget {
  const Enroll({super.key});

  @override
  State<Enroll> createState() => _EnrollState();
}

class _EnrollState extends State<Enroll> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Attendence Management'),
        ),
        body: Container(
          height:myHeight,
          width: myWidth,
          child: Column(
            children: [SizedBox(
              height: myHeight/5,
             ),
             ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40),),
              onPressed: (() {} ),child: const Text('Teacher'),),
              SizedBox(height: myHeight/10,),
             ElevatedButton(
             style:ElevatedButton.styleFrom(minimumSize: const Size(100, 40),) , onPressed: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Studentlogin(),));
             } ),child: const Text('Student')),
             
             ],
             
          ),
        ),
      ) 
  );
  }
}