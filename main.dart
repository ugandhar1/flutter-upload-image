
import 'package:flutter/material.dart';
import 'package:flutter5/Aboutget/About.dart';
import 'package:flutter5/Club/Clubmain.dart';
import 'package:flutter5/DisplayScreen.dart';
import 'package:flutter5/Edit-details/Editmain.dart';
import 'package:flutter5/PhotoUpdate%20and%20Delete/photomain.dart';
import 'package:flutter5/Updateprofile/Profile.dart';
import 'package:flutter5/Uploadimage.dart';
import 'package:flutter5/Uploadimage2.dart';
import 'package:flutter5/Rides/Rides.dart';

import 'Emergenceycontact_delete/EmergenceyContact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Newimage(),
    );
  }
}

