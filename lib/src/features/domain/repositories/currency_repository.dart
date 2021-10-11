import 'package:dartz/dartz.dart';
import 'package:tekus_test/src/core/error/failures.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/domain/entities/detail_currency_entity.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<CurrencyEntity>>> getHistoricalCurrencies();
  Future<Either<Failure, CurrencyEntity>> getTodayPrice();
  Future<Either<Failure, DetailCurrencyEntity>> getDetailFromDate(DateTime? date);
  Future<Either<Failure, DetailCurrencyEntity>> getTodayDetail();
}
