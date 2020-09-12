import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cicd_demo/data_holder.dart';

class ImageGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[200],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text('Photo Gallery'),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ImageGridItem(index: index + 1);
            },
          ),
        ),
      ),
    );
  }
}

class ImageGridItem extends StatefulWidget {
  const ImageGridItem({this.index});

  final int index;

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  StorageReference photosReference =
      FirebaseStorage.instance.ref().child('photos');
  Uint8List imageFile;

  dynamic getImage() async {
    if (!requestedIndexes.contains(widget.index)) {
      const int maxSize = 200 * 1024;
      await photosReference
          .child('image_${widget.index}.jpg')
          .getData(maxSize)
          .then(
        (data) {
          setState(() => imageFile = data);
          imageData.putIfAbsent(widget.index, () => data);
        },
      ).catchError(
        (dynamic error) {
          debugPrint(
            error.toString(),
          );
        },
      );
      requestedIndexes.add(widget.index);
    }
  }

  Widget decideGridFileWidget() {
    if (imageFile == null) {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    } else {
      return Image.memory(
        imageFile,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (!imageData.containsKey(widget.index)) {
      getImage();
    } else {
      imageFile = imageData[widget.index];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: decideGridFileWidget(),
    );
  }
}
