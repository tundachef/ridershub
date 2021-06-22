import 'package:flutter/material.dart';

class RegionalZone {
  final String id;
  final String title;
  final String title_ar;
  RegionalZone(
      {@required this.id, @required this.title, @required this.title_ar});

  factory RegionalZone.fromJson({Map<String, dynamic> json}) {
    return RegionalZone(
        id: json['id'], title: json['title'], title_ar: json['title_ar']);
  }
}
