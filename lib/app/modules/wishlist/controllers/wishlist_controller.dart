import 'package:get/get.dart';

class WishlistController extends GetxController {
  //TODO: Implement WishlistController
  RxList wishlist = <Map<String, dynamic>>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
