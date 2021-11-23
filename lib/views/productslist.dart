import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'package:flutter_proyecto/views/businessview.dart';
import 'package:flutter_proyecto/views/productview.dart';

class Productslist extends StatefulWidget {
  const Productslist({Key? key}) : super(key: key);

  @override
  _ProductslistState createState() => _ProductslistState();
}

class _ProductslistState extends State<Productslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: getProduct(),
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
    );
  }

  List<Widget> _listProducts(data) {
    List<Widget> products = [];
    for (var product in data) {
      var precio = product.priceProducts;
      var precio2 = r'$' '$precio';
      var productData = [product.idProducts, product.nameProducts, product.idBusinessProducts, product.priceProducts];
      products.add(
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          margin: const EdgeInsets.all(10),
          elevation: 8,
          child: Column(
            children: <Widget>[        
              Column(
                children: [
                  ListTile(
                    title: Text(product.nameProducts),
                    subtitle: Text(precio2),
                    leading: GestureDetector(
                      onTap: (){
                        var idB = [product.idBusinessProducts, 'Falta traer Business'];
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Businessview(idB)));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network('https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg'),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Image.network('https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg')
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          TextButton(
                            onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Productview(productData)));
                            }, 
                            child: const Text('VER'),
                          ),
                          TextButton(
                            onPressed: (){}, 
                            child: const Text('AGREGAR'),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.favorite, color: Colors.red,),
                          SizedBox(width: 5,),
                          Icon(Icons.share),
                          SizedBox(width: 5,),
                        ],
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 15,)
                ],
              )
            ],
          ),
        ),
      );
    }
    return products;
  }
}
