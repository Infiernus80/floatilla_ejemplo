import 'package:floatilla_ejemplo/provider/connect.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [ChangeNotifierProvider(create: (context) => Conexion(),)],
  child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Conexion conn = Provider.of<Conexion>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Floatilla',
      home: Scaffold(
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade100))),
                        child: TextField(
                          controller: conn.campo1,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              label: const Text(
                                'Correo electronico',
                              ),
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade100))),
                        child: TextField(
                          controller: conn.campo2,
                          obscureText: true,
                          decoration: InputDecoration(
                              label: const Text(
                                'Contraseña',
                              ),
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 30,
                        margin: const EdgeInsets.only(top:20),
                        child: ElevatedButton(
                          onPressed: () {
                            conn.connect();
                          },
                          child: const Text('Iniciar Sesion'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
