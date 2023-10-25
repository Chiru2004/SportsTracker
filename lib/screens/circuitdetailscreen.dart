import 'package:flutter/material.dart';
import 'package:sportstracker/models/circuit.dart';
import 'package:sportstracker/widgets/circuitdetail.dart';

//This Class will return a Scaffold which will be the screen for Circuit details
class CircuitDetailScreen extends StatelessWidget
{

  //Constructor taking on parameter as object of the type Circuit
const CircuitDetailScreen({super.key, required this.circuit});
final Circuit circuit;

@override
Widget build(BuildContext context) {

//Class return a Scaffold wiget wgich makes up the screen
return Scaffold(
             
              backgroundColor: const Color.fromARGB(255, 255, 255, 255), //Set the backgrounf color to white

              appBar: AppBar(title: Text(circuit.name.toString(),
                            style: const TextStyle(color: Colors.white),),
                            backgroundColor: Colors.black,
                            ),

               //Listview builder is used to return the content             
              body: ListView.builder(
      
                                    itemCount: 1,         //count is set to 1 as we need to use this builder only once
                                    itemBuilder: (context, index) { 
                        //Inside the Listview we are returning a InkWell Widget. 
                          return InkWell(
                            child: Column(                                         //Column Widget is used, because the output should be one below one another
                                    children: [
                                       const SizedBox(height: 4,),
                                       //Container Widget is used to return a team  logo within it
                                       Container(
                                  decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                            width: 410,    
                            height: 250,
                           child: Image.network(                            //since image is of the format URL, we use network inmage Widget
                           circuit.image.toString(),                           //.toString() is used to convert String? to String
                           fit: BoxFit.contain,                              //Boxfit.contain is used to fit the image within the box
                                ),
                            ),

            CircuitDetail(title: "  Length", content: circuit.length.toString()),              //CircuitDetail widget is called to output the details
            CircuitDetail(title: "  Capacity", content: circuit.capacity.toString()),
            CircuitDetail(title: "  Race Distance", content: circuit.raceDistance.toString()),
            CircuitDetail(title: "  Laps",content: circuit.laps.toString(),),
            CircuitDetail(title: "  First Grand Prix", content: circuit.firstGrandPrix.toString()),
            CircuitDetail(title: "  Opened", content: circuit.opened.toString()),
           
                     ],
                   )
                 );
               },
            ),
          );
        }
}
