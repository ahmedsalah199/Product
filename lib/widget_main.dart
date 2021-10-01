import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products/prodacts.dart';
import 'package:products/provider.dart';
import 'package:provider/provider.dart';

class Widget_Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Products> my_product = Provider.of<MyProvider>(context).productList;
    return my_product.isEmpty
        ? Center(
        child: Text(
          'No Product Selected',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ))
        : Container(
        child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            ),
            children: [
              ...my_product.map((item) {
                return Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.network('https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg'

                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                      ),
                      buildPositioned(
                          'item.title', 'item.descreption', 'item.price'),
                      Positioned(
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.delete,
                          ),
                          backgroundColor: Colors.orange,
                          mini: true,
                          onPressed: (){
                            context.read<MyProvider>().removeProduct(item.descreption);
                          },
                        ),
                        bottom: 10,
                        left: 10,
                      )
                    ],
                  ),
                );
              })
            ]));
  }

  Positioned buildPositioned(title, desc, price) {
    return Positioned(
        bottom: 10,
        right: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: 180,
          color: Colors.black54,
          child: Text(
            '$title\n$desc\n$price',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ));
  }
}
