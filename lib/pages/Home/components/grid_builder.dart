import 'package:flutter/material.dart';
import 'package:giffluter/pages/Gif/page_gif.dart';
import 'package:giffluter/ui/color_theme.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    Key? key, 
    required this.getGifs, 
    required this.moreGifs,
    required this.offset,
  }) : super(key: key);

  final Future getGifs;
  final Function(int limit) moreGifs;
  final int offset;

  Widget _gridGifs(BuildContext context, AsyncSnapshot snapshot, int offset) {
    final data = snapshot.data["data"];

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10
      ),
      itemCount: offset + 1,
      itemBuilder: (context, index) {
        if (index == data.length) {
          return GestureDetector(
            child: Card(
              color: ColorTheme.backgorund,
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    size: 50,
                    color: ColorTheme.foreground,
                  ),
                  Text(
                    'Carregar mais...',
                    style: TextStyle(
                      color: ColorTheme.foreground
                    )
                  )
                ],
              ),
            ),
            onTap: () {
              moreGifs(offset);
            },
          );
        }
        else {
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: data[index]["images"]["fixed_height"]["url"],
              height: 300,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => GifPage(gifData: data[index]))
              );
            },
            onLongPress: () {
              Share.share(data[index]["images"]["fixed_height"]["url"]);
            },
          );
        }
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: getGifs,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorTheme.foreground),
                  strokeWidth: 5,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Text('Error');
              } else {
                print('Opa');
                return _gridGifs(context, snapshot, offset);
              }
          }
        },
      ),
    );
  }
}
