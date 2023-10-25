import 'package:flutter/material.dart';
import 'package:sportstracker/models/formulaleagues.dart';


class FormulaScreenDetails extends StatelessWidget
{
const FormulaScreenDetails(
  {
super.key,required this.details
});
final Fobj details;//
@override
Widget build(BuildContext context)
{
  return Scaffold(

    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text(details.name.toString(),style:const  TextStyle(color: Colors.white,fontSize: 27),),
      centerTitle: true,
       elevation: 5,
    ),

body:  ListView.builder(
  itemCount: 1,
      itemBuilder: (context, index) { 
      return InkWell(child: Column(
    
    children: [               
         const SizedBox(height: 4,),
                  //
                      Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,           //
                              ),
  width: 410,
  height: 250,
  child: Image.network(
    details.logo.toString(),
    fit: BoxFit.contain,
  ),
),
const Center(child: Text("President:",style: TextStyle(fontSize: 17),)),
                Center(child: Text(details.president.toString(),
                                       style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black),),),

                  const Center(child: Text("Director:",style: TextStyle(fontSize: 17),)),
                Center(child: Text(details.director.toString(),
                                       style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black),),),

const SizedBox(height: 7,),
  
                      Text("Worldchampionships: ${details.worldChampionships.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("fastestlap: ${details.fastestLaps.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("Engine: ${details.engine.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("First team Entry: ${details.firstTeamEntry.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("Chassis: ${details.chassis.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("Base: ${details.base.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("PoleFinishes: ${details.polePositions.toString()}",style:Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("Fastest Lap: ${details.fastestLaps.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("Tyres: ${details.tyres.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                      Text("Technical Manager: ${details.technicalManager.toString()}",style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 9,),
                             ]
                           )
                      );
                    },
           )
          );
        }
}