import 'package:flutter/material.dart';
import 'package:sportstracker/screens/formulascreendetails.dart';
import 'package:sportstracker/models/formulaleagues.dart';
import "package:http/http.dart" as http;
import 'package:sportstracker/key.dart';
import 'dart:convert';
 List<Fobj> _leagues=[];
 Future<List<Fobj>> response=[] as  Future<List<Fobj>> ;
class FormulaScreen extends StatefulWidget
{

 const FormulaScreen({super.key });

@override
 _FormulaScreenState createState() => _FormulaScreenState();
}

class _FormulaScreenState extends State<FormulaScreen>
{



Future<List<Fobj>> mapresponse() async{

 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'v1.formula-1.api-sports.io'
 };

var request = http.Request('GET', Uri.parse('https://v1.formula-1.api-sports.io/teams'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

List<Fobj> leagues=[];

final data=jsonDecode(await response.stream.bytesToString() );

if(response.statusCode==200)
{
  
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(Fobj.fromJson(i));
  }
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
    if(_leagues.isEmpty){
 response = mapresponse().then((value){
    setState(() {
      _leagues.addAll(value) ;
     });
   return value;
    }
  );
  super.initState();
    }
  }
  

 void onSelectteam(context,index){
   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>FormulaScreenDetails(details: _leagues[index])));
 }

    

  
//@override
Widget build(BuildContext context)
 {
    return Scaffold(
      backgroundColor: Colors.black,
    appBar: AppBar(
                   title: const Text('F1 teams',style:TextStyle(color: Color.fromARGB(255, 243, 243, 243))),
                   centerTitle: true,backgroundColor: Colors.black, ),


body: Column(
  children:[
      Expanded(
  child:

    FutureBuilder(
  future: response,
  builder: (context,AsyncSnapshot<List<Fobj>> snapshot){  

    if(snapshot.hasData)
    {
    
     return ListView.builder(
        itemCount:_leagues.length,
        itemBuilder: (context, index){
          
      return  InkWell(
        
        onTap: (){onSelectteam(context, index);},
          child:Container(
            height: MediaQuery.of(context).size.height/7.3,
            margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),

            decoration: const BoxDecoration( color: Color.fromARGB(255, 131, 6, 6),
            borderRadius: BorderRadius.all(Radius.circular(4.0))
            
            ),
            child:
           Column( 
            children:[
                         const SizedBox(height: 13,),
                      Text(_leagues[index].name.toString(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: const Color.fromARGB(255, 255, 255, 255))),
                      const SizedBox(height: 6,),
                      
                             Text("Engine: ${_leagues[index].engine.toString()}",style: const TextStyle(fontSize: 13,color: Color.fromARGB(255, 255, 255, 255))),
                             const SizedBox(height: 1,),
                             Text("World Championships: ${_leagues[index].worldChampionships.toString()}",style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 252, 248, 248))),
                             const SizedBox(height: 4,),
                            
                     ]
           ))
        );
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
                       child:  CircularProgressIndicator()
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
