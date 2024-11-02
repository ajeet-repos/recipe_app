import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/models/creator/popular_creator_response.dart';

class PopularCreatorRepository {

  Future<PopularCreatorResponse> FetchPopularCreators() async {

    final String apiResponse = await rootBundle.loadString('assets/popular_creators.json');

    return PopularCreatorResponse.fromMap(json.decode(apiResponse));
  }
}