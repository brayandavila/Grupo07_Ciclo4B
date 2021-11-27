import 'package:flutter/material.dart';
import 'package:flutter_proyecto/views/login.dart';

class Recoverpass extends StatefulWidget {
  const Recoverpass({Key? key}) : super(key: key);

  @override
  _RecoverpassState createState() => _RecoverpassState();
}

class _RecoverpassState extends State<Recoverpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(            
              backgroundColor: const Color(0xffF4A53C),
              foregroundColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hemos enviado un correo electrónico'),                                  
                  ),
                );
              },
              label: const Text(
                'Recuperar contraseña',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          'Recuperar contraseña',
          style: TextStyle(color: Colors.white70),
        ),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,            
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                color: Colors.white70,
              ),
              labelText: 'Ingresa tu correo electrónico',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Color(0xffF4A53C),
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Color(0xffF4A53C),
                  width: 2.0,
                ),
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xffF4A53C),
              ),
              //suffixIcon: const Icon(Icons.remove_red_eye),
            ),
          ),
        ),
      ),
    );
  }
}
