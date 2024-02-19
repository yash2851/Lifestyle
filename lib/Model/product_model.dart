import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String des;
  final String price;
  final String imageUrl;

  const Product({
    required this.name,
    required this.des,
    required this.price,
    required this.imageUrl,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      des: snap['des'],
      price: snap['price'],
      imageUrl: snap['image'],
    );
    return product;
  }
}
