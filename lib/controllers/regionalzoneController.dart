import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ridershub/models/regionalzone.dart';

Future<List<RegionalZone>> fetchRegionalZones() async {
  final response = await http.get(
      Uri.encodeFull(
          'https://tasleem.in/api.php?r=v1/service&action=regional_zones'),
      headers: {
        "Content-Type": "application/json",
      });

  List<RegionalZone> results = [];
  var jsonD = json.decode(utf8.decode(response.bodyBytes));
  print(jsonD.toString());
  for (var row in jsonD['data']['regional_zones']) {
    print(row);
    try {
      RegionalZone _zone = RegionalZone.fromJson(json: row);
      results.add(_zone);
    } catch (e) {
      print('FETCH ERROR: $e');
    }

    // break;
  }
  return results;
}
