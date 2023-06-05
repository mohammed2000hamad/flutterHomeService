
import 'package:get/get.dart';
import 'package:home_service_flutter/model/WorkModel.dart';

import 'ApiService.dart';

class AllWorkController extends GetxController {
  final RxList<WorkModel> works = <WorkModel>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchAllWorks();
  }

  Future<void> fetchAllWorks() async {
    try {
      final fetchedWorks = await apiService.getAllWorks();
      works.value = fetchedWorks;
    } catch (e) {
      print('Failed to fetch works: $e');
    }
  }
}
