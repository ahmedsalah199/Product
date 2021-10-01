import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products/prodacts.dart';
class MyProvider extends ChangeNotifier {
  List<Products> productList = [];
     File? image ;

  void addProduct({required String title,
    required String descreption,
    required double price}) {
    productList.add(Products(
        id: 1,
        title: title,
        descreption: descreption,
        price: price,
        image: image
    ));
    notifyListeners();
  }

  void deleteImage () {
    image = null ;
  }
  void removeProduct (String des) {
    productList.removeWhere((element) => element.descreption ==des );
    notifyListeners();

  }

  getImage(ImageSource src) async {
    final img = await ImagePicker().pickImage(source: src);
    if (img != null) {
      image = File(img.path);
    }
    notifyListeners();

  }
}
