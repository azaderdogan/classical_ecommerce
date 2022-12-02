import 'package:dio/dio.dart' as dio;

class Response {
  Response({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
  dynamic data;

  int? statusCode;
  String? statusMessage;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: json["data"],
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );
  factory Response.fromDioResponse(dio.Response dioResponse) => Response(
      data: dioResponse.data,
      statusCode: dioResponse.statusCode,
      statusMessage: dioResponse.statusMessage);
}
