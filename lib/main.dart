import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:examentres/consulta.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController costo = TextEditingController();
  TextEditingController prov = TextEditingController();

  create() async {
    try {
      await FirebaseFirestore.instance
          .collection("productos")
          .doc(name.text)
          .set({"nombre": name.text, "categoria": category.text, "stock": stock.text, "precio": costo.text, "proveedor": prov.text});
      // ignore: avoid_print
      print("Dato Registrado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  update() async {
    try {
      await FirebaseFirestore.instance
          .collection("productos")
          .doc(name.text)
          .update({"nombre": name.text, "categoria": category.text, "stock": stock.text, "precio": costo.text, "proveedor": prov.text});
      // ignore: avoid_print
      print("Dato Actualizado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  delete() async {
    try {
      await FirebaseFirestore.instance
          .collection("productos")
          .doc(name.text)
          .delete();
      // ignore: avoid_print
      print("Dato Eliminado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registro de Productosflutter pub add firebase_core"),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Image.asset(
                  'images/logo.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Nombre del Producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: category,
                decoration: InputDecoration(
                    labelText: "Categoria",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: stock,
                decoration: InputDecoration(
                    labelText: "Stock",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: costo,
                decoration: InputDecoration(
                    labelText: "Precio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: prov,
                decoration: InputDecoration(
                    labelText: "Proveedor",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        create();
                        name.clear();
                        category.clear();
                        stock.clear();
                        costo.clear();
                        prov.clear();
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Create")),
                  ElevatedButton(
                      onPressed: () {
                        update();
                        name.clear();
                        category.clear();
                        stock.clear();
                        costo.clear();
                        prov.clear();
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.yellow),
                      child: const Text("Update")),
                  ElevatedButton(
                      onPressed: () {
                        delete();
                        name.clear();
                        category.clear();
                        stock.clear();
                        costo.clear();
                        prov.clear();                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Delete")),
                ],
              ),
              const Consulta(),
            ],
          ),
        ));
  }
}