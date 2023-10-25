import 'package:flutter/material.dart';
import 'package:sportstracker/screens/formulacircuitscreen.dart';
import 'package:sportstracker/screens/formulascreen.dart';
import 'package:sportstracker/widgets/formulamenu.dart';

class FormulaMenuScreen extends StatelessWidget{

const FormulaMenuScreen({super.key}); 

void onSelectteammenu(context){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>const FormulaScreen()));
}

void onSelectcomeptitionmenu(context){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>const FormulaCircuitScreen()));
}

@override
Widget build(BuildContext context){
  return Scaffold(
backgroundColor: Colors.black,

    appBar: 
        AppBar( title: const Text("Formula 1",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.black,),

   body: GridView(
     gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 8/2,mainAxisSpacing: 16),
 //padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),

    children: [
      FormulaMenu(heading: "Teams",onselectButton:(){ onSelectteammenu(context);}),
     FormulaMenu(heading: "Circuits",onselectButton: (){onSelectcomeptitionmenu(context);},)
      
    ],
   ),     
  );
}
}