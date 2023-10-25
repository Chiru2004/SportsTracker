import 'package:flutter/material.dart';
import 'package:sportstracker/models/sport.dart';


//custom flutter Widget called the SportsItem to Display the sports details including icon and name.
class SportsItem extends StatelessWidget
{

  //Constructor which takes in two parameter, sport object and a function onselect
  const SportsItem({super.key, required this.sport,required this.onselect});
  final Sport sport;
  final void Function() onselect;

@override
Widget build(BuildContext context)
{
         //this Class return a Inkwell widget

  return  InkWell(

                   borderRadius: BorderRadius.circular(15),
                   splashColor: sport.color.withOpacity(1),      //Splash color is set
                   onTap: onselect,
                   child: 
                   Container(            //Container Widget to control the box design and padding of the text
                       padding: const EdgeInsets.all(20),
                       decoration: BoxDecoration(
                                                            //Linear gradient applied to the inkwell widget
                                      gradient: LinearGradient(colors: [
                                                      sport.color.withOpacity(0.95),
                                                      sport.color.withOpacity(0.4)
                                                      ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight
                                        ),
                       borderRadius: BorderRadius.circular(15),        //rounded corner for the box
                             ),
                       alignment: Alignment.topLeft,        //Text and icons are aligned to top left
                       child: Row(                                     //row Widget containing all content in the widget
                                  children: [
                                              Icon(sport.icon, size: 35,color: Colors.white),
                                              const SizedBox(width: 12,),                        //Sized box to separate the the text
                                              Text(sport.title, style: const TextStyle(color:Colors.white, fontSize: 27,),),
                     
                                            ],
                                ),
                              )
                            );
                          }
                          }