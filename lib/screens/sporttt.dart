// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';


// // if (response.statusCode == 200) {
// //   print(await response.stream.bytesToString());
// // }
// // else {
// //   print(response.reasonPhrase);


// Future<List<dynamic>> fetchLeagues () async {
//   // final apiKey = 'YOUR_API_KEY'; // Replace with your API key
//   // final apiUrl = 'https://api.sportsapi.com/leagues'; // Replace with the API endpoint URL

//   // final response = await http.get(Uri.parse(apiUrl), headers: {
//   //   'Authorization': 'Bearer $apiKey',
//   // });
//   var headers = {
//   'x-rapidapi-key': '52dd1477ab87d7bb29dcfb832b6ee01c',
//   'x-rapidapi-host': 'v3.football.api-sports.io'
// };
// var request = http.Request('GET', Uri.parse('https://v3.football.api-sports.io/leagues'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     // Parse the JSON response
//    var leagues = json.decode(response.toString());
//     print(leagues.length);
//     return leagues;
//   } 
//   else
//    {
//     throw Exception('Failed to load league data');
//   }
// }