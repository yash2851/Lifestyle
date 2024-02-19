import 'package:get/get.dart';
import '../Model/product_model.dart';
import '../Service/firebase_db.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
