import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class AllCases {
  final double cases;
  final double active;
  final double deaths;
  final double recovered;

  AllCases({this.cases, this.active, this.deaths, this.recovered});

  factory AllCases.fromJson(Map<String, dynamic> json) {
    return AllCases(
       
        cases: json['cases'],
        active: json['active'],
        deaths: json['deaths'],
        recovered: json['recovered']);
  }


}

Future<AllCases> fetchCases() async {
  final response =
      await http.get('https://disease.sh/v3/covid-19/countries/usa');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    AllCases test = AllCases.fromJson(json.decode(response.body));


    return AllCases.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
