import 'package:flutter/material.dart';

import "package:http/http.dart" as http;
import 'package:sportstracker/key.dart';
import 'dart:convert';
import 'package:sportstracker/models/circuit.dart';
import 'package:sportstracker/screens/circuitdetailscreen.dart';

 List<Circuit> circuits=[];
 Future<List<Circuit>> response=[] as  Future<List<Circuit>>;
class FormulaCircuitScreen extends StatefulWidget
{

 const FormulaCircuitScreen({super.key });

@override
 _FormulaCircuitScreenState createState() => _FormulaCircuitScreenState();
}

class _FormulaCircuitScreenState extends State<FormulaCircuitScreen>
{



Future<List<Circuit>> mapresponse() async{

 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'api-formula-1.p.rapidapi.com'
 };

var request = http.Request('GET', Uri.parse('https://v1.formula-1.api-sports.io/circuits'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

List<Circuit> leagues=[];

final data=jsonDecode(await response.stream.bytesToString() );

if(response.statusCode==200)
{
  
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(Circuit.fromJson(i));
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
    if(circuits.isEmpty){
 response = mapresponse().then((value){
    setState(() {
      circuits.addAll(value) ;
     });
   return value;
    }
  );
  super.initState();
    }
  }
  
void onSelectCircuits(context,selectedcircuit)
{
  Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) {
   return CircuitDetailScreen(circuit:selectedcircuit );
  },));
}
    

  
@override
Widget build(BuildContext context)
 {
    return Scaffold(
      backgroundColor: Colors.black,
    appBar: AppBar(
                   title: const Text('F1 circuits',style:TextStyle(color: Color.fromARGB(255, 243, 243, 243))),
                   centerTitle: true,backgroundColor: Colors.black, ),


body: Column(
  children:[
      Expanded(
  child:

    FutureBuilder(
  future: response,
  builder: (context,AsyncSnapshot<List<Circuit>> snapshot){  

    if(snapshot.hasData)
    {
    
     return ListView.builder(
        itemCount: circuits.length,
        itemBuilder: (context, index){
          
      return  InkWell(
        
        onTap: (){onSelectCircuits(context, circuits[index]);},
          child:Container(
            //height: MediaQuery.of(context).size.height/6,
            margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),

            decoration:  BoxDecoration( //color: Color.fromARGB(255, 164, 5, 5),
            gradient: LinearGradient(colors: [ 
              const Color.fromARGB(255, 255, 73, 60).withOpacity(0.9),
            const Color.fromARGB(255, 126, 2, 2),  
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),
            borderRadius: const BorderRadius.all(Radius.circular(11.0))
            ),
            padding:const EdgeInsets.symmetric(horizontal: 11),
            child:
           Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
                         const SizedBox(height: 13,),
                      Text(circuits[index].name.toString(),style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Color.fromARGB(255, 229, 229, 229))),
                      const SizedBox(height: 6,),
                      
                             Text("Lap record: ${circuits[index].lapRecord.toString()}",style: const TextStyle(fontSize: 13,color: Color.fromARGB(255, 255, 255, 255))),
                             const SizedBox(height: 25,),
                             
                            
                     ]
           ))
        );
        
        },);

    }
    else
    if(snapshot.hasError)
    {
      print(snapshot.error);
          return const Text("No data found",style: TextStyle(color: Colors.white),);
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
