import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widget/cart_product.dart';
import '../Widget/cart_total.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffD7F9FA),
      ),
      body: Column(
        children: [
          CartProducts(),
          CartTotal(),
        ],
      ),
    );
  }
}
