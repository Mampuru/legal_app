import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_app/views/search_filter_comp.dart';

import '../controllers/legislation_controller.dart';

class SearchFilterView extends StatefulWidget {
  const SearchFilterView({Key? key}) : super(key: key);

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
    final LegislationController _controller = Get.put(LegislationController());
    String? selectedCountry;
    String? selectedTopic;

    @override
    void initState() {
      super.initState();
      _controller.fetchCountries();
    }

    void onCountryChanged(String? value) {
      setState(() {
        selectedCountry = value;
      });
    }

    void onTopicChanged(String? value) {
      setState(() {
        selectedTopic = value;
      });
    }

    void onSearchPressed() {
      // Implement your search functionality here
      if (kDebugMode) {
        print('Searching for $selectedCountry - $selectedTopic');
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            Obx(() => SearchAndFilter(
              countries: _controller.countryList,
              topics: _controller.tocList,
              selectedCountry: selectedCountry,
              selectedTopic: selectedTopic,
              onCountryChanged: onCountryChanged,
              onTopicChanged: onTopicChanged,
              onSearchPressed: onSearchPressed,
            )),
          ],
        ),
      );
  }
}
