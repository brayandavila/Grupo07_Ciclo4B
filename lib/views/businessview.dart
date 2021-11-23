import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'package:flutter_proyecto/views/productview.dart';

class Businessview extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final idB;
  const Businessview(this.idB, {Key? key}) : super(key: key);
  @override
  _BusinessviewState createState() => _BusinessviewState();
}

class _BusinessviewState extends State<Businessview> {
  
  @override
  Widget build(BuildContext context) {
    var idBus = widget.idB[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.idB[1]),
      ),
      body:    
      FutureBuilder(
        future: getProductsBusiness('$idBus'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  Map resultado = snapshot.data[index];
                  var price = resultado['price_products'];
                  var productData = [resultado['id_products'], resultado['name_products'], resultado['id_business_products'], resultado['price_products']];
                  String price2 = r'$' '$price';
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    margin: const EdgeInsets.all(10),
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: [
                            ListTile(
                              title: Text(resultado['name_products']),
                              subtitle: Text(price2),
                              leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(40),
                                  child: Image.network(
                                      'https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg')),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Image.network(
                                        'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg')),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Productview(productData)));
                                      },
                                      child: const Text('VER'),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('AGREGAR'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.share),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
              );
            
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
