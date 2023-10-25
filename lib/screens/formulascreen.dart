import 'package:flutter/material.dart';
import 'package:sportstracker/screens/formulascreendetails.dart';
import 'package:sportstracker/models/formulaleagues.dart';
import "package:http/http.dart" as http;
import 'package:sportstracker/key.dart';
import 'dart:convert';

//List to store the objects of the type Fobj, declared globally so that it remains stored even when the setstate is called
List<Fobj> _leagues=[];

// response to store the Future list which is to sent into the future object
Future<List<Fobj>> response=[] as  Future<List<Fobj>> ;

class FormulaScreen extends StatefulWidget
{
  //no input parameters to the class
 const FormulaScreen({super.key });

@override
 _FormulaScreenState createState() => _FormulaScreenState();
}

class _FormulaScreenState extends State<FormulaScreen>
{

Future<List<Fobj>> mapresponse() async{     //map response to make a GET request which will return a future object

//headers are set for a GET request
 var headers = 
 {
  'x-rapidapi-key': key,
  'x-rapidapi-host': 'v1.formula-1.api-sports.io'
 };

var request = http.Request('GET', Uri.parse('https://v1.formula-1.api-sports.io/teams'));

request.headers.addAll(headers);       //adding all the adders to the request

http.StreamedResponse response = await request.send();

List<Fobj> leagues=[];             //List to store all the incoming objects

final data=jsonDecode(await response.stream.bytesToString());  

if(response.statusCode==200)                     //condition to check the status of the response
{
  
  for(Map<String,dynamic> i in data['response'])
  {
    leagues.add(Fobj.fromJson(i));
  }
 return leagues;     // list containing all the instances are returned in case the statuscode==200, else Empty list is returned
}
else
{
    return leagues;
}
}


@override
  void initState()               //mapreponse is called inside initState to make sure the mapresponse is called only in the beginning of the program
  {
    if(_leagues.isEmpty){               //so again mapresponse is only called wwhen the _leagues is empty, implies the call is happening only for the first time after the program has started
 response = mapresponse().then((value){
    setState(() {
      _leagues.addAll(value) ;    //copy all the values from the value(list<Fobj>) to _leagues
     });
   return value;               //return the values so that it is stored in Future<list<Fobj>>
    }
  );
  super.initState();
    }
  }
  
// Navigator to change the screen as and when the function is called. FormulaScreen -> FormulaScreenDetail

 void onSelectteam(context,index){
   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>FormulaScreenDetails(details: _leagues[index])));
 }

    

  
@override  
Widget build(BuildContext context)
 {
   //Scaffold is used to form the screen
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
                   title: const Text('F1 teams',style:TextStyle(color: Color.fromARGB(255, 243, 243, 243))),
                   centerTitle: true,backgroundColor: Colors.black, ),


body: Column(                        //Column Widget is return
    children:[
         Expanded(                //used Expanded to allow the Widget to take all the available space
              child:
                FutureBuilder(                    //FutureBuilder is used to construct the body,from the response obtained after the GET request
                future: response,
                builder: (context,AsyncSnapshot<List<Fobj>> snapshot){  

    if(snapshot.hasData)                             //condition to check whether the response has data or error or its waiting to receive the data
    {
    
     return ListView.builder(                    //ListView is called to construct the list
        itemCount:_leagues.length,               //count will set to the number of elements in the list
        itemBuilder: (context, index){
      return  InkWell(                                 //InkWell function is used to create reactive buttons
        onTap: (){onSelectteam(context, index);},          //onSelectteam is passed to ontap, so tht it is called when the button is pressed
          child:Container(
            height: MediaQuery.of(context).size.height/6.8,                  //MediaQuery is used to set the height of the container
            margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),       //appropriate margin is set to improve the UI

            decoration: BoxDecoration(                           //Linear Gradient is added to the boxes
            gradient: LinearGradient(
              colors: [ 
             const Color.fromARGB(255, 255, 73, 60).withOpacity(0.9),
             const Color.fromARGB(255, 126, 2, 2),  
                      ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),
            borderRadius: const BorderRadius.all(Radius.circular(11.0))             //Borderradius is set to make the boxes circular at the corners
            ),
            padding:const EdgeInsets.symmetric(horizontal: 11),
            child:
           Column(                                          //column is includded so that the elements inside the conatiner are one below another
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[                             //All input are set inside the list passed to children
                          const SizedBox(height: 13,),
                          Text(_leagues[index].name.toString(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: const Color.fromARGB(255, 229, 229, 229))),
                          const SizedBox(height: 6,),
                          Text("Engine: ${_leagues[index].engine.toString()}",style: const TextStyle(fontSize: 13,color: Color.fromARGB(255, 255, 255, 255))),
                          const SizedBox(height: 1,),
                          Text("World Championships: ${_leagues[index].worldChampionships.toString()}",style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 252, 248, 248))),
                          const SizedBox(height: 4,),
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
