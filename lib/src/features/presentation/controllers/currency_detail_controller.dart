import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tekus_test/src/core/error/failures.dart';
import 'package:tekus_test/src/core/usecase/usecase.dart';
import 'package:tekus_test/src/core/utils/utils.dart';
import 'package:tekus_test/src/features/domain/entities/currency_entity.dart';
import 'package:tekus_test/src/features/domain/entities/detail_currency_entity.dart';
import 'package:tekus_test/src/features/domain/usecases/get_detail_from_date.dart';
import 'package:tekus_test/src/features/domain/usecases/get_today_detail_usecase.dart';

class CurrencyDetailController extends GetxController {
  final GetDetailFromDateUseCase _getDetailFromDateUseCase;
  final GetTodayDetailUseCase _getTodayDetailUseCase;

  CurrencyDetailController({
    required GetDetailFromDateUseCase getDetailFromDateUseCase,
    required GetTodayDetailUseCase getTodayDetailUseCase,
  })  : _getDetailFromDateUseCase = getDetailFromDateUseCase,
        _getTodayDetailUseCase = getTodayDetailUseCase;

  RxBool loading = false.obs;
  late final CurrencyEntity currentCurrency;
  final Rx<DetailCurrencyEntity> _detail = const DetailCurrencyEntity().obs;
  DetailCurrencyEntity get detail => _detail.value;
  late Timer? timer;

  @override
  void onInit() {
    currentCurrency = Get.arguments;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    loading(true);
    await getCurrencyDetail();
    loading(false);
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  Future<void> getCurrencyDetail() async {
    Either<Failure, DetailCurrencyEntity> res;
    if (currentCurrency.dateFormated == 'Today') {
      res = await _getTodayDetailUseCase.call(NoParams());
      timer = Timer.periodic(const Duration(seconds: 60), (_) => getCurrencyDetail());
    } else {
      res = await _getDetailFromDateUseCase.call(currentCurrency.date);
    }
    res.fold((l) {
      showEitherError(l);
    }, (r) {
      _detail(r);
    });
  }
}
