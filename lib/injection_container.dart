import 'package:get_it/get_it.dart';
import 'package:tekus_test/src/features/data/datasource/currency_remote_datasource.dart';
import 'package:tekus_test/src/features/data/repositories/currency_repository_impl.dart';
import 'package:tekus_test/src/features/domain/repositories/currency_repository.dart';
import 'package:tekus_test/src/features/domain/usecases/get_detail_from_date.dart';
import 'package:tekus_test/src/features/domain/usecases/get_historical_usecase.dart';
import 'package:tekus_test/src/features/domain/usecases/get_today_detail_usecase.dart';
import 'package:tekus_test/src/features/domain/usecases/get_today_price_usecase.dart';
import 'package:tekus_test/src/features/presentation/controllers/currency_detail_controller.dart';
import 'package:tekus_test/src/features/presentation/controllers/historical_currency_controller.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(() => HistoricalCurrencyController(getHistoricalUseCase: di(), getTodayPriceUseCase: di()));
  di.registerFactory(() => CurrencyDetailController(getDetailFromDateUseCase: di(), getTodayDetailUseCase: di()));

  /**
   * USECASES
   */
  di.registerLazySingleton(() => GetHistoricalUseCase(di()));
  di.registerLazySingleton(() => GetDetailFromDateUseCase(di()));
  di.registerLazySingleton(() => GetTodayPriceUseCase(di()));
  di.registerLazySingleton(() => GetTodayDetailUseCase(di()));

  /**
   * REPOSITORIES 
   */
  di.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl(historicalDataSource: di()));

  /**
   * DATASOURCES
   */
  di.registerLazySingleton<CurrencyRemoteDataSource>(() => CurrencyRemoteDataSourceImpl());
}
