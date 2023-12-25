import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/legislation_controller.dart';

// ignore: use_key_in_widget_constructors
class LegislationView extends StatelessWidget {
  final LegislationController _controller = Get.put(LegislationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legislation Reader'),
      ),
      body: GetX<LegislationController>(
        init: _controller,
        builder: (_) {
          // Implement UI to display legislation data
          return _.isLoading.value ? const CircularProgressIndicator() : const Placeholder();
        },
      ),
    );
  }
}
