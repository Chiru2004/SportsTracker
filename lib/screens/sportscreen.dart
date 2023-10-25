import 'package:flutter/material.dart';
import 'package:sportstracker/models/sport.dart';
import 'package:sportstracker/screens/formulamenu.dart';
import 'package:sportstracker/screens/formulascreen.dart';
import 'package:sportstracker/screens/nbateamscreen.dart';
import 'package:sportstracker/widgets/sports_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SportScreen extends StatelessWidget
{
const SportScreen({super.key});

void onSelectsport(context){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const FormulaMenuScreen()));
}
void onSelectNBA(context){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NBAScreen()));
}

@override 

Widget build(BuildContext context) {
 
  return Scaffold(
    
    backgroundColor: Colors.black,
    appBar: AppBar(
                   title: const Text('Sports',style:TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                   centerTitle: true, 
                   backgroundColor: Colors.black,
                    ),

//Grid view of the objects
   body: GridView(
     gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 8/2.7,mainAxisSpacing: 16),
 padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
 children: [

    SportsItem(sport:Sport(id: 'c1', icon: Icons.speed, title: "Forumula 1", color: Colors.red),
                           onselect:(){ onSelectsport(context);},),
    SportsItem(sport:Sport(id: 'c2', icon: Icons.sports_basketball_rounded, title: "NBA", color: Colors.blue),
                           onselect:(){ onSelectNBA(context);},),

           ],
    ),
  );
  }
}
