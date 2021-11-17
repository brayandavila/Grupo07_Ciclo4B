import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Products>> _futureProduct;

  @override
  void initState() {
    super.initState();
    _futureProduct = getProduct();
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Productos'),
        ),
        body: FutureBuilder(
          future: _futureProduct,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: _listProducts(snapshot.data).length,
                itemBuilder: (context, index) {
                  final item = _listProducts(snapshot.data)[index];
                  return item;
                },
              );
            } else if (snapshot.hasError){
              Text('$snapshot.error');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
  }
  List<Widget> _listProducts(data){
    List<Widget> products = [];
    for (var product in data) {
      products.add(
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.name_products),
              ),
            ],
          ),
        ),
      );
    }
    return products;
  }
}

