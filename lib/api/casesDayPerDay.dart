import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class casesPerDay {
  String submissionDate;
  String state;
  String totCases;
  String newCase;
  String totDeath;
  String newDeath;
  String createdAt;
  String consentCases;
  String consentDeaths;

  casesPerDay(
      {this.submissionDate,
        this.state,
        this.totCases,
        this.newCase,
        this.totDeath,
        this.newDeath,
        this.createdAt,
        this.consentCases,
        this.consentDeaths});

  casesPerDay.fromJson(Map<String, dynamic> json) {
    submissionDate = json['submission_date'];
    state = json['state'];
    totCases = json['tot_cases'];
    newCase = json['new_case'];
    totDeath = json['tot_death'];
    newDeath = json['new_death'];
    createdAt = json['created_at'];
    consentCases = json['consent_cases'];
    consentDeaths = json['consent_deaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['submission_date'] = this.submissionDate;
    data['state'] = this.state;
    data['tot_cases'] = this.totCases;
    data['new_case'] = this.newCase;
    data['tot_death'] = this.totDeath;
    data['new_death'] = this.newDeath;
    data['created_at'] = this.createdAt;
    data['consent_cases'] = this.consentCases;
    data['consent_deaths'] = this.consentDeaths;
    return data;
  }
}

Future<casesPerDay> fetchCasesStateUSA() async {
  final response =
  await http.get('https://data.cdc.gov/resource/9mfq-cb36.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(casesPerDay);
    return casesPerDay.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}