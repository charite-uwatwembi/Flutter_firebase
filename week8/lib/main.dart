import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void create() async {
    try {
      await firestore.collection('Mobile Dev').doc('students').set({
        'firstName': 'Samiratu',
        'lastName': 'Ntohsi',
      });
    } catch (e) {
      print(e);
    }
  }

  void read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await firestore.collection('Mobile Dev').doc('students').get();
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  void update() async {
    try {
      await firestore.collection('Mobile Dev').doc('students').update({
        'firstName': 'Christine',
      });
    } catch (e) {
      print(e);
    }
  }

  void delete() async {
    try {
      await firestore.collection('users').doc('testUser').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase CRUD Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ElevatedButton(
            onPressed: create,
            child: const Text("Create"),
          ),
          ElevatedButton(
            onPressed: read,
            child: const Text("Read"),
          ),
          ElevatedButton(
            onPressed: update,
            child: const Text("Update"),
          ),
          ElevatedButton(
            onPressed: delete,
            child: const Text("Delete"),
          ),
        ]),
      ),
    );
  }
}
