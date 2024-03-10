import 'package:flutter/material.dart';
import 'package:pics/src/models/imag_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const ImageList(this.images, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(18.0),
            decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black)),
            child: Column(
              children: [
                Image.network(images[index].url.toString()),
                Text(images[index].title.toString())
              ],
            ));
      },
    );
  }
}
