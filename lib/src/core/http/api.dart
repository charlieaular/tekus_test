import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final String _baseApiUrl = "https://api.coindesk.com/v1/bpi/";
  late Dio dio;

  //historico
  //https://api.coindesk.com/v1/bpi/historical/close.json?start=2021-09-25&end=2021-10-09

  //Fecha especifica
  //https://api.coindesk.com/v1/bpi/historical/close.json?start=2021-10-09&end=2021-10-09&currency=usd
  //https://api.coindesk.com/v1/bpi/historical/close.json?start=2021-10-09&end=2021-10-09&currency=cop
  //https://api.coindesk.com/v1/bpi/historical/close.json?start=2021-10-09&end=2021-10-09&currency=eur

  // Si es hoy
  //https://api.coindesk.com/v1/bpi/currentprice.json
  //https://api.coindesk.com/v1/bpi/currentprice/COP.json

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiUrl));
    /**
     * Se agregó esta código porque en el momento que estoy probando,
     * los certificados ssl del api de coindesk se le vencieron.
     * En producción esto no debe estar.
     *  
     * Espero su comprensión
     * :D
     */
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
