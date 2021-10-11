import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekus_test/injection_container.dart';
import 'package:tekus_test/src/features/presentation/controllers/currency_detail_controller.dart';
import 'package:tekus_test/src/features/presentation/routing.dart';

class CurrencyDetailPage extends StatelessWidget {
  static const String routeName = "/currency_detail.page";
  CurrencyDetailPage({Key? key}) : super(key: key);

  final CurrencyDetailController controller = Get.put(di<CurrencyDetailController>());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(AppPages.historicalCurrencyPage);
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0XFF80096c),
        appBar: AppBar(
          backgroundColor: const Color(0XFF80096c),
          title: const Text(
            'Currency detail',
          ),
          leading: const BackButton(),
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.loading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              height: Get.height * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffe856cf),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset('assets/bitcoin_logo.png'),
                  const SizedBox(height: 30),
                  Text(
                    controller.currentCurrency.dateFormated ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.euro,
                              size: 40,
                              color: Colors.white,
                            ),
                            CustomText(text: controller.detail.eur?.price.toString() ?? ''),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomText(text: '\$'),
                            CustomText(text: controller.detail.usd?.price.toString() ?? ''),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomText(text: 'COP', size: 30),
                            Flexible(child: CustomText(text: controller.detail.cop?.price.toString() ?? '')),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  const CustomText({
    Key? key,
    this.text = '',
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}
