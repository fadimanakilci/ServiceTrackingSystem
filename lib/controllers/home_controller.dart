
import 'package:get/state_manager.dart';

class HomeController extends GetxController{
  // Data yükleniyorsa true, yüklenme bittiyse false
  var isLoading = true.obs;
  // Data varsa true, yoksa false
  var isData = false.obs;
  // Bottom App Bar index'i
  var index = 0.obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  // Home Page için gerekli datayların ilgili yerlerden(API, firebase ...)
  // çekilmesini sağlayan asenkron fonksiyon
  Future<void> fetchHomeData() async {
    isLoading.value = false;
    isData.value = true;
  }
}