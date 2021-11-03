import 'dart:convert';

import 'package:http/http.dart';

class GiffService {
  final Uri _uri = Uri.parse("https://api.giphy.com/v1/gifs/trending?api_key=VDsuCMrdT3jjGIAMatID7XJuwRpAcaWu&limit=25&rating=g");

  Future<Map> getGifs() async {
    Response response = await get(_uri);

    return json.decode(response.body);
  }
}