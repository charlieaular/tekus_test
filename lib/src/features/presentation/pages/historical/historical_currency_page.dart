import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekus_test/injection_container.dart';
import 'package:tekus_test/src/features/presentation/controllers/historical_currency_controller.dart';
import 'package:tekus_test/src/features/presentation/pages/historical/components/currency_card.dart';

class HistoricalCurrencyPage extends StatelessWidget {
  static const String routeName = "/historical-currency.page";
  HistoricalCurrencyPage({Key? key}) : super(key: key);

  final HistoricalCurrencyController controller = Get.put(di<HistoricalCurrencyController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF80096c),
      appBar: AppBar(
        backgroundColor: const Color(0XFF80096c),
        title: Row(
          children: const [
            Text(
              'Currency historical list',
            ),
            SizedBox(width: 10),
            Icon(
              Icons.trending_up,
              color: Colors.white,
            )
          ],
        ),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getHistorical(),
        child: Obx(() {
          if (controller.loading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: controller.currencies.length,
              itemBuilder: (_, i) {
                final currency = controller.currencies[i];
                return CurrencyCard(currency: currency);
              });
        }),
      ),
    );
  }
}
