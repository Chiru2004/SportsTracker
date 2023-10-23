import 'package:flutter/material.dart';
import 'package:sportstracker/models/nbateam.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportstracker/screens/nbafav_screen.dart';
import 'package:sportstracker/screens/nbastatscreen.dart';
import 'package:sportstracker/key.dart';


 Future<List<NBATeam>> response=[] as  Future<List<NBATeam>> ;
 List<int> nbafavteam=[];
final List<NBATeam> _leagues=[];
 
 
class NBAScreen extends StatefulWidget
{

const NBAScreen({super.key,required });

@override
 _NBAScreenState createState() => _NBAScreenState();
}

class _NBAScreenState extends State<NBAScreen>
{



Future<List<NBATeam>> mapresponse() async{

 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'v2.nba.api-sports.io'
 };

var request = http.Request('GET', Uri.parse('https://v2.nba.api-sports.io/teams'),);

request.headers.addAll(headers);



http.StreamedResponse response = await request.send();

List<NBATeam> leagues=[];

final data=jsonDecode(await response.stream.bytesToString() );

if(response.statusCode==200)
{
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(NBATeam.fromJson(i));
  }
 //   ListView()
 return leagues;
}
else
{
    return leagues;
}
}

IconData star=Icons.star;

void onToggle(int index){
if(nbafavteam.contains(index))
{
  nbafavteam.remove(index);
  setState(() {
     star=Icons.star;
  });
   
}
else{
  nbafavteam.add(index);
  setState(() {
    star=Icons.star_border;
  });
}
 }


@override

  void initState()
  {
    if(_leagues.isEmpty){

 response= mapresponse().then((value){
    setState(() {

      _leagues.addAll(value) ;
               
                }
  );
  return value;
    }
  );
  super.initState();
    }
  }
    

void onSelectNBAteam(context,id,title){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NBATeamStatScreen(id:id ,title: title,)));
               }
void onSelectstar(context,nbafavteam,_leagues){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FavoriteNBAteam(indexlist: nbafavteam, teamlist: _leagues)));
               }
//@override
Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){ 
                onSelectstar(context, nbafavteam, _leagues);
                },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.star,color: Colors.black),
        shape: CircleBorder(side: BorderSide.none,)
      
      ) ,
        appBar: AppBar(
                   title: const Text('NBA teams',style:TextStyle(color: Color.fromARGB(255, 243, 243, 243))),centerTitle: true,backgroundColor: Colors.black, ),
backgroundColor: Colors.black,

body: Column(
  children:[
      Expanded(
  child: 
             FutureBuilder(

  future: response,
  builder: (context,AsyncSnapshot<List<NBATeam>> snapshot){  
    if(snapshot.hasData)
    {

     return ListView.builder(

        itemCount:_leagues.length,
        itemBuilder: (context, index){
          
      return  InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      onTap: (){onSelectNBAteam(context, _leagues[index].id, _leagues[index].name);},
      splashColor: Colors.blue,
            
          child: 
      Container(
        padding:const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),


        decoration: BoxDecoration(
          color: const  Color.fromARGB(195, 33, 149, 243),
          borderRadius: BorderRadius.circular(16),
          boxShadow:const [
            BoxShadow(color:  Color.fromARGB(120, 0, 0, 0))
          ],
        

        ),
        
        child:
        Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [   SizedBox(
  width: 120,
  height: 120,
  child: Image.network(
     _leagues[index].logo.toString(),
    fit: BoxFit.fill,
  ),
),
                        const SizedBox(height: 7,),
                        Text(_leagues[index].name.toString(),style: const TextStyle(color:  Color.fromARGB(255, 248, 248, 248),fontSize: 30)),
                        const SizedBox(height: 4,),
                        
                        IconButton(onPressed: (){onToggle(index);}, icon: Icon(star,size: 40,color: Colors.white,))
  ]
  )
        ));
        },);

    }
    else
    if(snapshot.hasError)
    {
          return const Text("No data found");
    }
    else
    {
      return   
           const  Center(
              child: 
            CircularProgressIndicator()
            );
    }
  }

            


    ))]));
                    }

}      