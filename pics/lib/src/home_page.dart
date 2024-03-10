import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/imag_model.dart';
import '../src/widgets/image_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 1;
  List<ImageModel> images = [];

  fetchImages() async {
    var response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$count'));
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Let's see some pics"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImages,
          child: Icon(Icons.add),
          backgroundColor: Colors.amber,
        ),
        body: ImageList(images));
  }
}
