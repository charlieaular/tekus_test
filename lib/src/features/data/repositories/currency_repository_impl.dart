import 'package:dartz/dartz.dart';
import 'package:tekus_test/src/core/error/failures.dart';
import 'package:tekus_test/src/features/data/datasource/currency_remote_datasource.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/domain/entities/detail_currency_entity.dart';
import 'package:tekus_test/src/features/domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  late final CurrencyRemoteDataSource historicalDataSource;

  CurrencyRepositoryImpl({
    required this.historicalDataSource,
  });

  @override
  Future<Either<Failure, List<CurrencyEntity>>> getHistoricalCurrencies() async {
    try {
      final response = await historicalDataSource.getHistoricalCurrencies();
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, CurrencyEntity>> getTodayPrice() async {
    try {
      final response = await historicalDataSource.getTodayPrice();
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, DetailCurrencyEntity>> getDetailFromDate(DateTime? date) async {
    try {
      final response = await historicalDataSource.getDetailFromDate(date);
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, DetailCurrencyEntity>> getTodayDetail() async {
    try {
      final response = await historicalDataSource.getTodayDetail();
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
