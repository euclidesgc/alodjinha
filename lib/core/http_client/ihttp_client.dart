import 'package:equatable/equatable.dart';

abstract class IhttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
}

class HttpResponse extends Equatable {
  final int? statusCode;
  final dynamic data;

  HttpResponse({this.statusCode, this.data});

  @override
  List<Object?> get props => [statusCode, data];
}
