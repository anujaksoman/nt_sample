import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nt_sample/data/model/nt_new_model.dart';
import 'package:nt_sample/data/repository/home_repository.dart';


class HomeController extends GetxController {

  RxBool homeLoading = false.obs;

  void onInit() {
    super.onInit();
    getHomeDetails();
  }

  HomeRepository repository = HomeRepository();
  Rx<NewsModel> homeData = NewsModel().obs;

  Future<void> getHomeDetails() async {
    homeLoading.value = true;
    var result = await repository.getHomeDetails();
    try {
      if (result.runtimeType.toString() == 'NewsModel') {
        NewsModel data = result;
        homeData.value = data;
        homeLoading.value = false;
        update();
      } else {
        print("Error Occured");
        homeLoading.value = false;
      }
    } catch (e) {
      debugPrint("catch error $e");
    }
    homeLoading.value = false;
  }
}