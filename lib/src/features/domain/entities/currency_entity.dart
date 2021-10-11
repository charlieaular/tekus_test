import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final DateTime? date;
  final String? price;
  final String? dateFormated;

  const CurrencyEntity({
    this.date,
    this.price,
    this.dateFormated,
  });

  @override
  List<Object?> get props => [
        date,
        price,
        dateFormated,
      ];

  @override
  bool? get stringify => true;
}
