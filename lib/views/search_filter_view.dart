import 'package:flutter/material.dart';
import 'package:legal_app/views/search_filter_comp.dart';

class SearchFilterView extends StatelessWidget {
  const SearchFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? selectedCountry;
    String? selectedTopic;

    void _onCountryChanged(String? value) {
      setState(() {
        selectedCountry = value;
      });
    }

    void _onTopicChanged(String? value) {
      setState(() {
        selectedTopic = value;
      });
    }

    void _onSearchPressed() {
      // Implement your search functionality here
      print('Searching for $selectedCountry - $selectedTopic');
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Screen Title'),
        ),
        body: Column(
          children: [
            SearchAndFilter(
              countries: ['Country 1', 'Country 2', 'Country 3'],
              topics: ['Topic 1', 'Topic 2', 'Topic 3'],
              selectedCountry: selectedCountry,
              selectedTopic: selectedTopic,
              onCountryChanged: _onCountryChanged,
              onTopicChanged: _onTopicChanged,
              onSearchPressed: _onSearchPressed,
            ),
            // Your other widgets here
          ],
        ),
      );
  }
}
