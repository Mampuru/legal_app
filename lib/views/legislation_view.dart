import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/legislation_controller.dart';
import '../models/legislation_model.dart';

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
          return _.isLoading.value ? const CircularProgressIndicator() : legislationListView(_controller.legislationList);
        },
      ),
    );
  }
}

Widget legislationListView(List legislationList ){
  return ListView.builder(
    itemCount: legislationList.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(legislationList[index].title),
        subtitle: Text(legislationList[index].description),
        trailing: Text(legislationList[index].status),
        onTap: () {
          // Action on tapping the legislation item
          // For instance, navigating to detailed legislation view
          // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedLegislationScreen()));
        },
      );
    },
  );
}