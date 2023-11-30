import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payhub/src/features/features/dashboard/model.dart';

import '../../../core/api_service/api_provider.dart';
import '../../../core/api_service/helper.dart';

class HomeController extends GetxController{

  RxList<DetailsModel> detailsModel = <DetailsModel>[].obs;
  int selectedCategoryId = 0;

  final RxString searchQuery = ''.obs;
  List<DetailsModel> originalData = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await homeFetchData();
  }

  Future<void> homeFetchData() async {
    String baseUrl = Helper().baseUrl;
    try {
      final response = await ApiProvider().sendGetApi(baseUrl);
      if (kDebugMode) {
        print('response==$response');
      }
      if (response.statusCode == 200) {
        originalData = List<DetailsModel>.from(jsonDecode(response.body).map((item) => DetailsModel.fromJson(item)));
        detailsModel.assignAll(originalData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  final RxString currentSearchQuery = ''.obs;


  void filterByName(String nameQuery) {

    final lowerCaseQuery = nameQuery.toLowerCase();

    if (nameQuery.isNotEmpty) {
      final filteredList = originalData
          .where((item) => item.name != null && item.name!.toLowerCase().contains(lowerCaseQuery))
          .toList();
      detailsModel.assignAll(filteredList);
    } else {
      detailsModel.assignAll(originalData);
    }
  }



}