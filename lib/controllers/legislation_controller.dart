import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:legal_app/models/country_model.dart';
import '../api/api_config.dart';
import '../constants.dart';
import '../models/legislation_model.dart';
import 'package:http/http.dart' as http;

class LegislationController extends GetxController {
  var isLoading = true.obs;
  var legislationList = <Legislation>[].obs;
  var countryList = <Country>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLegislation();
  }

  void fetchLegislation() async {
    String country = "za-cpt";
    try {
      isLoading(true);
      // Make API call to Law.Africa API
      final url = Uri.parse('$baseUrl/akn/$country/.json');
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
        // logger.i(responseData["results"]);
        List<dynamic> responseList = responseData["results"];

        final List<Legislation> parsedLegislationList = responseList
            .map((item) => Legislation(
          title: item['title'] ?? '',
          description: item['updated_at'] ?? '',
          status: item['publication_name'] ?? '',
        )).toList();

        // Update legislationList with parsed data
        legislationList(parsedLegislationList);
      } else {
        // Handle error if the request was not successful
        if (kDebugMode) {
          print('Failed to fetch legislation: ${response.statusCode}');
        }
      }
    } catch (error) {
      // Handle any exceptions that occur during the API callz
      if (kDebugMode) {
        print('Error fetching legislation: $error');
      }
    } finally {
      isLoading(false);
    }
  }


  void fetchCountries() async {
    try {
      isLoading(true);
      // Make API call to Law.Africa API
      final url = Uri.parse('$baseUrl/countries.json');
      var token = authToken; // Replace 'your_auth_token_here' with your actual token

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Token $token',
        },
      );
      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse response and populate CountryList
        final Map<dynamic,dynamic> responseData = json.decode(response.body);
        logger.i(responseData["results"]);
        List<dynamic> responseList = responseData["results"];

        final List<Country> parsedCountryList = responseList
            .map((item) => Country(
          name: item['name'] ?? '',
          code: item['code'] ?? '',
          localities: item['localities'] ?? '',
        )).toList();

        // Update CountryList with parsed data
        countryList(parsedCountryList);
        logger.i(countryList.length);
      } else {
        // Handle error if the request was not successful
        if (kDebugMode) {
          print('Failed to fetch legislation: ${response.statusCode}');
        }
      }
    } catch (error) {
      // Handle any exceptions that occur during the API callz
      if (kDebugMode) {
        print('Error fetching legislation: $error');
      }
    } finally {
      isLoading(false);
    }
  }

}
