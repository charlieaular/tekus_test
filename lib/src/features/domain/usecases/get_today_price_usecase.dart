import 'package:tekus_test/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tekus_test/src/core/usecase/usecase.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/domain/repositories/currency_repository.dart';

class GetTodayPriceUseCase implements UseCase<CurrencyEntity, NoParams> {
  final CurrencyRepository repository;

  GetTodayPriceUseCase(this.repository);

  @override
  Future<Either<Failure, CurrencyEntity>> call(NoParams params) async {
    return await repository.getTodayPrice();
  }
}
