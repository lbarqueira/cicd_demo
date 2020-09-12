import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'image_gallery.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => ImageGallery(),
                    ),
                  );
                },
                child: const Icon(
                  FontAwesomeIcons.images,
                  color: Colors.yellowAccent,
                  size: 30.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Image(
              image: const AssetImage('assets/images/lugh.jpg'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How many times I like my dog:',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 60.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onLongPress: () {
            setState(() {
              _counter = 0;
            });
          },
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.favorite_border),
          ),
        ),
      ),
    );
  }
}
