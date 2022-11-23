// ignore_for_file: depend_on_referenced_packages


import 'package:attendence/StudenCategery.dart';
import 'package:attendence/bloc/signInBloc/sign_in_bloc.dart';
import 'package:attendence/bloc/signupbloc/bloc/sign_up_bloc.dart';
import 'package:attendence/studentlofin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'enroll.dart';

import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   
  
  await Firebase.initializeApp(); 
   
 
  runApp(const MyApp());  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyTheamState();
}

class _MyTheamState extends State<MyApp> {
  
  @override


  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return MultiBlocProvider(providers: [
      BlocProvider<SignInBloc>(create: (context) => SignInBloc(),),
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(),)
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'attendence',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: auth.currentUser != null ? const StudentCategery() : const SignInPage()
 
    ));
    
  }
}