import 'package:flutter/material.dart';
import 'package:giffluter/modules/giff/gif_service.dart';
import 'package:giffluter/pages/Home/components/grid_builder.dart';
import 'package:giffluter/ui/color_theme.dart';

import 'components/text_input.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final giffService = GiffService();
  var searchController = TextEditingController();
  
  int offset = 19;

  void submitSearch(String text) {
    setState(() {
      searchController.text = text;
    });
  }

   moreGifs(int limit) {
    setState(() {
      offset += limit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network('https://developers.giphy.com/static/img/dev-logo-lg.gif'),
        centerTitle: true,
        backgroundColor: ColorTheme.backgorund,
      ),
      backgroundColor: ColorTheme.backgorund,
      body: Column(
        children:  [
          SearchField(textController: searchController, searchSubmit: submitSearch),
          GridBuilder(
            getGifs: giffService.getGifs(search: searchController.text, offset: offset),
            moreGifs: moreGifs, 
            offset: offset
          )
        ]
      ),
    );
  }
}
