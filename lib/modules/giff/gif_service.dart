import 'dart:convert';
import 'package:http/http.dart';

class GiffService {
  final Uri _uri = Uri.parse("https://api.giphy.com/v1/gifs/trending?api_key=VDsuCMrdT3jjGIAMatID7XJuwRpAcaWu&limit=19&rating=g");

  Future<Map> getGifs({required String search, required int offset}) async {
    if (search.isEmpty) {
      Response response = await get(_uri);

      return json.decode(response.body);
    }

    return await getGifsBySearch(offset: offset, search: search);
    
  }

  Future<Map> getGifsBySearch({ required int offset, required String search }) async {
    const baseUrl = "https://api.giphy.com/v1/gifs/search?api_key=VDsuCMrdT3jjGIAMatID7XJuwRpAcaWu&";
    final paramsUrl = "q=$search&limit=19&offset=$offset&rating=g&lang=en";
    final Uri uri = Uri.parse("$baseUrl$paramsUrl");

    Response response = await get(uri);

    return json.decode(response.body);

  }
}