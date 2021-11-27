import 'package:flutter/material.dart';


class Pruebas extends StatefulWidget {

  const Pruebas({ Key? key }) : super(key: key);
  @override
  _PruebasState createState() => _PruebasState();
  
}

class _PruebasState extends State<Pruebas> {
  /* @override
  void initState() {
    getLogin('mgwilt3','wcPEpMeodQ.').then((value){
      if (getLogin('mgwilt3','wcPEpMeodQ.') != true){
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyStatefulWidget()),
      );
      }
      
      print('Async done');
    });
    super.initState();
  } */
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: Center(child: Text('Holi')),
    );
  }
}