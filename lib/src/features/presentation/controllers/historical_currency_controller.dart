import 'dart:async';

import 'package:get/get.dart';
import 'package:tekus_test/src/core/usecase/usecase.dart';
import 'package:tekus_test/src/core/utils/utils.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/domain/usecases/get_historical_usecase.dart';
import 'package:tekus_test/src/features/domain/usecases/get_today_price_usecase.dart';

class HistoricalCurrencyController extends GetxController {
  final GetHistoricalUseCase _getHistoricalUseCase;
  final GetTodayPriceUseCase _getTodayPriceUseCase;

  HistoricalCurrencyController({
    required GetHistoricalUseCase getHistoricalUseCase,
    required GetTodayPriceUseCase getTodayPriceUseCase,
  })  : _getHistoricalUseCase = getHistoricalUseCase,
        _getTodayPriceUseCase = getTodayPriceUseCase;

  @override
  Future<void> onReady() async {
    await getHistorical();
    timer = Timer.periodic(const Duration(seconds: 60), (_) => _getTodayPrice());
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  RxBool loading = false.obs;

  RxList<CurrencyEntity> currencies = <CurrencyEntity>[].obs;
  late Timer? timer;

  Future<void> getHistorical() async {
    loading(true);
    await 1.delay();
    final res = await _getHistoricalUseCase.call(NoParams());
    res.fold((l) {
      showEitherError(l);
      loading(false);
    }, (r) {
      currencies.assignAll(r);
      loading(false);
    });
  }

  Future<void> _getTodayPrice() async {
    final res = await _getTodayPriceUseCase.call(NoParams());
    res.fold((l) {
      showEitherError(l);
    }, (r) {
      currencies.removeLast();
      currencies.add(r);
    });
  }
}
