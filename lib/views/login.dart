import 'package:flutter/material.dart';
import 'package:flutter_proyecto/models/validatelogin.dart';
import 'package:flutter_proyecto/views/loginbusiness.dart';
import 'package:flutter_proyecto/views/recoverpass.dart';
import 'bottomnavigationbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myControllerUsuario = TextEditingController();
  final myControllerPassword = TextEditingController();

  @override
  void dispose() {
    myControllerUsuario.dispose();
    myControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: myControllerUsuario,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Colors.white70,
                    ),
                    labelText: 'Usuario',
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
                      Icons.person,
                      color: Color(0xffF4A53C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: myControllerPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Colors.white70,
                    ),
                    labelText: 'Contrase??a',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Recoverpass()),
                        );
                      },
                      child: const Text(
                        '??Olvidaste tu contrase??a?',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      //getUserPass(myControllerUsuario.text, myControllerPassword.text);
                      //getLogin(myControllerUsuario.text, myControllerPassword.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyStatefulWidget()),
                      );
                    },
                    color: const Color(0xffF4A53C),
                    child: const Text(
                      'Iniciar sesi??n',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Loginbusiness()),
                        );
                      },
                      child: const Text(
                        '??Eres una tienda? Ingresa aqu??',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),                
                /* TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pruebas()),
                      );
                    },
                    child: const Text('Validar Login')), */
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '''??A??n no tienes cuenta?''',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Reg??strate'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}