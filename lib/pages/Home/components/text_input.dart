import 'package:flutter/material.dart';
import 'package:giffluter/ui/color_theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.textController,
    required this.searchSubmit,
  }) : super(key: key);

  final TextEditingController textController;
  final Function(String) searchSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        style: const TextStyle(
          color: ColorTheme.foreground,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          labelText: "Pesquisar",
          labelStyle: TextStyle(color: ColorTheme.foreground),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorTheme.comment)
          ),
          border: OutlineInputBorder()
        ),
        cursorColor: ColorTheme.comment,
        controller: textController,
        onSubmitted: (text) => searchSubmit(text)
        
      ),
    );
  }
}