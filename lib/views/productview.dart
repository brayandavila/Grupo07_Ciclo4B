import 'package:flutter/material.dart';

class Productview extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  
  const Productview(this.data, { Key? key }) : super(key: key);
  
  @override
  _ProductviewState createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {
  
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    var price = widget.data[3];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data[1]),
      ),
      body: Column(
        children: [
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
                    title: Text(widget.data[1]),
                    subtitle: Text('$price'),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network('https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg'),
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
                  const SizedBox(height: 15,),
                  const Text('Disponibilidad')
                ],
              )
            ],
          ),
        ),
        ]
      ));  
  }
}