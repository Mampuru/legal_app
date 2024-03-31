import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_app/views/pdf_view.dart';
import 'package:legal_app/views/search_filter_view.dart';
import '../controllers/legislation_controller.dart';

// ignore: use_key_in_widget_constructors
class LegislationView extends StatelessWidget {
  final LegislationController _controller = Get.put(LegislationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SearchFilterView(),
          SizedBox(
            height: 400,
            child: GetX<LegislationController>(
              init: _controller,
              builder: (_) {
                // Implement UI to display legislation data
                return _.isLoading.value ? const CircularProgressIndicator() : legislationListView(_controller.legislationList);
              },
            ),
          ),
        ],
      )
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
        trailing: Text(legislationList[index].publicationDate),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PDFView()));
        },
      );
    },
  );
}