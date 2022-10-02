import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/social_model.dart';

class SocialLinkRepository {
  static Future<List<SocialModel>> getJson() async {
    final res = await rootBundle.loadString('assets/json/data.json');
    final json = jsonDecode(res);

    final social = List.from(json).map((e) {
      return SocialModel.fromJson(e);
    }).toList();
    return social;
  }
}
