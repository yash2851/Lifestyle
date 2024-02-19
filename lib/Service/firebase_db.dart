import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/product_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  addProducts(name, des, image, price) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc()
        .set({'name': name, 'des': des, 'image': image, 'price': price});
  }
}
