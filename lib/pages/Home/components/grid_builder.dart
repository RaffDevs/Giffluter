import 'package:flutter/material.dart';
import 'package:giffluter/ui/color_theme.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({ 
    Key? key,
    required this.getGifs
  }) : super(key: key);

  final Future getGifs;

  Widget _gridGifs(BuildContext context, AsyncSnapshot snapshot) {
    final data = snapshot.data["data"];

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemCount: data.length,
      itemBuilder:(context, index) {
        return GestureDetector(
          child: Image.network(
            data[index]["images"]["fixed_height"]["url"],
            height: 300,
            fit: BoxFit.cover,
          ),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: getGifs,
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.foreground),
                  strokeWidth: 5,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Text('Error');
              }
              else {
                return _gridGifs(context, snapshot);
              } 
          }
        },
      ),
    );
  }
}
