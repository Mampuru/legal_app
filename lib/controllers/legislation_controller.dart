import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../api/api_config.dart';
import '../constants.dart';
import '../models/legislation_model.dart';
import 'package:http/http.dart' as http;

class LegislationController extends GetxController {
  var isLoading = true.obs;
  var legislationList = <Legislation>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLegislation();
  }

  void fetchLegislation() async {
    try {
      isLoading(true);
      // Make API call to Law.Africa API
      final url = Uri.parse('https://api.laws.africa/v2/akn/za-cpt/.json');
      var token = authToken; // Replace 'your_auth_token_here' with your actual token

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Token $token',
        },
      );
      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse response and populate legislationList
        final Map<dynamic,dynamic> responseData = json.decode(response.body);
        logger.i(responseData["results"]);
        List<dynamic> responseList = responseData["results"];

        final List<Legislation> parsedLegislationList = responseList
            .map((item) => Legislation(
          title: item['title'] ?? '',
          description: item['updated_at'] ?? '',
          status: item['publication_name'] ?? '',
        )).toList();

        // Update legislationList with parsed data
        legislationList(parsedLegislationList);
        logger.i(legislationList.length);
      } else {
        // Handle error if the request was not successful
        if (kDebugMode) {
          logger.e(response.statusCode);
          print('Failed to fetch legislation: ${response.statusCode}');
        }
      }
    } catch (error) {
      // Handle any exceptions that occur during the API callz
      logger.e(error);
      if (kDebugMode) {
        print('Error fetching legislation: $error');
      }
    } finally {
      isLoading(false);
    }
  }

}
