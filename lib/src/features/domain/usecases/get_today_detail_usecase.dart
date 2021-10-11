import 'package:tekus_test/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tekus_test/src/core/usecase/usecase.dart';
import 'package:tekus_test/src/features/domain/entities/detail_currency_entity.dart';
import 'package:tekus_test/src/features/domain/repositories/currency_repository.dart';

class GetTodayDetailUseCase implements UseCase<DetailCurrencyEntity, NoParams> {
  final CurrencyRepository repository;

  GetTodayDetailUseCase(this.repository);

  @override
  Future<Either<Failure, DetailCurrencyEntity>> call(NoParams params) async {
    return await repository.getTodayDetail();
  }
}
