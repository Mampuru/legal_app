import 'package:get/get.dart';
import '../models/legislation_model.dart';

class LegislationController extends GetxController {
  var isLoading = true.obs;
  var legislationList = <Legislation>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLegislation();
  }

  void fetchLegislation() async {
    try {
      isLoading(true);
      // Make API call to Law.Africa API
      // Parse response and populate legislationList
      legislationList(/* populated list */);
    } finally {
      isLoading(false);
    }
  }
}
