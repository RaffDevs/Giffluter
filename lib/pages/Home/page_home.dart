import 'package:flutter/material.dart';
import 'package:giffluter/modules/giff/gif_service.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final giffService = GiffService();

  @override
  void initState() {
    super.initState();

    giffService.getGifs()
    .then((gifs) {
      print(gifs["data"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network('https://developers.giphy.com/static/img/dev-logo-lg.gif'),
      ),
      body: Container(
        child: Text('Hello'),
      ),
    );
  }
}