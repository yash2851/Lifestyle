import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/production_controller.dart';
import '../controller/cart_controller.dart';

class CatalogProducts extends StatefulWidget {
  CatalogProducts({Key? key}) : super(key: key);

  @override
  State<CatalogProducts> createState() => _CatalogProductsState();
}

class _CatalogProductsState extends State<CatalogProducts> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogProductCard(index: index);
            }),
      ),
    );
  }
}

class CatalogProductCard extends StatefulWidget {
  final int index;

  CatalogProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CatalogProductCard> createState() => _CatalogProductCardState();
}

class _CatalogProductCardState extends State<CatalogProductCard> {
  final cartController = Get.put(CartController());

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              productController.products[widget.index].imageUrl,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productController.products[widget.index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('${productController.products[widget.index].price}'),
            ],
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
            onPressed: () {
              cartController
                  .addProduct(productController.products[widget.index]);
            },
            icon: Icon(
              Icons.add_circle,
            ),
          ),
        ],
      ),
    );
  }
}
