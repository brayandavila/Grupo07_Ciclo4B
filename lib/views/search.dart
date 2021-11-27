import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/views/businesslist.dart';
import 'package:flutter_proyecto/views/category.dart';
import 'package:flutter_proyecto/views/forlocation.dart';
import 'package:flutter_proyecto/views/productslist.dart';
import 'package:flutter_proyecto/views/searchresult.dart';

class Seacher extends SearchDelegate {

  Seacher()
      : super(
          searchFieldLabel: "Busca por producto o servicio",
          searchFieldStyle: const TextStyle(color: Colors.black),
        );
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
          child: Text(
        "Aún no has buscado nada",
        style: TextStyle(
          fontSize: 20,
          color: Color(0xffF2A03D),
        ),
      ));
    } else {
      return Searchresult(query);        
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
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Seacher());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white70,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Businesslist()),
                  );
                },
                child: Card(
                  color: const Color(0xff13121D),
                  elevation: 0,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          'Nuestras tiendas',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        leading: Icon(
                          Icons.business,
                          size: 20,
                          color: Color(0xffF4A53C),
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
                  color: const Color(0xff13121D),
                  elevation: 0,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          'Productos',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        leading: Icon(
                          Icons.restaurant,
                          size: 20,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Category()),
                  );
                },
                child: Card(
                  color: const Color(0xff13121D),
                  elevation: 0,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          'Categorías',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        leading: Icon(
                          Icons.category,
                          size: 20,
                          color: Color(0xffF4A53C),
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
                        builder: (context) => const Forlocation()),
                  );
                },
                child: Card(
                  color: const Color(0xff13121D),
                  elevation: 0,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          'Más cercanos',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        leading: Icon(
                          Icons.location_on,
                          size: 20,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),                 
              /*            
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
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
