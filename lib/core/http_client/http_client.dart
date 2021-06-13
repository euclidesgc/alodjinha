import 'package:alodjinha/core/http_client/ihttp_client.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IhttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));

    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body}) async {
    final response = await client.post(Uri.parse(url), body: body);

    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
