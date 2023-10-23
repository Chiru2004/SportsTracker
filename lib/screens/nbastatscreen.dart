import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:sportstracker/models/nbateamstat.dart';
import 'package:http/http.dart' as http;
import 'package:sportstracker/key.dart';
 Future<List<NBATeamStat>> response=[] as  Future<List<NBATeamStat>> ;
 final List<NBATeamStat> _Stats=[];
class NBATeamStatScreen extends StatefulWidget {

const NBATeamStatScreen({ super.key,required this.id,required this.title});
final int id;
final String title; 

@override
 _NBATeamStatScreenState createState() => _NBATeamStatScreenState();
}


class _NBATeamStatScreenState extends State<NBATeamStatScreen>
{



Future<List<NBATeamStat>> mapresponse() async{

 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'v1.formula-1.api-sports.io'
 };

var queryParameters={
                    
                    "id": "${widget.id}",
                     "season": "2020"
};

var baseUrl='https://v2.nba.api-sports.io/teams/statistics';

//var request = http.Request('GET', Uri.parse('https://v1.formula-1.api-sports.io/teams'));
var uri=Uri.parse(baseUrl).replace(queryParameters: queryParameters );
var request = http.Request('GET',uri);

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

List<NBATeamStat> leagues=[];

final data=jsonDecode(await response.stream.bytesToString() );

if(response.statusCode==200)
{
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(NBATeamStat.fromJson(i));
  }
 //   ListView()
 return leagues;
}
else
{
    return leagues;
}
}

@override
  void initState()
  {
    if(_Stats.isEmpty){

  response=mapresponse().then((value){
    setState(() {
      _Stats.addAll(value) ;
  });
  return value;
    }
  );
  super.initState();
    }
  }
  

Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text(widget.title,style: const TextStyle(fontSize: 25),),centerTitle: true,),

body: Column(
  children:[
      Expanded(
  child:

    FutureBuilder(
  future: response,
  builder: (context,AsyncSnapshot<List<NBATeamStat>> snapshot){  
    if(snapshot.hasData)
    {
     // List<Fobj> obj=snapshot.data!;
     return ListView.builder(
        itemCount:_Stats.length,
        itemBuilder: (context, index){
          
      return  InkWell(
    //    onTap: (){onSelectteam(context, index);},
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[

      Text("  Games: ${_Stats[index].games.toString()}",style: const TextStyle(fontSize: 20, color: Colors.black),),
      const SizedBox(height: 13,),
      Text("  Biggest Leads: ${_Stats[index].biggestLead.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Blocks: ${_Stats[index].blocks.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FGM: ${_Stats[index].fgm.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Points: ${_Stats[index].points.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Turnovers: ${_Stats[index].turnovers.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Fast Break Points: ${_Stats[index].fastBreakPoints.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Def Rebs: ${_Stats[index].defReb.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Longest Run: ${_Stats[index].longestRun.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  Points Off Turnover: ${_Stats[index].pointsOffTurnovers.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FGA: ${_Stats[index].fga.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FGP: ${_Stats[index].fgp.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FTA: ${_Stats[index].fta.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FTM: ${_Stats[index].ftm.toString()}",style: const TextStyle(fontSize: 20),),
      const SizedBox(height: 13,),
      Text("  FTP: ${_Stats[index].ftp.toString()}",style: const TextStyle(fontSize: 20),),
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
      
      


          ]
          )
        );
        },);

    }
    else
    if(snapshot.hasError)
    {
          return Text("No data found");
    }
    else
    {
      return   
            const Center(
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