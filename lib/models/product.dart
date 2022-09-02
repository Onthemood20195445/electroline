import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String dummyText =
    "The GeForce RTX™ 3070 Ti and RTX 3070 graphics cards deliver the ultra performance that gamers crave, powered by Ampere—NVIDIA's 2nd gen RTX architecture. They are built with enhanced RT Cores and Tensor Cores, new streaming multiprocessors, and superfast G6X memory for an amazing gaming experience.";

List<Product> products = [];

//reil time<<<<<<<<<<<<<<<<<<<<
/*
FirebaseDatabase database = FirebaseDatabase.instance;
final DatabaseReference refdb = database.ref();
final refdbproducts = refdb.child("products");

sendData() async {
  refdbproducts.push().set({
    "id": 2,
    "title": "Gi RTX3080",
    "price": 1450,
    "size": 16,
    "description": dummyText,
    "image": "images/gpu.jpg",
    "categories": "gpu",
  });
}
*/

/*getData() async {
  final snapshot = await refdbproducts.get();
  if (snapshot.exists) {
    print(snapshot.value);
    products = snapshot.value as List<Product>;
  } else {
    print('No data available.');
  }
}*/
//<<<<<<<<<<<<<<<<<<<<<<<<

//fire sotur<<<<<<<<<<<<<<<<<<<<<<
final db = FirebaseFirestore.instance;
final ref = db.collection("products").doc().withConverter(
      fromFirestore: Product.fromFirestore,
      toFirestore: (Product P, _) => P.toFirestore(),
    );

final refs = db.collection("products");
firestoreGets() async {
   products.addAll(
      (await refs.get().then((value) => value.docs.map<Product>((document) {
            return Product(
              id: document['id'],
              title: document['title'],
              price: document['price'],
              size: document['size'],
              description: document['description'],
              image: document['image'],
              categories: document['categories'],
            );
          }))));
}

firestoreGet() async {
  final docSnap = await ref.get();
  final p = docSnap.data(); // Convert to products object
  if (p != null) {
    //products=p as List<Product>;
    products.add(p);
    print(p);
  } else {
    print("No such document.");
  }
}

firestoreSend() async {
  await ref.set(Product(
    id: 19,
    title: "Rgb mousepad",
    price: 10,
    size: 16,
    description: "Rgb gaming mousepad it is flexable and an be rolled",
    image: "images/acces3.jpg",
    categories: "accesories",
  ));
}
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

class Product {
  final String image, title, description, categories;
  final int price, size, id;
  late Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.categories,
    this.color = Colors.black,
  });
  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    var data = snapshot.data();
    return Product(
      id: data?['id'],
      title: data?['title'],
      price: data?['price'],
      size: data?['size'],
      description: data?['description'],
      image: data?['image'],
      categories: data?['categories'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (price != null) "price": price,
      if (size != null) "size": size,
      if (description != null) "description": description,
      if (image != null) "image": image,
      if (categories != null) "categories": categories,
    };
  }
}

/*List<Product> products = [
  Product(
    id: 1,
    title: " NIVIDIA GeForce ",
    price: 234,
    size: 16,
    description: dummyText,
    image: "images/gpu.jpg",
    categories: "gpu",
  ),
  Product(
    id: 2,
    title: "Belt Bag",
    price: 234,
    size: 8,
    description: dummyText,
    image: "images/gpu.jpg",
    categories: "gpu",
  ),
  Product(
    id: 3,
    title: "Hang Top",
    price: 234,
    size: 10,
    description: dummyText,
    image: "images/gpu.jpg",
    categories: "gpu",
  ),
  Product(
    id: 4,
    title: "Old Fashion",
    price: 234,
    size: 11,
    description: dummyText,
    image: "images/ram.jpg",
    categories: "memory",
  ),
  Product(
    id: 5,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "images/ram.jpg",
    categories: "memory",
  ),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "images/ram.jpg",
    categories: "memory",
  ),
];*/

class _categories {
  final String name, image;
  _categories({
    required this.name,
    required this.image,
  });
}

List<_categories> categories = [
  _categories(name: 'gpu', image: "images/gpu.jpg"),
  _categories(name: 'cpu', image: "images/cpu.jpg"),
  _categories(name: 'motherboards', image: "images/motherboard.jpg"),
  _categories(name: 'memory', image: "images/ram.jpg"),
  _categories(name: 'power', image: "images/power.jpg"),
  _categories(name: 'cases', image: "images/cases.jpg"),
  _categories(name: 'cooling', image: "images/cooling.jpg"),
  _categories(name: 'accesories', image: "images/acces.jpg"),
];
