import 'dart:convert';

import 'package:tekus_test/src/features/data/models/currency_model.dart';
import 'package:tekus_test/src/features/domain/entities/detail_currency_entity.dart';

class DetailCurrencyModel extends DetailCurrencyEntity {
  const DetailCurrencyModel({
    CurrencyModel? usd,
    CurrencyModel? cop,
    CurrencyModel? eur,
  }) : super(
          usd: usd,
          cop: cop,
          eur: eur,
        );

  factory DetailCurrencyModel.fromUsd(json) {
    final usdPrice = json["USD"];
    final eurPrice = json["EUR"];
    final usdModel = CurrencyModel(price: usdPrice);
    final eurModel = CurrencyModel(price: eurPrice);
    return DetailCurrencyModel(usd: usdModel, eur: eurModel);
  }

  factory DetailCurrencyModel.specificFromHistoric({
    resUsd,
    resCop,
    resEur,
  }) {
    final resUsdData = json.decode(resUsd.data);
    final resCopData = json.decode(resCop.data);
    final resEurData = json.decode(resEur.data);

    final resUsdModel = CurrencyModel.specificFromHistoric(resUsdData);
    final resCopModel = CurrencyModel.specificFromHistoric(resCopData);
    final resEurModel = CurrencyModel.specificFromHistoric(resEurData);
    return DetailCurrencyModel(
      usd: resUsdModel,
      cop: resCopModel,
      eur: resEurModel,
    );
  }
}
