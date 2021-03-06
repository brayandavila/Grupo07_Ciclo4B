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
        title: const Text('Productos', style: TextStyle(color: Colors.white70),),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
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
          color: Colors.transparent,
          margin: const EdgeInsets.all(10),
          elevation: 0,
          child: Column(
            children: <Widget>[        
              Column(
                children: [
                  ListTile(
                    title: Text(product.nameProducts, style: const TextStyle(color: Colors.white70),),
                    subtitle: Text(precio2, style: const TextStyle(color: Colors.green),),
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
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg'),
                    ),
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
                            onPressed: (){
                              cart(productData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Producto agregado con ??xito'),                                  
                                ),
                              );
                            }, 
                            child: const Text('AGREGAR'),
                          ),
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
