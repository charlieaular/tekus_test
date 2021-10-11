import 'package:tekus_test/src/core/utils/formatter.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel({
    DateTime? date,
    String? price,
    String? dateFormated,
  }) : super(
          date: date,
          price: price,
          dateFormated: dateFormated,
        );

  static List<CurrencyModel> fromHistoric(Map<String, dynamic> json) {
    Map bpi = json["bpi"];
    return bpi.entries.map((map) {
      final date = DateTime.parse(map.key);
      return CurrencyModel(
        date: date,
        price: map.value.toString(),
        dateFormated: _formatCurrentDate(date),
      );
    }).toList();
  }

  static CurrencyModel fromToday(Map<String, dynamic> json, [String currency = "USD"]) {
    final price = json["bpi"][currency]["rate"];
    return CurrencyModel(
      date: DateTime.now(),
      price: price,
      dateFormated: _formatCurrentDate(DateTime.now()),
    );
  }

  static CurrencyModel specificFromHistoric(Map<String, dynamic> json) {
    Map bpi = json["bpi"];
    final entry = bpi.entries.first;
    final date = DateTime.parse(entry.key);

    return CurrencyModel(
      date: date,
      price: entry.value.toString(),
      dateFormated: _formatCurrentDate(date),
    );
  }

  static String _formatCurrentDate(DateTime? date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateToCheck = DateTime(date!.year, date.month, date.day);

    if (dateToCheck == yesterday) return 'Yesterday';
    if (dateToCheck == today) return 'Today';
    return formatDate(date: date, format: 'dd-MM-yyyy');
  }
}
