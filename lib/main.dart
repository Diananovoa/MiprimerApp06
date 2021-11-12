import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'buscar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos grupo06',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home app grupo06'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children:<Widget> [
              Padding(
                  padding:EdgeInsets.only(left: 20,top: 20,right: 20,bottom:0 ),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('imag/logo.png'),
                ),
              ),
              ),
              Padding(
                padding:
              EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'busqueda',
                  hintText: 'Plabra clave de la busqueda'
                )
              ),
              ),
              Padding(
                  padding:
                  EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
                child: ElevatedButton(
                  onPressed: (){
                    print('presionado');
                    Navigator.push(context,MaterialPageRoute(builder: (_)=>buscar()));
                  },
                  child: Text('Buscar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}