import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/legislation_controller.dart';
import '../models/country_model.dart';


class SearchFilterView extends StatefulWidget {
  const SearchFilterView({Key? key}) : super(key: key);

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
    final LegislationController _controller = Get.put(LegislationController());
    late final List<Country> countries; // List of available countries
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
            // Country dropdown
            Obx(() =>
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                value: selectedCountry,
                onChanged: onCountryChanged,
                items: _controller.countryList.map((country) {
                  return DropdownMenuItem<String>(
                    value: country.name,
                    child: Text(country.name),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16.0),
            // Topic dropdown
            // DropdownButtonFormField<String>(
            //   decoration: const InputDecoration(
            //     labelText: 'Topic',
            //     border: OutlineInputBorder(),
            //   ),
            //   value: selectedTopic,
            //   onChanged: onTopicChanged,
            //   items: topics.map((topic) {
            //     return DropdownMenuItem<String>(
            //       value: topic.title,
            //       child: Text(topic.title),
            //     );
            //   }).toList(),
            // ),
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
