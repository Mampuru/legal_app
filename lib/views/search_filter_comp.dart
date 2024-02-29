import 'package:flutter/material.dart';
import 'package:legal_app/models/country_model.dart';

import '../models/toc_model.dart';

class SearchAndFilter extends StatelessWidget {
  final List<Country> countries; // List of available countries
  final List<TOC> topics; // List of available topics
  final String? selectedCountry; // Currently selected country
  final String? selectedTopic; // Currently selected topic
  final ValueChanged<String?> onCountryChanged; // Callback when country selection changes
  final ValueChanged<String?> onTopicChanged; // Callback when topic selection changes
  final VoidCallback onSearchPressed; // Callback when search button is pressed

  const SearchAndFilter({
    Key? key,
    required this.countries,
    required this.topics,
    this.selectedCountry,
    this.selectedTopic,
    required this.onCountryChanged,
    required this.onTopicChanged,
    required this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Country dropdown
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Country',
              border: OutlineInputBorder(),
            ),
            value: selectedCountry,
            onChanged: onCountryChanged,
            items: countries.map((country) {
              return DropdownMenuItem<String>(
                value: country.name,
                child: Text(country.name),
              );
            }).toList(),
          ),
          const SizedBox(height: 16.0),
          // Topic dropdown
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Topic',
              border: OutlineInputBorder(),
            ),
            value: selectedTopic,
            onChanged: onTopicChanged,
            items: topics.map((topic) {
              return DropdownMenuItem<String>(
                value: topic.title,
                child: Text(topic.title),
              );
            }).toList(),
          ),
          const SizedBox(height: 16.0),
          // Search button
          ElevatedButton(
            onPressed: onSearchPressed,
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
