import 'package:flutter/material.dart';
import 'package:sportstracker/models/sport.dart';

class SportsItem extends StatelessWidget
{
const  SportsItem({super.key, required this.sport});
  final Sport sport;

@override
Widget build(BuildContext context)
{
  return  InkWell(
                  borderRadius: BorderRadius.circular(15),
                   splashColor: sport.color.withOpacity(1),
                   onTap: (){},
                   child: Container(
                     padding: const EdgeInsets.all(50),
    //clipBehavior: Clip.hardEdge,
               //    alignment: Alignment.topLeft,
      
                   decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [
                   sport.color.withOpacity(0.95),
                   sport.color.withOpacity(0.5)],
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight
                                        ),
               borderRadius: BorderRadius.circular(15),
                           ),
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                              Icon(sport.icon, size: 60,color: Colors.white),
                                              const SizedBox(width: 25,),
                                              Text(sport.title, style: const TextStyle(color:Colors.white, fontSize: 36,   ),),
                                              //const SizedBox(height: 5,)
                                  ],
                   ) ,
  
           
          ));
  
}

}