import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giffluter/pages/Home/page_home.dart';

main () => runApp(const Giffluter());

class Giffluter extends StatelessWidget {
  const Giffluter({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}