import 'package:equatable/equatable.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';

class DetailCurrencyEntity extends Equatable {
  final CurrencyEntity? usd;
  final CurrencyEntity? cop;
  final CurrencyEntity? eur;

  const DetailCurrencyEntity({
    this.usd,
    this.cop,
    this.eur,
  });

  @override
  List<Object?> get props => [
        usd,
        cop,
        eur,
      ];

  @override
  bool? get stringify => true;
}
