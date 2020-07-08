import 'package:http/http.dart' as http;
import 'dart:convert';


class Network {
  Future<http.Response> uploadImage(String imagePlayload) async {
    /*
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://ip:8082/composer/predict");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length, filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    */
    String url = "";
    final response = await http.post(url, body: imagePlayload);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return response;
  }

}