import 'package:flutter/material.dart';
import 'package:products/add_product.dart';
import 'package:products/mn.dart';
import 'package:products/provider.dart';
import 'package:products/widget_main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (_) => MyProvider(),
    child: my(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
        centerTitle: true,
      ),
      body: Widget_Main(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Add_Product()));

        },
        label: Text('Add Product',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        icon: Icon(Icons.add,color: Colors.black,),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
