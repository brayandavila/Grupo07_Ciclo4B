// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'package:flutter_proyecto/views/productview.dart';
import 'package:url_launcher/url_launcher.dart';

class Businessview extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final idB;
  const Businessview(this.idB, {Key? key}) : super(key: key);
  @override
  _BusinessviewState createState() => _BusinessviewState();
}

class _BusinessviewState extends State<Businessview> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    var web = widget.idB[6];
    var _url1 = '$web';
    var idBus = widget.idB[0];
    void _launchURL() async {
      if (!await launch(_url1)) throw 'Could not launch $url';
    }
    return Scaffold(
      appBar: AppBar(
        actions: [ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network('https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg'),
            ),],
        title: Text(widget.idB[1], style: const TextStyle(color: Colors.white70),),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: ListView(
              children: [
                ListTile(
                  title: Text(widget.idB[2], style: const TextStyle(color: Colors.white),),
                  subtitle: TextButton(
                    child: const Text('P??gina web'),
                    onPressed: _launchURL,
                  ),
                  leading: TextButton(
                    onPressed: _hasCallSupport
                        ? () => setState(() {
                              _launched = _makePhoneCall(widget.idB[5]);
                            })
                        : null,
                    child: const Icon(Icons.phone),
                  ),
                  trailing: Text(widget.idB[7]),
                ),
              ],
            ),
          ),          
          Expanded(
            child: FutureBuilder(
              future: getProductsBusiness('$idBus'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Map resultado = snapshot.data[index];
                        var price = resultado['price_products'];
                        var productData = [
                          resultado['id_products'],
                          resultado['name_products'],
                          resultado['id_business_products'],
                          resultado['price_products']
                        ];
                        String price2 = r'$' '$price';
                        return Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  ListTile(                                    
                                    title: Text(resultado['name_products'], style: const TextStyle(color: Colors.white70),),
                                    trailing: Text(price2, style: const TextStyle(color: Colors.green),),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg')),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Productview(
                                                              productData)));
                                            },
                                            child: const Text('VER'),
                                          ),
                                          TextButton(
                                            onPressed: () {
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
                                ],
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
/* const String _url = _url1;

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $url';
} */