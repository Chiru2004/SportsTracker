import 'package:flutter/material.dart';
import 'package:sportstracker/models/nbateam.dart';
import 'package:sportstracker/screens/nbastatscreen.dart';


class FavoriteNBAteam extends StatelessWidget
{
 const FavoriteNBAteam({super.key, required this.indexlist, required this.teamlist});

   final List<int> indexlist;
   final List<NBATeam> teamlist;
  
  void onSelectNBAteam(context,id,title){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NBATeamStatScreen(id:id ,title: title,)));
               }
  
   @override
   Widget build(BuildContext context){
    return Scaffold(
           backgroundColor: Colors.black,
           appBar: AppBar(title: const  Text("Favorite Teams",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.black,),
           body: 
           ListView(
            children:
            indexlist.map((i){
           return InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      onTap: (){onSelectNBAteam(context, teamlist[i].id, teamlist[i].name);},
      splashColor: Colors.blue,
            
          child: 
      Container(
        padding:const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),


        decoration: BoxDecoration(
          color: const  Color.fromARGB(195, 33, 149, 243),
          borderRadius: BorderRadius.circular(16),
          boxShadow:const [
            BoxShadow(color: const Color.fromARGB(120, 0, 0, 0))
          ],
        

        ),
        
        child:
        Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [   SizedBox(
  width: 120,
  height: 120,
  child: Image.network(
     teamlist[i].logo.toString(),
    fit: BoxFit.fill,
  ),
),
                        const SizedBox(height: 7,),
                        Text(teamlist[i].name.toString(),style: const TextStyle(color:  Color.fromARGB(255, 248, 248, 248),fontSize: 30)),
                        const SizedBox(height: 4,),
                        
                        //IconButton(onPressed: (){onToggle(index);}, icon: const Icon(Icons.star_border,size: 40,color: Colors.white,))
  ]
  )
        ));
           
            }).toList()
           )
           ,

);

   }

 }
