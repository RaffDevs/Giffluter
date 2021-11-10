import 'package:flutter/material.dart';
import 'package:giffluter/ui/color_theme.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  const GifPage({ 
    Key? key ,
    required this.gifData,
  }) : super(key: key);

  final Map<String, dynamic> gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gifData['title']),
        backgroundColor: ColorTheme.backgorund,
        actions: [
          IconButton(
            onPressed: () {
              Share.share(gifData["images"]["fixed_height"]["url"]);
            }, 
            icon: const Icon(Icons.share)
          )
        ],
      ),
      body: Container(
        color: ColorTheme.backgorund,
        child: Center(
          child: Image.network(gifData["images"]["fixed_height"]["url"]),
        ),
      ),
    );
  }
}