import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Products>> _futureProduct;

  Future<List<Products>> _getProduct() async {
    final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbyTPUvDMYPXyv2CIkAq6jf1_1RCtb7tPghjkGMO1lUczdZW-N8q/exec?&acc=1&tbl=Products'));
    List<Products> product = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for(var item in jsonData["data"]){
        product.add(
          Products(
              item["id_products"],
              item["name_products"],
              item["id_business_products"],
              item["price_products"])
        );
      }
      print(product);
      return product;
    } else {
      throw Exception('Falló');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureProduct = _getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Productos'),
        ),
        body: FutureBuilder(
          future: _futureProduct,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView(
                children: _listProducts(snapshot.data),
              );
            } else if (snapshot.hasError){
              print(snapshot.error);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
  List<Widget> _listProducts(data){
    List<Widget> products = [];
    for (var product in data) {
      products.add(
        Text(product.name_products),
      );
    }
    return products;
  }
}

