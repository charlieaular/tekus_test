import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tekus_test/src/core/error/failures.dart';
import 'package:tekus_test/src/core/http/api.dart';
import 'package:tekus_test/src/core/utils/formatter.dart';
import 'package:tekus_test/src/features/data/models/currency_model.dart';
import 'package:tekus_test/src/features/data/models/detail_currency_model.dart';

abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getHistoricalCurrencies();
  Future<CurrencyModel> getTodayPrice();
  Future<DetailCurrencyModel> getDetailFromDate(DateTime? date);
  Future<DetailCurrencyModel> getTodayDetail();
}

class CurrencyRemoteDataSourceImpl extends ApiProvider implements CurrencyRemoteDataSource {
  final String endpointHistoric = "historical/close.json";
  final String endpointCurrent = "currentprice";

  @override
  Future<List<CurrencyModel>> getHistoricalCurrencies() async {
    try {
      final int weeks = DateTime.daysPerWeek * 2;
      final DateTime today = DateTime.now();
      final DateTime end = today.subtract(Duration(days: weeks));
      final Map<String, dynamic> params = {
        "start": formatDate(date: end, format: 'yyyy-MM-dd'),
        "end": formatDate(date: today.subtract(const Duration(days: 1)), format: 'yyyy-MM-dd'),
      };
      log(endpointHistoric, name: 'GET');
      log(params.toString(), name: 'GET-params');
      Response res = await dio.get(endpointHistoric, queryParameters: params);
      Response resToday = await dio.get("$endpointCurrent.json");

      final list = CurrencyModel.fromHistoric(json.decode(res.data));
      final todayModel = CurrencyModel.fromToday(json.decode(resToday.data));
      list.add(todayModel);
      return list;
    } on DioError catch (e) {
      throw ServerFailure.fromDio(e);
    }
  }

  @override
  Future<DetailCurrencyModel> getDetailFromDate(DateTime? date) async {
    try {
      final Map<String, dynamic> baseParams = {
        "start": formatDate(date: date, format: 'yyyy-MM-dd'),
        "end": formatDate(date: date, format: 'yyyy-MM-dd'),
      };
      log(endpointHistoric, name: 'GET');
      final usdParams = {...baseParams, "currency": 'usd'};
      final copParams = {...baseParams, "currency": 'cop'};
      final eurParams = {...baseParams, "currency": 'eur'};

      Response resUsd = await dio.get(endpointHistoric, queryParameters: usdParams);
      Response resCop = await dio.get(endpointHistoric, queryParameters: copParams);
      Response resEur = await dio.get(endpointHistoric, queryParameters: eurParams);

      return DetailCurrencyModel.specificFromHistoric(
        resUsd: resUsd,
        resCop: resCop,
        resEur: resEur,
      );
    } on DioError catch (e) {
      throw ServerFailure.fromDio(e);
    }
  }

  @override
  Future<CurrencyModel> getTodayPrice() async {
    try {
      Response resToday = await dio.get("$endpointCurrent.json");
      return CurrencyModel.fromToday(json.decode(resToday.data));
    } on DioError catch (e) {
      throw ServerFailure.fromDio(e);
    }
  }

  @override
  Future<DetailCurrencyModel> getTodayDetail() async {
    try {
      Response resTodayUsd = await dio.get("$endpointCurrent.json");
      Response resTodayCop = await dio.get("$endpointCurrent/COP.json");
      final todayUsdModel = CurrencyModel.fromToday(json.decode(resTodayUsd.data), 'USD');
      final todayEurModel = CurrencyModel.fromToday(json.decode(resTodayUsd.data), 'EUR');
      final todayCopModel = CurrencyModel.fromToday(json.decode(resTodayCop.data), 'COP');

      return DetailCurrencyModel(usd: todayUsdModel, cop: todayCopModel, eur: todayEurModel);
    } on DioError catch (e) {
      throw ServerFailure.fromDio(e);
    }
  }
}
