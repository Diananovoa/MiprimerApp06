import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModificarTienda extends StatefulWidget {
  @override
  ModificarTiendaApp createState() => ModificarTiendaApp();
}

class ModificarTiendaApp extends State<ModificarTienda> {
  TextEditingController nombretienda=TextEditingController();
  TextEditingController rutaimagen=TextEditingController();
  TextEditingController descripciontienda=TextEditingController();
  TextEditingController paginaweb=TextEditingController();
  final firebase=FirebaseFirestore.instance;
  String nombret ="";
  String idDoc="";
  String pass="";
  bool estado=true;

  validarDatos() async {
    try {
      CollectionReference ref =
      FirebaseFirestore.instance.collection("Tiendas");
      QuerySnapshot Tienda = await ref.get();

      if (Tienda.docs.length != 0){
        for (var cursor in Tienda.docs) {
          if (cursor.get("nombretienda") == nombretienda.text) {
            rutaimagen.text=cursor.get("direcionimagen");
            descripciontienda.text=cursor.get("descripciondelaimagen");
            paginaweb.text=cursor.get("paginaweb");
            this.idDoc=cursor.id;
            this.nombretienda=cursor.get("nombretienda");
            this.pass=cursor.get("Password");
          }
        }
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
      print(e);
    }
  }

  modificarDatos() async{
    try{
      await firebase
          .collection("Tiendas")
          .doc(idDoc)
          .set({
        "nombretienda":nombretienda.text,
        "rutaimagen":this.rutaimagen,
        "descripciontienda":descripciontienda.text,
        "Password":pass,
        "paginaweb":paginaweb.text,
        "Estado":estado
      });
    }
    catch (e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Tienda"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // NOMBRE USUARIO
              child: TextField(
                controller: nombretienda,
                decoration: InputDecoration(
                  labelText: "nombretienda",
                  hintText: "digite nombre de la tienda",

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    validarDatos();
                  },
                  child: Text("Buscar Tienda"),
                )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // RUTA IMÁMGEN
              child: TextField(
                controller: rutaimagen,
                decoration: InputDecoration(
                    labelText: "ruta imagen",
                    hintText: "Digite la ruta de la imagen",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // DESCRIPCIÓN TIENDA
              child: TextField(
                controller: descripciontienda,
                decoration: InputDecoration(
                    labelText: "descripcion de la tienda",
                    hintText: "Digite la descripcion de la tienda",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // PÁGINA WEB
              child: TextField(

                controller: paginaweb,
                decoration: InputDecoration(
                    labelText: "paginaweb",
                    hintText: "Digite la pagina web",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  modificarDatos();
                },
                child: Text("Modificar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}