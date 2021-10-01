import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products/main.dart';
import 'package:products/provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Add_Product extends StatefulWidget {
  @override
  _Add_ProductState createState() => _Add_ProductState();
}
class _Add_ProductState extends State<Add_Product> {
  var TitleControl = TextEditingController()
    ..text = '';
  var DesControl = TextEditingController()
    ..text = '';
  var PriceControl = TextEditingController()
    ..text = '';
  @override
  Widget build(BuildContext context) {
    File? img = Provider.of<MyProvider>(context, listen: true).image  ;

    return  WillPopScope(
        onWillPop: ()async =>
       await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> MyHomePage())),
    child : MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: TitleControl,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: DesControl,
              decoration: InputDecoration(
                labelText: 'Descreption',
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: PriceControl,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Choose Image'),
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(),
                          Container(
                            color: Colors.teal,
                            child:
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Camera'),
                              onTap: () {
                                context.read<MyProvider>().getImage(
                                    ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            color: Colors.teal,
                            child:
                            ListTile(
                              leading: Icon(Icons.photo_camera_back),
                              title: Text('Gallary'),
                              onTap: () {
                                context.read<MyProvider>().getImage(
                                    ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<MyProvider>(
              builder: (cn, value, child) =>
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.orange)),
                    onPressed: () async{
                      if (TitleControl.text == '' ||
                          DesControl.text == '' ||
                          PriceControl.text == '') {
                        Fluttertoast.showToast(msg: 'Add All Feild');
                      }else if(img == null) {
                        Fluttertoast.showToast(msg: 'choose image');

                      }
                      else {
                        value.addProduct(
                          title: TitleControl.text,
                          descreption: DesControl.text,
                          price: double.parse(PriceControl.text),
                        );
                        value.deleteImage();
                      await  Navigator.of(cn).push(MaterialPageRoute(builder: (context)=>MyHomePage()));

                      }
                    },
                    child: Text(
                      'Add Product',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
