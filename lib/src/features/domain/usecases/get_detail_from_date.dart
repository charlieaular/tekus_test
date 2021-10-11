import 'package:tekus_test/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tekus_test/src/core/usecase/usecase.dart';
import 'package:tekus_test/src/features/domain/entities/detail_currency_entity.dart';
import 'package:tekus_test/src/features/domain/repositories/currency_repository.dart';

class GetDetailFromDateUseCase implements UseCase<DetailCurrencyEntity, DateTime?> {
  final CurrencyRepository repository;

  GetDetailFromDateUseCase(this.repository);

  @override
  Future<Either<Failure, DetailCurrencyEntity>> call(DateTime? date) async {
    return await repository.getDetailFromDate(date);
  }
}
