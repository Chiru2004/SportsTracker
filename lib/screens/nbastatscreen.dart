import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:sportstracker/models/nbateamstat.dart';
import 'package:http/http.dart' as http;
import 'package:sportstracker/key.dart';

//Response to store the dynamic map obtained during the API get request
 Future<List<NBATeamStat>> response=[] as  Future<List<NBATeamStat>>;

//_stats to store the list of the data of the type NBATeamStat, which will be used throughout the program. its declared globally.
 final List<NBATeamStat> _Stats=[];

class NBATeamStatScreen extends StatefulWidget {

//Constructor which takes input
const NBATeamStatScreen({ super.key,required this.id,required this.title});
final int id;
final String title; 

@override
 _NBATeamStatScreenState createState() => _NBATeamStatScreenState();
}


class _NBATeamStatScreenState extends State<NBATeamStatScreen>
{
//Futur list is returned from the mapresponse which is responsible for making the GET request
Future<List<NBATeamStat>> mapresponse() async{

//headers are included in the variable headers
 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'v2.nba.api-sports.io'
 };

//additional parameters for the GET request are set
var queryParameters={
                    
                    "id": "${widget.id}",
                    "season": "2020"
                    
                    };

//Get request is made
var baseUrl='https://v2.nba.api-sports.io/teams/statistics';

//Query parameters added to the GET request
var uri=Uri.parse(baseUrl).replace(queryParameters: queryParameters );
var request = http.Request('GET',uri);

request.headers.addAll(headers);

//Streamed response is recieved from the server
http.StreamedResponse response = await request.send();

//list to store the list within this function
List<NBATeamStat> leagues=[];

final data=jsonDecode(await response.stream.bytesToString());   //Json decode is used to obtain the dynamic data

//if condition to check the status code
if(response.statusCode==200)
{
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(NBATeamStat.fromJson(i));          //instance of the type NBATeamStat is created using the from Json function
  }
//list with all the data is returned
 return leagues;
}
else
{
    return leagues;          //empty list is returned
} 
}

@override
  void initState()          //inside init function the mapresponse function is make the response to the server
  {
    if(_Stats.isEmpty){
      //response store the future list that is obtained
  response=mapresponse().then((value){
                                         //Setstate is called to make the build function
    setState(() {
      _Stats.addAll(value) ;
  });
  return value;                        //value is returned to store in the reponse
    }
  );
  super.initState();
    }
  }
  
@override
Widget build(BuildContext context){

  //Scaffold is returned to form the page

  return Scaffold(
    appBar: AppBar(title: Text(widget.title, 
                    style: const TextStyle(fontSize: 25,color: Colors.white),),
                    centerTitle: true,backgroundColor: Colors.black,
                    ),

body: Column(                    //Coloumn widget to set the elements in a column
  children:[
      Expanded(                    //Expanded Widget is used to so that the child widget access all the remaining space
  child:

    FutureBuilder(
  future: response,                     //reponse is set to future:, since reponse is of the type future<list>
  builder: (context,AsyncSnapshot<List<NBATeamStat>> snapshot){                  //snapshot is Obtained from the given GET request
    if(snapshot.hasData)                        //condition to check the data
    {

     return ListView.builder(               //listview is returned, wheever the snapshot has recieved the dat       
        itemCount:_Stats.length,           //count is set as the number of elements in the list
        itemBuilder: (context, index){
          
      return  InkWell(
                        child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,             //Cross Axis(horizontal) is set to the start.
            children:
            [           //all the necessary data are entered in the format. Separate Widget could be used but, used brute force to output the text

      const Text(" Games: "),
      Center(child: Text(_Stats[index].games.toString(),style: const TextStyle(fontSize: 35, color: Colors.black),)),
      const SizedBox(height: 13,),
      Text("  Biggest Leads: ${_Stats[index].biggestLead.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Blocks: ${_Stats[index].blocks.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FGM: ${_Stats[index].fgm.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      const Text("  Points: "),
      Center(child: Text(_Stats[index].points.toString(),style: const TextStyle(fontSize: 35),)),
      const SizedBox(height: 13,),
      Text("  Turnovers: ${_Stats[index].turnovers.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Fast Break Points: ${_Stats[index].fastBreakPoints.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Def Rebs: ${_Stats[index].defReb.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      const Text("  Longest Run: "),
      Center(child: Text(_Stats[index].longestRun.toString(),style: const TextStyle(fontSize: 35),)),
      const SizedBox(height: 13,),
      const Text("  Points Off Turnover: "),
      Center(child: Text(_Stats[index].pointsOffTurnovers.toString(),style: const TextStyle(fontSize: 35),)),
      const SizedBox(height: 13,),
      Text("  FGA: ${_Stats[index].fga.toString()}",style: const TextStyle(fontSize: 24),),
      const SizedBox(height: 13,),
      Text("  FGP: ${_Stats[index].fgp.toString()}",style: const TextStyle(fontSize: 24),),
      const SizedBox(height: 13,),
      Text("  FTA: ${_Stats[index].fta.toString()}",style: const TextStyle(fontSize: 24),),
      const SizedBox(height: 13,),
      Text("  FTM: ${_Stats[index].ftm.toString()}",style: const TextStyle(fontSize: 24),),
      const SizedBox(height: 13,),
      Text("  FTP: ${_Stats[index].ftp.toString()}",style: const TextStyle(fontSize: 24),),
      const SizedBox(height: 13,),
      Text("  Steals: ${_Stats[index].steals.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Points in Paint: ${_Stats[index].pointsInPaint.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Def Reb: ${_Stats[index].defReb.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Off Reb: ${_Stats[index].offReb.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Plus Minus: ${_Stats[index].plusMinus.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
  
  //ending of the data
           ],
          )
        );
      },
    );
  }
    else
if(snapshot.hasError)                           //snapshot.haserror is true thn, no output is obtained
  {
    return const Center(child: Text("No data found"));
  }
    else
  {
      return                                   //else the its taking time to obtain the data. Show Circular progess indicator to display loading
            const Center(
              child: 
                     CircularProgressIndicator(color: Colors.red,)
                        );
    }
  }
//End of the 
            )
          )
        ]
      )
    );
  }
}