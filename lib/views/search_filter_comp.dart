import 'package:flutter/material.dart';

class SearchAndFilter extends StatelessWidget {
  final List<String> countries; // List of available countries
  final List<String> topics; // List of available topics
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Country dropdown
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
              ),
              value: selectedCountry,
              onChanged: onCountryChanged,
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 16.0),
          // Topic dropdown
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Topic',
                border: OutlineInputBorder(),
              ),
              value: selectedTopic,
              onChanged: onTopicChanged,
              items: topics.map((topic) {
                return DropdownMenuItem<String>(
                  value: topic,
                  child: Text(topic),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 16.0),
          // Search button
          Expanded(
            child: ElevatedButton(
              onPressed: onSearchPressed,
              child: Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}
