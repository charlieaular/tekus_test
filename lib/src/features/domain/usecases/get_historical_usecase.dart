import 'package:tekus_test/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tekus_test/src/core/usecase/usecase.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/domain/repositories/currency_repository.dart';

class GetHistoricalUseCase implements UseCase<List<CurrencyEntity>, NoParams> {
  final CurrencyRepository repository;

  GetHistoricalUseCase(this.repository);

  @override
  Future<Either<Failure, List<CurrencyEntity>>> call(NoParams params) async {
    return await repository.getHistoricalCurrencies();
  }
}
