import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'package:flutter_proyecto/views/pay.dart';

int total = 0;

class Orders extends StatefulWidget {
  const Orders({ Key? key }) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: const Color(0xffF4A53C),
            foregroundColor: Colors.black,
            onPressed: () {
              if (totalito != 0){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Pay()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Debes agregar algún producto para poder continuar'),                                  
                  ),
                );
              }           
            },
            label: Text('Continuar por $totalito'),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
        title: const Text(
          'Pedido en curso',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getOrder(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {        
                  return ListView.builder(
                    itemCount: _listProducts(snapshot.data).length,
                    itemBuilder: (context, index) {
                      final item = _listProducts(snapshot.data)[index];
                      return item;
                    },
                  );
                } else if (snapshot.hasError) {
                  Text('$snapshot.error');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  List<Widget> _listProducts(data) {
    List<Widget> products = [];
    for (var product in data) {
      int precio = product.priceProducts;
      total = total + precio;
      var precio2 = r'$' '$precio';
      products.add(
        Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  ListTile(
                    title: Text(
                      product.nameProducts,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    subtitle: Text(
                      precio2,
                      style: const TextStyle(color: Colors.green),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {   
                        deleteProduct(product.idProducts);  
                        setState(() {});                
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return products;
  }
}
