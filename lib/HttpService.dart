import 'dart:convert';

import 'package:http/http.dart';
import 'package:rajib_demo/Note.dart';

class HttpService {
  Future<List<NoteElement>> getNotes() async {
    var url =
        Uri.parse('https://restapi.mahmudulhasanproject.xyz/api/all-notes');
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['notes'];
      List<NoteElement> notes =
          body.map((dynamic item) => NoteElement.fromJson(item)).toList();
      return notes;
    } else {
      throw 'can not load data';
    }
  }
}
