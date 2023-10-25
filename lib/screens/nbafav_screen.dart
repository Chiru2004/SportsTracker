import 'package:flutter/material.dart';
import 'package:sportstracker/models/nbateam.dart';
import 'package:sportstracker/screens/nbastatscreen.dart';

//a widget to build the NBA favorite team selected

class FavoriteNBAteam extends StatelessWidget
{

  //This class takes two parameters index list containing list of all teams, and team list containing all the list of elemnets

 const FavoriteNBAteam({super.key, required this.indexlist, required this.teamlist});

   final List<int> indexlist;
   final List<NBATeam> teamlist;
  
  // a function to change the screen on the function call

  void onSelectNBAteam(context,id,title){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NBATeamStatScreen(id:id ,title: title,)));
               }
  

   @override
   Widget build(BuildContext context){
    return Scaffold(                         //Scaffold Widget
           backgroundColor: Colors.black,
           appBar: AppBar(title: const  Text("Favorite Teams", 
           style: TextStyle(color: Colors.white),),
           centerTitle: true,backgroundColor: Colors.black,),
           body:
             (!indexlist.isEmpty)?      // indexlist is checked, is there is elements then output the elements otherwise, just display that the list is empty
           ListView(                      //we use list view to display the corresponding elements,
            children:
            indexlist.map((i){                 //map function to access the elements in the list
           return InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),     
      onTap: (){onSelectNBAteam(context, teamlist[i].id, teamlist[i].name);},   //we send OonSelect NBAteam inside On tap which will call NBA stat Screen
      splashColor: Colors.blue,                                  //splash color is added to the box
            
          child:                                            // sco container to hold the elements
      Container(
        padding:const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),


        decoration: BoxDecoration(
          color: const  Color.fromARGB(195, 33, 149, 243),
          borderRadius: BorderRadius.circular(16),
          boxShadow:const [
            BoxShadow(color: Color.fromARGB(120, 0, 0, 0))
          ],
        //we had a box decoration feature
        ),
        
        child:
        Column(                                                     //
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [   
            SizedBox(              //Sized Box is called to output the image into the screen
  width: 120,
  height: 120,
  child: Image.network(
     teamlist[i].logo.toString(),
    fit: BoxFit.fill,
  ),
), 
                        const SizedBox(height: 7,),                  //all the required data is printed out here
                        Text(teamlist[i].name.toString(),style: const TextStyle(color:  Color.fromARGB(255, 248, 248, 248),fontSize: 30)),
                        const SizedBox(height: 4,),
                        
                       
     ]
    )
  )//
);
           
            }).toList()  //who whole thing is converted to a list since we are connecting it to listview Widget
           ):const Center(child:Text("No Favorite team Selected"),)
           ,
           ); //
         }
         }
