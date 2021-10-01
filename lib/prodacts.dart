import 'dart:io';
import 'package:image_picker/image_picker.dart';
class Products {
  int id ;
  String title ;
  String descreption ;
  double price ;
  var image ;
  Products({
    required this.id,
    required this.title,
    required this.descreption,
    required this.price,
    required this.image
});
}