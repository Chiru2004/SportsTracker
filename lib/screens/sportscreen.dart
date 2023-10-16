import 'package:flutter/material.dart';
import 'package:sportstracker/data/sportdata.dart';
import 'package:sportstracker/widgets/sports_item.dart';

class SportScreen extends StatelessWidget
{
const SportScreen({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.black,
    appBar: AppBar(
                   title: const Text('Sports',style:TextStyle(color: Colors.white)),centerTitle: true, backgroundColor: Colors.black,),
  body: GridView(
    gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 8/3,mainAxisSpacing: 16),

  
     
  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),


    children:[
      for(final sport in sports)
      SportsItem(sport: sport)
    ]),
  ) ; 
  }
}