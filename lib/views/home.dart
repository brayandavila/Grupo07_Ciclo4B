import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(child: Text('Home', style: TextStyle(fontSize: 40, color: Color(0xffF4A53C),)),)
      );
  }
}

