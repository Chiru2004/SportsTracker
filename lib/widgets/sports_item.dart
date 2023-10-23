import 'package:flutter/material.dart';
import 'package:sportstracker/models/sport.dart';

class SportsItem extends StatelessWidget
{
  const SportsItem({super.key, required this.sport,required this.onselect});
  final Sport sport;
final void Function() onselect;
@override
Widget build(BuildContext context)
{
  return  InkWell(
                   borderRadius: BorderRadius.circular(15),
                   splashColor: sport.color.withOpacity(1),
                   onTap: onselect,
                   child: 
                   Container(
                   padding: const EdgeInsets.all(20),
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
                                  children: [
                                              Icon(sport.icon, size: 60,color: Colors.white),
                                              const SizedBox(width: 15,),
                                              Text(sport.title, style: const TextStyle(color:Colors.white, fontSize: 36,),),
                     
                                            ],
                   ) ,
  
           
          ));
  
}

}