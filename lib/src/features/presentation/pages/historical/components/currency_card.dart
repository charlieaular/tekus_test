import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/presentation/routing.dart';

class CurrencyCard extends StatelessWidget {
  final CurrencyEntity currency;

  const CurrencyCard({
    Key? key,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.offNamed(AppPages.currencyDetailPage, arguments: currency),
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color(0xffe856cf),
              Color(0xff852274),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.paid_outlined, color: Colors.white, size: 50),
                const SizedBox(width: 20),
                Text(
                  currency.dateFormated ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Bitcoin (BTC)',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  '\$ ${currency.price}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
