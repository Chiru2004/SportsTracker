import 'package:flutter/material.dart';
import 'package:sportstracker/screens/sportscreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
  
  //The starting widget to your Application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Tracker',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme:  GoogleFonts.latoTextTheme(),
        useMaterial3: true,
                   
                      ),

      home:  const SportScreen(),
    );
  }
}

