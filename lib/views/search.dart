import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/business.dart';
import 'package:flutter_proyecto/models/products.dart';
import 'package:flutter_proyecto/views/businesslist.dart';
import 'package:flutter_proyecto/views/businessview.dart';
import 'package:flutter_proyecto/views/productslist.dart';
import 'package:flutter_proyecto/views/productview.dart';

class Seacher extends SearchDelegate {
  Seacher() : super(searchFieldLabel: "Busca por producto o servicio");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("Aún no has buscado nada"),
      );
    } else {
      return FutureBuilder(
        future: getSearch(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return DefaultTabController(
                length: 2,
                child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(75),
                      child: AppBar(
                        backgroundColor: Colors.green,
                        automaticallyImplyLeading: false,
                        bottom: const TabBar(
                          indicatorColor: Colors.green,
                          tabs: [
                            Tab(
                                text: 'Productos',
                                icon: Icon(Icons.restaurant)),
                            Tab(
                                text: 'Tiendas',
                                icon: Icon(Icons.business_center)),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(children: [
                      ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
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
                        },
                      ),
                      FutureBuilder(
                          future: getSearchBusiness(query),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  Map resultado2 = snapshot.data[index];
                                  var businessData = [resultado2['id_business'], resultado2['name_business'], resultado2['address_business'], resultado2['geolocation_business'], resultado2['landline_business'], resultado2['phone_business'], resultado2['website_business'], resultado2['category_business'], resultado2['logo_business'], resultado2['photo_business']];
                                  var logo = resultado2['logo_business'];
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    margin: const EdgeInsets.all(10),
                                    elevation: 8,
                                    child: Container(
                                      height: 100,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Expanded(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    child:
                                                        Image.network('$logo')),
                                                flex: 2,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: ListTile(
                                                      title: Text(resultado2['name_business']),
                                                      subtitle: Text(resultado2['address_business'] +
                                                          '\n' +
                                                          resultado2['category_business']),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Businessview(businessData)));
                                                            },
                                                            child: const Text(
                                                                'VER TIENDA')),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: const Icon(
                                                              Icons.phone),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })
                    ]
                  )
                )
              );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.green,
        title: const Text('Buscar'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Seacher());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Title(
                color: Colors.black,
                child: const Text(
                  "Tiendas y productos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Businesslist()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  elevation: 8,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text('Tiendas'),
                        subtitle: Text('Cómprale a las tiendas de tu barrio.'),
                        leading: Icon(
                          Icons.business,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Productslist()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  elevation: 8,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text('Productos'),
                        subtitle: Text(
                            'Encuentra los productos de tu tienda más cercana.'),
                        leading: Icon(
                          Icons.restaurant,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Title(
                color: Colors.black,
                child: const Text(
                  "Categorias filtradas",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Title(
                color: Colors.black,
                child: const Text(
                  "Más cercanos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
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
