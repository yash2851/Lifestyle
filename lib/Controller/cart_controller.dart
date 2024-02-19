import 'package:get/get.dart';

import '../Model/product_model.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total {
    return _products.entries
        .map((product) {
          print(product.value);
          print(product.key.price);
          print(product.value.toInt() * int.parse(product.key.price));
          return product.value.toInt() * int.parse(product.key.price);
        })
        .toList()
        .reduce((value, element) => value + element);
  }
}
