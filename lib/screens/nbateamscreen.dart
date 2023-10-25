import 'package:flutter/material.dart';
import 'package:sportstracker/models/nbateam.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportstracker/screens/nbafav_screen.dart';
import 'package:sportstracker/screens/nbastatscreen.dart';
import 'package:sportstracker/key.dart';
import 'package:shared_preferences/shared_preferences.dart';


 Future<List<NBATeam>> response=[] as  Future<List<NBATeam>> ;     //list to hold all the future list of NBATeam object, which is to be passed into the future: in Future builder

 List<int> nbafavteam=[-1];                //list of elements to store all the index of fav teams

final List<NBATeam> _leagues=[];          //list to store all the teams obtained during the GET request
 
class NBAScreen extends StatefulWidget
{

//This class takes in no parameters
const NBAScreen({super.key,required });

@override
 _NBAScreenState createState() => _NBAScreenState();
}

class _NBAScreenState extends State<NBAScreen>
{

Future<List<NBATeam>> mapresponse() async{              //function to make the GET request

 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'v2.nba.api-sports.io'
 };

 //creating the request
var request = http.Request('GET', Uri.parse('https://v2.nba.api-sports.io/teams'),);

//adding headers into the request
request.headers.addAll(headers);

//obatining a Streamed response object
http.StreamedResponse response = await request.send();

List<NBATeam> leagues=[];  //temporary object to store all the list of NBATeams

final data=jsonDecode(await response.stream.bytesToString());

if(response.statusCode==200)         //condition to check the status code of the response received, if not then return a empty list
{
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(NBATeam.fromJson(i));    //obtaining a instance of NBATeam using the fromJson function
  }
 return leagues;    //
}
else
{
    return leagues;
}
}

//Function to save a list of integers which is index of favorite teams

void saveIntList(List<int> integerList) async 
{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('integerList', integerList.map((e) => e.toString()).toList());
}

//ontoggle function to insert element into the list if its nt present, and delete it if its already present

void onToggle(int index)
{

if(nbafavteam.contains(index))
{
  nbafavteam.remove(index);
 ScaffoldMessenger.of(context).showSnackBar(                 //code for snackbar incase a index is being deleted
       SnackBar(content: Text("${_leagues[index].name.toString()} removed from favorites"),
       duration: const Duration(seconds: 1),),
    );
    saveIntList(nbafavteam);  //save the list after deletion
}
else{
  nbafavteam.add(index);
  ScaffoldMessenger.of(context).showSnackBar(        //code for snackbar incase a index is being inserted
      SnackBar(content: Text("${_leagues[index].name.toString()} added to favorites"),
      duration: const Duration(seconds: 1),)
  );
 saveIntList(nbafavteam);  // save the list after insertion
}
 }


//function to reeive the integers

Future<List<int>> getIntList() async {
  final prefs = await SharedPreferences.getInstance();
  final stringList = prefs.getStringList('integerList');
  if (stringList == null) {
    return [];
  }
  return stringList.map((str) => int.parse(str)).toList();
}

@override
//init function to call the mapresponse(to make a GET request), and to load the saved integer list in the sharedpreferences
  void initState()
  {
   
   if(nbafavteam[0]==-1)
   {
      nbafavteam.remove(-1);
      getIntList().then((value){
       setState(() {
         nbafavteam.addAll(value);
       });
      });
   }
   
    if(_leagues.isEmpty)
    {
 response= mapresponse().then((value){
    setState(() {
  _leagues.addAll(value) ;

        });
  return value;
    }
  );
  super.initState();
    }
  }
    
//Navigator function to shift the elements from page to another
void onSelectNBAteam(context,id,title){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NBATeamStatScreen(id:id ,title: title,)));
               }
void onSelectstar(context,nbafavteam,_leagues){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FavoriteNBAteam(indexlist: nbafavteam, teamlist: _leagues)));
               }

Widget build(BuildContext context) {

    return Scaffold(                          //scaffold Widget is used to create the required page
      floatingActionButton:FloatingActionButton(       //floating action button to access the favorite team page
        onPressed: (){ 
                onSelectstar(context, nbafavteam, _leagues);
                },
        backgroundColor: Colors.blueAccent,
        child:  const Icon(Icons.star,color: Color.fromARGB(255, 255, 255, 255),size: 30,),  //inserting a icon ito the favorite team page
        shape: const CircleBorder(side: BorderSide.none,)                                           //making the shape to be circular
      
      ) ,
        appBar: AppBar(
                   title: const Text('NBA teams',style:TextStyle(color: Color.fromARGB(255, 243, 243, 243))),centerTitle: true,backgroundColor: Colors.black, ),
backgroundColor: Colors.black,

body: Column(
  children:[
      Expanded(
  child: 
             FutureBuilder(                           //Future builder is used to obtain all the required data

                       future: response,
                       builder: (context,AsyncSnapshot<List<NBATeam>> snapshot)
                       {  
    if(snapshot.hasData)
    {

     return ListView.builder(                       //ListView.builder to create the list

        itemCount:_leagues.length,
        itemBuilder: (context, index)
        {
      return  InkWell(                      //i used InkWell to make the boxes 
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      onTap: (){onSelectNBAteam(context, _leagues[index].id, _leagues[index].name);},
      splashColor: Colors.blue,              //splash color added to the boxes, to react when it is pressed
             child: 
      Container(
        padding:const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 7), //
        decoration: BoxDecoration(                                      
          gradient: const LinearGradient(colors:
           [                                  //linear gradient is added into the box
             Color.fromARGB(255, 47, 152, 237),
            Color.fromARGB(255, 2, 101, 182)
          ]),
          borderRadius: BorderRadius.circular(16),
           ),//
          child: Row(
                        children: [
                        Expanded(
                          child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [   
                                   (_leagues[index].logo != null )?   //condition is checked, and the logo is printed only when the its nt NULL
                                   SizedBox(   
                          width: 85,
                          height: 80,
                          child: Image.network(               //Since the image is in URL form, network image is used
                             _leagues[index].logo.toString(),    //tostring function is used to convert the string? to string
                            fit: BoxFit.contain,
                          ),
                        ):const SizedBox(height: 3,),
                          const SizedBox(height: 7,),
                          Text(_leagues[index].name.toString(),
                                style: const TextStyle(color:  Color.fromARGB(255, 248, 248, 248),fontSize: 25)),
                          const SizedBox(width: 4,),             
                                   ]
                                    ),
                        ),
           const SizedBox(width: 65),
           IconButton(onPressed: (){
            onToggle(index);  //ontoggle function is called to decide whether to insert the index or to delete in from the list
           }, 
           icon : const Icon(Icons.star_border_sharp,size: 45,color: Color.fromARGB(255, 233, 233, 233),
              )
              )
               ]
              )
            )
          );
        },
      );
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
          )
         )
       ]
     )
  );
                    }

}      