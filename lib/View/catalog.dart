import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Service/firebase_db.dart';
import '../Widget/catalog_product.dart';
import 'cart.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => CartScreen()),
              icon: Icon(
                Icons.shopping_cart,
                size: 20,
                color: Colors.black,
              ))
        ],
        backgroundColor: Color(0xffD7F9FA),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogProducts(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductDialog(context),
        child: Icon(
          Icons.add,
          size: 25,
          color: Colors.black,
        ),
        backgroundColor: Color(0xffD7F9FA),
      ),
    );
  }

  void _showAddProductDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    TextEditingController descriptionController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Product'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: InputDecoration(labelText: 'Image'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'price'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await FirestoreDB().addProducts(
                    nameController.text,
                    descriptionController.text,
                    imageUrlController.text,
                    priceController.text);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
