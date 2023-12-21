import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utility/utils.dart';



class NetworkService {
  callRequest(
      {uri,
      params,
      requestType,
      query,
      onNoInternet,
      onError,
      bearerToken}) async {
    try {
      http.Response? response;
      printf("Request Parameter :$params");
      switch (requestType) {
        case "POST":
          Map<String, String> header = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          };
          String bodyParams = json.encode(params);
          response = await http.post(uri, body: bodyParams, headers: header);
          break;
        case "GET":
          response = await http.get(uri);
          break;
        case "GET_HEADER":
          Map<String, String> header = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $bearerToken',
          };
          response = await http.get(uri, headers: header);
          break;
      }
      printf("Headers :${response!.headers}");
      printf("URL :${response.request!.url}");
      printf("Response :${response.body}");
      printf("Status Code :${response.statusCode}");

      if (response.statusCode == 200) {
        return response;
      } else {
        if (onError != null) onError(response.body);
        return null;
      }
    } catch (err, log) {
      printf("Error: $err\n Log$log");
      return null;
    }
  }
}
