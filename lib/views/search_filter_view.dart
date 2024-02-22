import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:legal_app/views/search_filter_comp.dart';

class SearchFilterView extends StatefulWidget {
  const SearchFilterView({Key? key}) : super(key: key);

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
    String? selectedCountry;
    String? selectedTopic;

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
        appBar: AppBar(
          title: const Text('Your Screen Title'),
        ),
        body: Column(
          children: [
            SearchAndFilter(
              countries: const ['Country 1', 'Country 2', 'Country 3'],
              topics: const ['Topic 1', 'Topic 2', 'Topic 3'],
              selectedCountry: selectedCountry,
              selectedTopic: selectedTopic,
              onCountryChanged: onCountryChanged,
              onTopicChanged: onTopicChanged,
              onSearchPressed: onSearchPressed,
            ),
            // Your other widgets here
          ],
        ),
      );
  }
}
