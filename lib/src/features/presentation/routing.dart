import 'package:get/route_manager.dart';
import 'package:tekus_test/src/features/presentation/pages/detail/currency_detail_page.dart';
import 'package:tekus_test/src/features/presentation/pages/historical/historical_currency_page.dart';

class AppPages {
  static const String historicalCurrencyPage = HistoricalCurrencyPage.routeName;
  static const String currencyDetailPage = CurrencyDetailPage.routeName;
}

class AppRoutes {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppPages.historicalCurrencyPage,
      page: () => HistoricalCurrencyPage(),
    ),
    GetPage(
      name: AppPages.currencyDetailPage,
      page: () => CurrencyDetailPage(),
    ),
  ];
}
