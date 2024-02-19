import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class CartTotal extends StatefulWidget {
  CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${controller.total.toString()}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffD7F9FA),
          ),
        ),
      ),
    );
  }
}
