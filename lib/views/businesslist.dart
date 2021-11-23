import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/business.dart';
import 'package:flutter_proyecto/views/businessview.dart';

class Businesslist extends StatefulWidget {
  const Businesslist({Key? key}) : super(key: key);

  @override
  _BusinesslistState createState() => _BusinesslistState();
}

class _BusinesslistState extends State<Businesslist> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiendas'),
      ),
      body: FutureBuilder(
        future: getBusiness(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: _listBusiness(snapshot.data).length,
              itemBuilder: (context, index) {
                final item = _listBusiness(snapshot.data)[index];
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
  List<Widget> _listBusiness(data){
    List<Widget> business = [];
    for (var business1 in data) {
      var logo = business1.logoBusiness;
      var businessData = [business1.idBusiness, business1.nameBusiness, business1.addressBusiness, business1.geolocationBusiness, business1.landlineBusiness, business1.phoneBusiness, business1.websiteBusiness, business1.categoryBusiness, business1.logoBusiness, business1.photoBusiness];
      business.add(
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network('$logo')),
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
                            title: Text(business1.nameBusiness),
                            subtitle: Text(business1.addressBusiness + '\n' + business1.categoryBusiness),
                          ),                          
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Businessview(businessData)));
                                }, 
                                child: const Text('VER TIENDA')
                              ),
                              const SizedBox(width: 8,),
                              TextButton(
                                onPressed: (){}, 
                                child: const Icon(Icons.phone),
                              ),
                              const SizedBox(width: 8,),
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
        ),
      );
    }
    return business;
  }
}

