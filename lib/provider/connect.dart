import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class Conexion with ChangeNotifier {
  final campo1 = TextEditingController();
  final campo2 = TextEditingController();

  Future connect() async {
    String user = campo1.text.toString();
    String pass = campo2.text.toString();
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'flotillam',
        password: 'root'));
    

    var result = await conn.query(
        "SELECT * FROM adminempresa WHERE usuario = ? and password = ?",
        [user, pass]);

      if (result.isNotEmpty) {
        debugPrint('Funciona correctamente $result');
      }else{
        debugPrint('Esto no funciona');
      }

    // Finally, close the connection
    await conn.close();
  }
}
