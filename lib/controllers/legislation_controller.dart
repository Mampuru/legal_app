import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:legal_app/models/country_model.dart';
import 'package:legal_app/models/toc_model.dart';
import '../api/api_config.dart';
import '../constants.dart';
import '../models/legislation_model.dart';
import 'package:http/http.dart' as http;

import '../models/localities_model.dart';

class LegislationController extends GetxController {
  var isLoading = true.obs;
  var legislationList = <Legislation>[].obs;
  var countryList = <Country>[].obs;
  var tocList = <TOC>[].obs;
  var localityList = <Locality>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLegislation();
    fetchTableOfContent();
  }

  void fetchLegislation() async {
    //TODO make the country variable a parameter
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
        // logger.i(responseData["results"]);
        List<dynamic> responseList = responseData["results"];

        final List<Country> parsedCountryList = responseList
            .map((item) => Country(
          name: item['name'] ?? '',
          code: item['code'] ?? '',
          localities: item['localities'] ?? '',
        )).toList();

        // Update CountryList with parsed data
        countryList(parsedCountryList);
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

  //Extracts localities for the fetch countries response
  void fetchLocality(List<dynamic> localities){
    try{
      final List<Locality> parsedLocalityList = localities
          .map((item) => Locality(
        name: item['name'] ?? '',
        code: item['code'] ?? '',
        frbrUriCode: item['frbr_uri_code'] ?? '',
      )).toList();

      // Update localityList with parsed data
      localityList(parsedLocalityList);

    } catch (error) {
      // Handle any exceptions that occur during the API callz
      if (kDebugMode) {
        print('Error fetching legislation: $error');
      }
    }
  }

  //TODO complete this late only works when country,locality,Writing,Expression are selected
  void fetchTableOfContent() async {
    String country = "za-cpt";
    try {
      isLoading(true);
      final url = Uri.parse('https://api.laws.africa/v2/akn/za-cpt');
      var token = authToken;

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
        List<dynamic> responseList = responseData["results"];
        // final List<TOC> parsedTOCList = responseList
        //     .map((item) => Country(
        //   name: item['name'] ?? '',
        //   code: item['code'] ?? '',
        //   localities: item['localities'] ?? '',
        // )).toList();

        // Update CountryList with parsed data
        // tocList(parsedTOCList);
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

